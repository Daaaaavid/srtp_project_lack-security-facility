<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<!DOCTYPE html >

<%@page import="java.lang.reflect.Field"%>
<%@page import="java.util.ArrayList"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
			<% 	
			//let' start the party !
			
			String xuehao[]=new String[600];     //申请调课学生的学号
			for(int i=0;i<600;i++){
				xuehao[i]="x";
			}
			String banji[]=new String[600];      //申请调课学生的班级
			for(int i=0;i<600;i++){
				banji[i]="x";
			}
			String jieguo[]=new String[600];      //申请调课学生的排课结果  结果为上课时间段
			for(int i=0;i<600;i++){
				jieguo[i]="x";
			}
			
			String time[]=new String[600];      //申请调课学生的可选时间
			for(int i=0;i<600;i++){
				time[i]="x";
			}
			String time2[]=new String[600];
			for(int i=0;i<600;i++){
				time2[i]="x";
			}
			String time3[]=new String[600];
			for(int i=0;i<600;i++){
				time3[i]="x";
			}
			
			String tiaoketime[]=new String[30];   //实验室课程时间
			for(int i=0;i<30;i++){
				tiaoketime[i]="x";
			}
			String tiaokeclass[]=new String[30];  //实验室课程时间对应的班级
			for(int i=0;i<30;i++){
				tiaokeclass[i]="x";
			}
			int tiaokenum[]=new int[30];    //实验室课程时间对应的班级的剩余人数
			
			int shenqing=0;    //申请调课人数
			int tiaoke=0;    //上课时间段个数
			
			
			
			try {
			// 加载数据库驱动，注册到驱动管理器
			Class.forName("com.mysql.cj.jdbc.Driver");
			// 数据库连接字符串
			String url = "jdbc:mysql://localhost:3306/mysql1";
			// 数据库用户名
			String username = "root";
			// 数据库密码
			String password = "123456789";
			// 创建Connection连接
			Connection conn = DriverManager.getConnection(url,username,password);
			// 获取Statement
			Statement stmt = conn.createStatement();
			// 获取学生信息的SQL语句
			String sql = "select * from tb_tiaokebiao";
			String sql2 = "select * from tb_tiaokebiao_number";
			// 执行查询
			ResultSet rs = stmt.executeQuery(sql);
			// 实例化List对象
			while(rs.next()){
				xuehao[shenqing]=rs.getString("id");
				banji[shenqing]=rs.getString("class");
				time[shenqing]=rs.getString("time1");
				time2[shenqing]=rs.getString("time2");
				time3[shenqing]=rs.getString("time3");
				shenqing++;
				
				}	
			rs = stmt.executeQuery(sql2);
			while(rs.next()){
				tiaokenum[tiaoke]=rs.getInt("number");
				tiaokeclass[tiaoke]=rs.getString("class");
				tiaoketime[tiaoke]=rs.getString("time");
				tiaoke++;
				
				}	
			
			
			for(int i=0;i<shenqing;i++){
				for(int j=0;j<tiaoke;j++){
					if(banji[i].equals(tiaokeclass[j])){
						tiaokenum[j]-=1;
						break;
					}
				}
			}
			int jishu=0;    //记录当前申请调整时间的学生
			int sx[]=new int[600];  //记录当前调整时间的优先级（time1，time2，time3）
			for(int i=0;i<600;i++){
				if(i<shenqing)
				sx[i]=0;
				else sx[i]=-1;     //-1表示超出范围
			}
			int anpai=-1;
			
			
			
			int zuida=-1;          //zuida是第一次安排时间时循环到jishu为最大时的记录，在第二次安排的循环时会再次使用。
			
			
			
			//开始安排学生    第一次安排，如全部学生均可安排则直接入库
			while(jishu<shenqing&&jishu>=0){

				if(jishu>zuida)
					zuida=jishu;
					
			if(sx[jishu]==0){                //如果还没有安排上课时间
				for(int i=0;i<tiaoke;i++){   //从所有时间中找与第一选择相匹配的时间
					if(time[jishu].equals(tiaoketime[i])){ //找到与第一选择相匹配的时间段
						anpai=i;
					    break;
					}
				}

					if(tiaokenum[anpai]<30){         //此时间正好有空余
						tiaokenum[anpai]++;
						   jieguo[jishu]=tiaoketime[anpai];
						   sx[jishu]+=1;
						   jishu++;
						    continue;
						}
						else {        //第一选择时间段没有空余
							sx[jishu]+=1;
								for(int i=0;i<tiaoke;i++){   //从所有时间中找与第二选择相匹配的时间
									if(tiaoketime[i].equals(time2[jishu])){   //找到与第二选择相匹配的时间段
										anpai=i;
									    break;
									}
								}
										if(tiaokenum[anpai]<30){         //此时间正好有空余
											tiaokenum[anpai]++;
										    jieguo[jishu]=tiaoketime[anpai];
										    sx[jishu]+=1;
										    jishu++;
										    continue;
										}
										else{        //第二选择时间段没有空余
											sx[jishu]+=1;
											for(int i=0;i<tiaoke;i++){   //从所有时间中找与第三选择相匹配的时间
												if(tiaoketime[i].equals(time3[jishu])){   //找到与第三选择相匹配的时间段
													anpai=i;
												    break;
												}
											}
													if(tiaokenum[anpai]<30){         //此时间正好有空余
														tiaokenum[anpai]++;
													    jieguo[jishu]=tiaoketime[anpai];
													    sx[jishu]+=1;
													    jishu++;
													    continue;
													}
													else{        //第三选择时间段没有空余，回退到上一状态
														
														sx[jishu]=0;
														jishu--;
														continue;
													}
										
									}//第二选择时间段没有空余   的大括号
							
						}//第一选择时间段没有空余   的大括号

						
				
			}//如果还没有安排上课时间  循环
				
			
			if(sx[jishu]==1){                //如果已安排上课时间为第一选择
			
								for(int i=0;i<tiaoke;i++){   //从所有时间中找与第二选择相匹配的时间
									if(tiaoketime[i].equals(time2[jishu])){   //找到与第二选择相匹配的时间段
										anpai=i;
									    break;
									}
								}
										if(tiaokenum[anpai]<30){         //此时间正好有空余
											tiaokenum[anpai]++;
										    jieguo[jishu]=tiaoketime[anpai];
										    sx[jishu]+=1;
										    jishu++;
										    continue;
										}
										else{        //第二选择时间段没有空余
											sx[jishu]+=1;
											for(int i=0;i<tiaoke;i++){   //从所有时间中找与第三选择相匹配的时间
												if(tiaoketime[i].equals(time3[jishu])){   //找到与第三选择相匹配的时间段
													anpai=i;
												    break;
												}
											}
													if(tiaokenum[anpai]<30){         //此时间正好有空余
														tiaokenum[anpai]++;
													    jieguo[jishu]=tiaoketime[anpai];
													    sx[jishu]+=1;
													    jishu++;
													    continue;
													}
													else{        //第三选择时间段没有空余，回退到上一状态
														
														sx[jishu]=0;
														jishu--;
														continue;
													}
										
									}//第二选择时间段没有空余   的大括号
							

						
				
			}//如果已安排上课时间为第一选择  循环
				
				
			
			if(sx[jishu]==2){                //如果已安排上课时间为第二选择

							for(int i=0;i<tiaoke;i++){   //从所有时间中找与第三选择相匹配的时间
								if(tiaoketime[i].equals(time3[jishu])){   //找到与第三选择相匹配的时间段
									anpai=i;
								    break;
								}
							}
									if(tiaokenum[anpai]<30){         //此时间正好有空余
										tiaokenum[anpai]++;
									    jieguo[jishu]=tiaoketime[anpai];
									    sx[jishu]+=1;
									    jishu++;
									    continue;
									}
									else{        //第三选择时间段没有空余，回退到上一状态
										
										sx[jishu]=0;
										jishu--;
										continue;
									}
						

}//如果已安排上课时间为第二选择  循环
			
			if(sx[jishu]==3){                //如果已安排上课时间为第三选择

				        //第三选择时间段已作废，回退到上一状态
							
							sx[jishu]=0;
							jishu--;
							continue;
			

}//如果已安排上课时间为第三选择  循环
			
			
			}//第一次安排学生结束
			
			if(jishu==shenqing)            //如每个学生都已安排时间
                    jishu=shenqing;            //开始数据入库
                    
                    
                    
                    
                    else{                  //开始第二次安排学生
                    	jishu=0;
                    sx[zuida]=-2;          //-2代表此学生已被删除，
                    for(int i=0;i<tiaoke;i++){   
    					if(banji[zuida].equals(tiaokeclass[i])){ 
    						jieguo[zuida]=tiaoketime[i];
    						tiaokenum[i]+=1;
    					}
    				}
                    zuida++;
                    
                    	//开始安排学生    第二次安排，将遇到问题导致回退的学生删除。
                    	while(zuida<shenqing){
            			while(jishu<shenqing&&jishu>=0){
            				if(sx[jishu]<0){
            					jishu++;
            					continue;
            				}
            				if(jishu>zuida)
            					zuida=jishu;
            					
            			if(sx[jishu]==0){                //如果还没有安排上课时间
            				for(int i=0;i<tiaoke;i++){   //从所有时间中找与第一选择相匹配的时间
            					if(tiaoketime[i].equals(time[jishu])){ //找到与第一选择相匹配的时间段
            						anpai=i;
            					    break;
            					}
            				}

            					if(tiaokenum[anpai]<30){         //此时间正好有空余
            						tiaokenum[anpai]++;
            						   jieguo[jishu]=tiaoketime[anpai];
            						   sx[jishu]+=1;
            						   jishu++;
            						    continue;
            						}
            						else {        //第一选择时间段没有空余
            							sx[jishu]+=1;
            								for(int i=0;i<tiaoke;i++){   //从所有时间中找与第二选择相匹配的时间
            									if(tiaoketime[i].equals(time2[jishu])){   //找到与第二选择相匹配的时间段
            										anpai=i;
            									    break;
            									}
            								}
            										if(tiaokenum[anpai]<30){         //此时间正好有空余
            											tiaokenum[anpai]++;
            										    jieguo[jishu]=tiaoketime[anpai];
            										    sx[jishu]+=1;
            										    jishu++;
            										    continue;
            										}
            										else{        //第二选择时间段没有空余
            											sx[jishu]+=1;
            											for(int i=0;i<tiaoke;i++){   //从所有时间中找与第三选择相匹配的时间
            												if(tiaoketime[i].equals(time3[jishu])){   //找到与第三选择相匹配的时间段
            													anpai=i;
            												    break;
            												}
            											}
            													if(tiaokenum[anpai]<30){         //此时间正好有空余
            														tiaokenum[anpai]++;
            													    jieguo[jishu]=tiaoketime[anpai];
            													    sx[jishu]+=1;
            													    jishu++;
            													    continue;
            													}
            													else{        //第三选择时间段没有空余，回退到上一状态
            														
            														sx[jishu]=0;
            														jishu--;
            												
            														if(jishu<0)
            					            							break;
            					            						else{
            					            						while(jishu>0){
            					            							if(sx[jishu]<0){
            					                        					jishu--;
            					                        				}
            					            							else break;
            					            							
            					            						}
            					            						if(jishu==0){
            					            							if(sx[jishu]<0){
            					                        					jishu--;
            					                        					break;
            					                        				}
            					            						}
            					            						}
            														continue;
            													}
            										
            									}//第二选择时间段没有空余   的大括号
            							
            						}//第一选择时间段没有空余   的大括号

            						
            				
            			}//如果还没有安排上课时间  循环
            				
            			
            			if(sx[jishu]==1){                //如果已安排上课时间为第一选择
            			
            								for(int i=0;i<tiaoke;i++){   //从所有时间中找与第二选择相匹配的时间
            									if(tiaoketime[i].equals(time2[jishu])){   //找到与第二选择相匹配的时间段
            										anpai=i;
            									    break;
            									}
            								}
            										if(tiaokenum[anpai]<30){         //此时间正好有空余
            											tiaokenum[anpai]++;
            										    jieguo[jishu]=tiaoketime[anpai];
            										    sx[jishu]+=1;
            										    jishu++;
            										    continue;
            										}
            										else{        //第二选择时间段没有空余
            											sx[jishu]+=1;
            											for(int i=0;i<tiaoke;i++){   //从所有时间中找与第三选择相匹配的时间
            												if(tiaoketime[i].equals(time3[jishu])){   //找到与第三选择相匹配的时间段
            													anpai=i;
            												    break;
            												}
            											}
            													if(tiaokenum[anpai]<30){         //此时间正好有空余
            														tiaokenum[anpai]++;
            													    jieguo[jishu]=tiaoketime[anpai];
            													    sx[jishu]+=1;
            													    jishu++;
            													    continue;
            													}
            													else{        //第三选择时间段没有空余，回退到上一状态
            														
            														sx[jishu]=0;
            														jishu--;
            														
            														if(jishu<0)
            					            							break;
            					            						else{
            					            						while(jishu>0){
            					            							if(sx[jishu]<0){
            					                        					jishu--;
            					                        				}
            					            							else break;
            					            							
            					            						}
            					            						if(jishu==0){
            					            							if(sx[jishu]<0){
            					                        					jishu--;
            					                        					break;
            					                        				}
            					            						}
            					            						}
            														continue;
            													}
            										
            									}//第二选择时间段没有空余   的大括号
            							

            						
            				
            			}//如果已安排上课时间为第一选择  循环
            				
            				
            			
            			if(sx[jishu]==2){                //如果已安排上课时间为第二选择

            							for(int i=0;i<tiaoke;i++){   //从所有时间中找与第三选择相匹配的时间
            								if(tiaoketime[i].equals(time3[jishu])){   //找到与第三选择相匹配的时间段
            									anpai=i;
            								    break;
            								}
            							}
            									if(tiaokenum[anpai]<30){         //此时间正好有空余
            										tiaokenum[anpai]++;
            									    jieguo[jishu]=tiaoketime[anpai];
            									    sx[jishu]+=1;
            									    jishu++;
            									    continue;
            									}
            									else{        //第三选择时间段没有空余，回退到上一状态
            										
            										sx[jishu]=0;
            										jishu--;
            										
            										if(jishu<0)
            	            							break;
            	            						else{
            	            						while(jishu>0){
            	            							if(sx[jishu]<0){
            	                        					jishu--;
            	                        				}
            	            							else break;
            	            							
            	            						}
            	            						if(jishu==0){
            	            							if(sx[jishu]<0){
            	                        					jishu--;
            	                        					break;
            	                        				}
            	            						}
            	            						}
            										continue;
            									}
            						

            }//如果已安排上课时间为第二选择  循环
            			
            			if(sx[jishu]==3){                //如果已安排上课时间为第三选择

            				        //第三选择时间段已作废，回退到上一状态
            							
            							sx[jishu]=0;
            							jishu--;
            						
            						
            						if(jishu<0)
            							break;
            						else{
            						while(jishu>0){
            							if(sx[jishu]<0){
                        					jishu--;
                        				}
            							else break;
            							
            						}
            						if(jishu==0){
            							if(sx[jishu]<0){
                        					jishu--;
                        					break;
                        				}
            						}
            						continue;
            						}

            }//如果已安排上课时间为第三选择  循环
            			
            			
            			}//第二次安排学生结束
            			if(jishu==shenqing)            //如每个学生都已安排时间
                            break;           //跳出第二次安排
            			jishu=0;
                        sx[zuida]=-2;          //-2代表此学生已被删除，
                        for(int i=0;i<tiaoke;i++){   
        					if(banji[zuida].equals(tiaokeclass[i])){
        						jieguo[zuida]=tiaoketime[i];
        						tiaokenum[i]+=1;
        					}
        				}
                        zuida++;
                    	}
                    	//开始数据入库！！！！
                    	
                    	
                    	
                    	
                    	
                    	
                    }     //第二次安排的条件语句的大括号
            String sql9 = "insert into tb_tiaoke_result(id,class,time) values(?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql9);
            for(int t=0;t<shenqing;t++){
            ps.setString(1, xuehao[t]);
            ps.setString(2, banji[t]);
            ps.setString(3, jieguo[t]);
            int row = ps.executeUpdate();
            }
			rs.close();		// 关闭ResultSet
			stmt.close();	// 关闭Statement
			conn.close();	// 关闭Connection
			ps.close();%>
			<div>数据已入库</div>
			<% 
			}catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}		

%>
</body>
</html>