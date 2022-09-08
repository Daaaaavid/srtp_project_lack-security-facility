<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<!DOCTYPE html >
<%@page import="java.util.List"%>
<%@page import="bao.kebiao"%>
<%@page import="bao.labkebiao"%>
<%@page import="java.lang.reflect.Field"%>
<%@page import="java.util.ArrayList"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>初步课程表</title>
</head>
<body>


<table border = 6 frame = void align = center width = 1050px height = 100px cellspacing = 0px cellpadding = 10px style="border: 1px solid green;">
   <tr height = 50px align = center>   
       <th width = 110px></th><th><font color = forestgreen size=6px>星期一</font></th><th><font color = forestgreen size=6px>星期二</font></th><th><font color = forestgreen size=6px>星期三</font></th><th><font color = forestgreen size=6px>星期四</font></th><th><font color = forestgreen size=6px>星期五</font></th>
   </tr>


<%



String kb[][]=new String[5][6];//课程表  已完成

int kb3[][]=new int[5][6];//某时间段可选择班级数目表  已完成
String kb2[][][]=new String[5][6][30];//时间段可选择班级表  已完成





int sl[]=new int[30];//班级空格数    已完成
String banji[]=new String[30];//班级表    已完成

String banji2[]=new String[30];//以班级空格数目少到多排列的班级表   已完成
int sl2[]=new int[30];//班级空格数少到多排列    已完成
 
for(int i=0;i<kb.length;i++){
	for(int j=0;j<kb[i].length;j++){
		kb[i][j] = "";
	}
}
for(int i=0;i<5;i++){
	for(int j=0;j<6;j++){
		kb3[i][j] =0;
	}
}
for(int i=0;i<sl.length;i++){
sl[i]=0;
}
//创建实验室课程表（最终版）
String kbmax[][]=new String[5][6];
for(int i=0;i<kbmax.length;i++){
	for(int j=0;j<kbmax[i].length;j++){
		kbmax[i][j] = "";
	}
}
//创建最终课程表副表，包括单双周
String kbmax2[][][]=new String[5][6][2];
for(int i=0;i<kbmax.length;i++){
	for(int j=0;j<kbmax2[i].length;j++){
		for(int k=0;k<kbmax2[i][j].length;k++){
		kbmax2[i][j][k] = "";
	}
}
}
				// 获取学生信息集合
					List<kebiao> list = (List<kebiao>)request.getAttribute("list");
					// 判断集合是否有效
					if(list == null || list.size() < 1)
					{
						out.print("没有数据！");
					}
					else{
						int ere=0;
						// 遍历学生集合中的数据
						for(kebiao kebiao1 : list){

				            Field[] fields = kebiao1.getClass().getDeclaredFields();  
				            for(int i=0; i<fields.length; i++)
				            {  
				                Field f = fields[i];  
				                f.setAccessible(true);
				                if(f.getName()=="tc"){
				                	
				                	banji[ere]=f.get(kebiao1).toString();
				                	continue;
				                }
				                
				                if(Integer.parseInt(f.get(kebiao1).toString())==0){
				                	
				                	continue;
				                }
				                if(Integer.parseInt(f.get(kebiao1).toString())==1){
				                	String q=f.getName();
				                	
				                	String w=q.substring(1,2);
				                	String w1=q.substring(2,3);
				                	int q1 = Integer.parseInt(w);
				                	int q2 = Integer.parseInt(w1);
				                	String uu=kebiao1.getTc();
                                    String c=kb[q1-1][q2-1];
                                    c=c+uu+" ";
                                    kb[q1-1][q2-1]=c;
                                    sl[ere]=sl[ere]+1;
				                }
				            }  //遍历属性for   
				            
				            
				            ere=ere+1;
						}//遍历集合for
						

						for(int i=0, kk=0;i<kb.length;i++){
							for(int j=0;j<kb[i].length;j++){
								kb2[i][j] = kb[i][j].split(" ");
								for(int o=0;o<kb2[i][j].length;o++){
								if(kb2[i][j].length==1)
										continue;
								else kk=kk+1;	

								
								}
								kb3[i][j]=kk;
								kk=0;
							}
						}
						
						int tmp1;
						String tmp2;
						sl2=sl.clone();
						banji2=banji.clone();
						for(int j=30;j>0;j--){

							for(int i=0;i<j-1;i++){

								if(sl2[i]>sl2[i+1]){
								tmp1=sl2[i+1];
								sl2[i+1]=sl2[i];
								sl2[i]=tmp1;

								tmp2=banji2[i+1];
								banji2[i+1]=banji2[i];
								banji2[i]=tmp2;
								}
							}
						}
						
						int cla=0;    //当前排课班级在banji2中的序号
						
						//排课开始,找到第一个排课的班级
						for(int i=0;i<30;i++)
						{
							if (sl2[i]==0)
								continue;
							else 
							{
								cla=i;
								break;
								}
							
						}
						//建立存放选择时间段的数组（1选择kb3中找到的第一个，2选择第二个，以此类推）
						int sjd[]=new int[30];
						//初始化数组，使非NULL班级的选择顺序为1
						for(int i=0;i<30;i++)
						{
							if (sl2[i]==0)
								sjd[i]=0;
							else 
							{
								sjd[i]=1;
								}
							
						}
						//建立sjd2数组，确定当前找到的空格的顺序。
						int sjd2[]=new int[30];
						//初始化数组，使非NULL班级的选择顺序为1
						for(int i=0;i<30;i++)
						{
							if (sl2[i]==0)
								sjd2[i]=0;
							else 
							{
								sjd2[i]=1;
								}
							
						}

						
						//找到kb3中的最大值
						int zuida=0;
						for(int i=0;i<5;i++){
							for(int j=0;j<6;j++){
								if(zuida<kb3[i][j])
									zuida=kb3[i][j];
							}
						}
						//找到kb3中除0外的最小值
						int zuixiao=30;
						for(int i=0;i<5;i++){
							for(int j=0;j<6;j++){
								if(zuixiao>kb3[i][j]&&kb3[i][j]!=0)
									zuixiao=kb3[i][j];
							}
						}
						//创建实验室空余时间表，每次排课都要判断所选时间段是否在此表中
						int kongyu[][]=new int[5][6];
						//0为空余，1为已占用
						for(int i=0;i<5;i++){
							for(int j=0;j<6;j++){
									kongyu[i][j]=0;
							}
						}
	
						//排课大循环开始
						
						//kk为查出kb3中除0外的最小值,此为排第一个班级的方法，
						//
						int cla2=cla-1;
						while(cla<30&&cla>cla2){
							//System.out.println(cla);
						breakPoint1:
						for(int kk=zuixiao;kk<=zuida;kk++){
		
							
							for(int i=0;i<5;i++){
								for(int j=0;j<6;j++){
									if(j==0||j==3||j==5)
										continue;
									if(kb3[i][j]>kk||kb3[i][j]<kk)
										continue;
									else
										for(int k=0;k<kb3[i][j];k++){
											if(banji2[cla].equals(kb2[i][j][k]))
											{
												//System.out.println(kb2[i][j][k]);
												if(kongyu[i][j]==0)
												{
													if(sjd[cla]==sjd2[cla]){
														
														kbmax2[i][j][kongyu[i][j]]=banji2[cla];
														kongyu[i][j]+=1;
														//System.out.println(kbmax[i][j]);
														//System.out.println(sjd2[cla]);
														cla++;
														
														break breakPoint1;
													}
													else{
														sjd2[cla]++;
													}
	
												}
												else if(kongyu[i][j]==1)
												{
													if(sjd[cla]==sjd2[cla]){
														kbmax2[i][j][kongyu[i][j]]=banji2[cla];
														kongyu[i][j]+=1;
														//System.out.println(kbmax[i][j]);
														//System.out.println(sjd2[cla]);
														cla++;
														
														break breakPoint1;
													}
													else{
														sjd2[cla]++;
													}
	
												}
												else break;
											}
										}
									
									
									
								}
							}
							 if(kk==zuida){
								for(int i=0;i<5;i++){
									for(int j=0;j<6;j++){
										if(kbmax2[i][j][0]==banji2[cla]){
											kbmax2[i][j][0]="";
											kongyu[i][j]-=1;
										}
										if(kbmax2[i][j][1]==banji2[cla]){
											kbmax2[i][j][1]="";
											kongyu[i][j]-=1;
										}
									}
								}
								cla--;
								sjd[cla]++;
							} 
		
							
							
						}//kk++循环

						
						//循环结束时初始化
						for(int i=0;i<30;i++)
						{
							if (sl2[i]==0)
								sjd2[i]=0;
							else 
							{
								sjd2[i]=1;
								}
							
						}
						for(int i=cla+1;i<30;i++)
						{
							sjd[i]=1;

						}
						}//while循环
						
//开始入库
						for(int i=0;i<5;i++){
							for(int j=0;j<6;j++){
								kbmax[i][j]=kbmax2[i][j][0]+"(单周)"+kbmax2[i][j][1]+"(双周)";
								
							}
						}
						
						int shuliang[][][]=new int[5][6][2];
						for(int i=0;i<5;i++){
							for(int j=0;j<6;j++){
								if(kbmax2[i][j][0]=="")
									shuliang[i][j][0]=0;
								else shuliang[i][j][0]=30;
								
								if(kbmax2[i][j][1]=="")
									shuliang[i][j][1]=0;
								else shuliang[i][j][1]=30;
								
							}
						}
						
						
						
						
						String xueqi2="2021FALL双周";
						String xueqi1="2021FALL单周";
						
						
						Class.forName("com.mysql.cj.jdbc.Driver");
						// 数据库连接字符串
						String url = "jdbc:mysql://localhost:3306/mysql1";
						// 数据库用户名
						String username = "root";
						// 数据库密码
						String sqpassword = "123456789";
						// 创建Connection连接
						Connection conn = DriverManager.getConnection(url,username,sqpassword);
						Statement stmt = conn.createStatement();

						
						
						
						
						// 执行查询
						ResultSet rs = stmt.executeQuery("select * from tb_lab_timetable where term='"+xueqi2+"' or term='"+xueqi1+"'");
						if(rs.next()){
							System.out.print("已存在课表");
							rs.close();
							conn.close();
						}
						else{
						
						
						
						String sql = "insert into tb_lab_timetable(term,z11,z12,z13,z14,z15,z16,z21,z22,z23,z24,z25,z26,z31,z32,z33,z34,z35,z36,z41,z42,z43,z44,z45,z46,z51,z52,z53,z54,z55,z56) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
						
						PreparedStatement ps = conn.prepareStatement(sql);
						ps.setString(1,xueqi1);

						ps.setString(2, kbmax2[0][0][0]);
						ps.setString(3, kbmax2[0][1][0]);
						ps.setString(4, kbmax2[0][2][0]);
						ps.setString(5, kbmax2[0][3][0]);
						ps.setString(6, kbmax2[0][4][0]);
						ps.setString(7, kbmax2[0][5][0]);
						
						ps.setString(8, kbmax2[1][0][0]);
						ps.setString(9, kbmax2[1][1][0]);
						ps.setString(10, kbmax2[1][2][0]);
						ps.setString(11, kbmax2[1][3][0]);
						ps.setString(12, kbmax2[1][4][0]);
						ps.setString(13, kbmax2[1][5][0]);
						
						ps.setString(14, kbmax2[2][0][0]);
						ps.setString(15, kbmax2[2][1][0]);
						ps.setString(16, kbmax2[2][2][0]);
						ps.setString(17, kbmax2[2][3][0]);
						ps.setString(18, kbmax2[2][4][0]);
						ps.setString(19, kbmax2[2][5][0]);
						
						ps.setString(20, kbmax2[3][0][0]);
						ps.setString(21, kbmax2[3][1][0]);
						ps.setString(22, kbmax2[3][2][0]);
						ps.setString(23, kbmax2[3][3][0]);
						ps.setString(24, kbmax2[3][4][0]);
						ps.setString(25, kbmax2[3][5][0]);
						
						ps.setString(26, kbmax2[4][0][0]);
						ps.setString(27, kbmax2[4][1][0]);
						ps.setString(28, kbmax2[4][2][0]);
						ps.setString(29, kbmax2[4][3][0]);
						ps.setString(30, kbmax2[4][4][0]);
						ps.setString(31, kbmax2[4][5][0]);
						

						int row = ps.executeUpdate();
						// 判断是否更新成功

						
						
						
						
						
						
						// 创建Connection连接
						Connection con = DriverManager.getConnection(url,username,sqpassword);
						
						String sql1 = "insert into tb_lab_timetable(term,z11,z12,z13,z14,z15,z16,z21,z22,z23,z24,z25,z26,z31,z32,z33,z34,z35,z36,z41,z42,z43,z44,z45,z46,z51,z52,z53,z54,z55,z56) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
						
						PreparedStatement ps2 = con.prepareStatement(sql1);
						ps2.setString(1,xueqi2);

						ps2.setString(2, kbmax2[0][0][1]);
						ps2.setString(3, kbmax2[0][1][1]);
						ps2.setString(4, kbmax2[0][2][1]);
						ps2.setString(5, kbmax2[0][3][1]);
						ps2.setString(6, kbmax2[0][4][1]);
						ps2.setString(7, kbmax2[0][5][1]);
						
						ps2.setString(8, kbmax2[1][0][1]);
						ps2.setString(9, kbmax2[1][1][1]);
						ps2.setString(10, kbmax2[1][2][1]);
						ps2.setString(11, kbmax2[1][3][1]);
						ps2.setString(12, kbmax2[1][4][1]);
						ps2.setString(13, kbmax2[1][5][1]);
						
						ps2.setString(14, kbmax2[2][0][1]);
						ps2.setString(15, kbmax2[2][1][1]);
						ps2.setString(16, kbmax2[2][2][1]);
						ps2.setString(17, kbmax2[2][3][1]);
						ps2.setString(18, kbmax2[2][4][1]);
						ps2.setString(19, kbmax2[2][5][1]);
						
						ps2.setString(20, kbmax2[3][0][1]);
						ps2.setString(21, kbmax2[3][1][1]);
						ps2.setString(22, kbmax2[3][2][1]);
						ps2.setString(23, kbmax2[3][3][1]);
						ps2.setString(24, kbmax2[3][4][1]);
						ps2.setString(25, kbmax2[3][5][1]);
						
						ps2.setString(26, kbmax2[4][0][1]);
						ps2.setString(27, kbmax2[4][1][1]);
						ps2.setString(28, kbmax2[4][2][1]);
						ps2.setString(29, kbmax2[4][3][1]);
						ps2.setString(30, kbmax2[4][4][1]);
						ps2.setString(31, kbmax2[4][5][1]);
						

						int row2 = ps2.executeUpdate();

						//向tb_lab_timetable_number传入数据
												// 创建Connection连接
						Connection co = DriverManager.getConnection(url,username,sqpassword);
						
						String sq = "insert into tb_lab_timetable_number(term,z11,z12,z13,z14,z15,z16,z21,z22,z23,z24,z25,z26,z31,z32,z33,z34,z35,z36,z41,z42,z43,z44,z45,z46,z51,z52,z53,z54,z55,z56) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
						
						PreparedStatement p = co.prepareStatement(sq);
						p.setString(1,xueqi2);
						p.setInt(2, shuliang[0][0][1]);
						p.setInt(3, shuliang[0][1][1]);
						p.setInt(4, shuliang[0][2][1]);
						p.setInt(5, shuliang[0][3][1]);
						p.setInt(6, shuliang[0][4][1]);
						p.setInt(7, shuliang[0][5][1]);
						
						p.setInt(8, shuliang[1][0][1]);
						p.setInt(9, shuliang[1][1][1]);
						p.setInt(10, shuliang[1][2][1]);
						p.setInt(11, shuliang[1][3][1]);
						p.setInt(12, shuliang[1][4][1]);
						p.setInt(13, shuliang[1][5][1]);
						
						p.setInt(14, shuliang[2][0][1]);
						p.setInt(15, shuliang[2][1][1]);
						p.setInt(16, shuliang[2][2][1]);
						p.setInt(17, shuliang[2][3][1]);
						p.setInt(18, shuliang[2][4][1]);
						p.setInt(19, shuliang[2][5][1]);
						
						p.setInt(20, shuliang[3][0][1]);
						p.setInt(21, shuliang[3][1][1]);
						p.setInt(22, shuliang[3][2][1]);
						p.setInt(23, shuliang[3][3][1]);
						p.setInt(24, shuliang[3][4][1]);
						p.setInt(25, shuliang[3][5][1]);
						
						p.setInt(26, shuliang[4][0][1]);
						p.setInt(27, shuliang[4][1][1]);
						p.setInt(28, shuliang[4][2][1]);
						p.setInt(29, shuliang[4][3][1]);
						p.setInt(30, shuliang[4][4][1]);
						p.setInt(31, shuliang[4][5][1]);
						
						int row3 = p.executeUpdate();
						
				
						// 创建Connection连接
						Connection co3 = DriverManager.getConnection(url,username,sqpassword);
						
						String sq3 = "insert into tb_lab_timetable_number(term,z11,z12,z13,z14,z15,z16,z21,z22,z23,z24,z25,z26,z31,z32,z33,z34,z35,z36,z41,z42,z43,z44,z45,z46,z51,z52,z53,z54,z55,z56) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
						
						PreparedStatement p3 = co3.prepareStatement(sq3);
						
						p3.setString(1,xueqi1);
						p3.setInt(2, shuliang[0][0][0]);
						p3.setInt(3, shuliang[0][1][0]);
						p3.setInt(4, shuliang[0][2][0]);
						p3.setInt(5, shuliang[0][3][0]);
						p3.setInt(6, shuliang[0][4][0]);
						p3.setInt(7, shuliang[0][5][0]);
						
						p3.setInt(8, shuliang[1][0][0]);
						p3.setInt(9, shuliang[1][1][0]);
						p3.setInt(10, shuliang[1][2][0]);
						p3.setInt(11, shuliang[1][3][0]);
						p3.setInt(12, shuliang[1][4][0]);
						p3.setInt(13, shuliang[1][5][0]);
						
						p3.setInt(14, shuliang[2][0][0]);
						p3.setInt(15, shuliang[2][1][0]);
						p3.setInt(16, shuliang[2][2][0]);
						p3.setInt(17, shuliang[2][3][0]);
						p3.setInt(18, shuliang[2][4][0]);
						p3.setInt(19, shuliang[2][5][0]);
						
						p3.setInt(20, shuliang[3][0][0]);
						p3.setInt(21, shuliang[3][1][0]);
						p3.setInt(22, shuliang[3][2][0]);
						p3.setInt(23, shuliang[3][3][0]);
						p3.setInt(24, shuliang[3][4][0]);
						p3.setInt(25, shuliang[3][5][0]);
						
						p3.setInt(26, shuliang[4][0][0]);
						p3.setInt(27, shuliang[4][1][0]);
						p3.setInt(28, shuliang[4][2][0]);
						p3.setInt(29, shuliang[4][3][0]);
						p3.setInt(30, shuliang[4][4][0]);
						p3.setInt(31, shuliang[4][5][0]);
						

						int row4 = p3.executeUpdate();
						
						
						
						
						//输入课程人数、时间信息
						int number=0;
int i=0;
String aa[][]=new String[2][31];
String banjishijian[]=new String[30];

// 数据库密码
String password = "123456789";
// 创建Connection连接
Connection conn9 = DriverManager.getConnection(url,username,password);
// 获取Statement
Statement stmt9 = conn9.createStatement();
// 获取学生信息的SQL语句
String sql9 = "select * from tb_classes";
String sql2 = "select * from tb_lab_timetable";
String sql3 = "insert into tb_tiaokebiao_number(time,class,number) values(?,?,?)";
// 执行查询
ResultSet rs9 = stmt9.executeQuery(sql9);
// 实例化List对象
List<labkebiao> list2 = new ArrayList<labkebiao>();
while(rs9.next()){
	number++;
}
rs9 = stmt9.executeQuery(sql2);
PreparedStatement ps9 = conn9.prepareStatement(sql3);
while(rs9.next()){
labkebiao kebiao1 = new labkebiao();
kebiao1.setTerm(rs9.getString("term"));

kebiao1.setz11(rs9.getString("z11"));
kebiao1.setz12(rs9.getString("z12"));
kebiao1.setz13(rs9.getString("z13"));
kebiao1.setz14(rs9.getString("z14"));
kebiao1.setz15(rs9.getString("z15"));
kebiao1.setz16(rs9.getString("z16"));

kebiao1.setz21(rs9.getString("z21"));
kebiao1.setz22(rs9.getString("z22"));
kebiao1.setz23(rs9.getString("z23"));
kebiao1.setz24(rs9.getString("z24"));
kebiao1.setz25(rs9.getString("z25"));
kebiao1.setz26(rs9.getString("z26"));

kebiao1.setz31(rs9.getString("z31"));
kebiao1.setz32(rs9.getString("z32"));
kebiao1.setz33(rs9.getString("z33"));
kebiao1.setz34(rs9.getString("z34"));
kebiao1.setz35(rs9.getString("z35"));
kebiao1.setz36(rs9.getString("z36"));

kebiao1.setz41(rs9.getString("z41"));
kebiao1.setz42(rs9.getString("z42"));
kebiao1.setz43(rs9.getString("z43"));
kebiao1.setz44(rs9.getString("z44"));
kebiao1.setz45(rs9.getString("z45"));
kebiao1.setz46(rs9.getString("z46"));

kebiao1.setz51(rs9.getString("z51"));
kebiao1.setz52(rs9.getString("z52"));
kebiao1.setz53(rs9.getString("z53"));
kebiao1.setz54(rs9.getString("z54"));
kebiao1.setz55(rs9.getString("z55"));
kebiao1.setz56(rs9.getString("z56"));

list2.add(kebiao1);
}

for(labkebiao kebiao1 : list2){
	aa[i][0]=kebiao1.getTerm();
	aa[i][1]=kebiao1.getz11();
	aa[i][2]=kebiao1.getz21();
	aa[i][3]=kebiao1.getz31();
	aa[i][4]=kebiao1.getz41();
	aa[i][5]=kebiao1.getz51();
	
	
	aa[i][6]=kebiao1.getz12();
	aa[i][7]=kebiao1.getz22();
	aa[i][8]=kebiao1.getz32();
	aa[i][9]=kebiao1.getz42();
	aa[i][10]=kebiao1.getz52();
	
	aa[i][11]=kebiao1.getz13();
	aa[i][12]=kebiao1.getz23();
	aa[i][13]=kebiao1.getz33();
	aa[i][14]=kebiao1.getz43();
	aa[i][15]=kebiao1.getz53();
	
	aa[i][16]=kebiao1.getz14();
	aa[i][17]=kebiao1.getz24();
	aa[i][18]=kebiao1.getz34();
	aa[i][19]=kebiao1.getz44();
	aa[i][20]=kebiao1.getz54();
	
	aa[i][21]=kebiao1.getz15();
	aa[i][22]=kebiao1.getz25();
	aa[i][23]=kebiao1.getz35();
	aa[i][24]=kebiao1.getz45();
	aa[i][25]=kebiao1.getz55();
	
	aa[i][26]=kebiao1.getz16();
	aa[i][27]=kebiao1.getz26();
	aa[i][28]=kebiao1.getz36();
	aa[i][29]=kebiao1.getz46();
	aa[i][30]=kebiao1.getz56();
	
	i=i+1;
}
//System.out.println(number);
String keshi[]=new String[number];
int bjsj=0;
int jp=0;
for(int j=0;j<2;j++){
	for(int k=1;k<31;k++){
		if(!(aa[j][k].equals(""))){
			banjishijian[bjsj]=aa[j][k];
			if((k)%5==1)
				keshi[jp]=aa[j][0]+"周一第";
			else if((k)%5==2)
				keshi[jp]=aa[j][0]+"周二第";
			else if((k)%5==3)
				keshi[jp]=aa[j][0]+"周三第";
			else if((k)%5==4)
				keshi[jp]=aa[j][0]+"周四第";
			else 
				keshi[jp]=aa[j][0]+"周五第";
				
				
			if((k-1)/5+1==1)
				keshi[jp]+="一节";
			else if((k-1)/5+1==2)
			keshi[jp]+="二节";
			else if((k-1)/5+1==3)
				keshi[jp]+="三节";
			else if((k-1)/5+1==4)
				keshi[jp]+="四节";
			else if((k-1)/5+1==5)
				keshi[jp]+="五节";
			else if((k-1)/5+1==6)
				keshi[jp]+="六节";
			
				
			
			//System.out.println(keshi[jp]);
			jp++;
			bjsj++;
		}
	}
}
int numman=30;
int qw=0;
int row9=0;
for(;qw<number;qw++){
ps9.setString(1, keshi[qw]);
ps9.setString(2, banjishijian[qw]);
// 对SQL语句中的第2个参数赋值
ps9.setInt(3, numman);
row9 = ps9.executeUpdate();
}
conn9.close();
rs9.close();
ps9.close();


						//关闭资源
						ps.close();
						p.close();
						p3.close();
						
						conn.close();
						
						stmt.close();
						stmt9.close();
						
						ps2.close();
						
						
						co3.close();
						con.close();
						co.close();
						rs.close();
						}
					}//else
					
				
			%>
<tr height = 160px align = center>   
    <td ><font ><b>第一节</b></font></td><td><%=kbmax[0][0]%></td><td><%=kbmax[1][0]%></td><td><%=kbmax[2][0]%></td><td><%=kbmax[3][0]%></td><td><%=kbmax[4][0]%></td>
   </tr>
   <tr height = 160px align = center>   
    <td ><font ><b>第二节</b></font></td><td><%=kbmax[0][1]%></td><td><%=kbmax[1][1]%></td><td><%=kbmax[2][1]%></td><td><%=kbmax[3][1]%></td><td><%=kbmax[4][1]%></td>
   </tr>
      <tr height = 160px align = center>   
    <td ><font ><b>第三节</b></font></td><td><%=kbmax[0][2]%></td><td><%=kbmax[1][2]%></td><td><%=kbmax[2][2]%></td><td><%=kbmax[3][2]%></td><td><%=kbmax[4][2]%></td>
   </tr>

   <tr height = 160px align = center>   
    <td ><font ><b>第四节</b></font></td><td><%=kbmax[0][3]%></td><td><%=kbmax[1][3]%></td><td><%=kbmax[2][3]%></td><td><%=kbmax[3][3]%></td><td><%=kbmax[4][3]%></td>
   </tr>
   <tr height = 160px align = center>   
    <td ><font ><b>第五节</b></font></td><td><%=kbmax[0][4]%></td><td><%=kbmax[1][4]%></td><td><%=kbmax[2][4]%></td><td><%=kbmax[3][4]%></td><td><%=kbmax[4][4]%></td>
   </tr>
   <tr height = 160px align = center>   
    <td ><font ><b>第六节</b></font></td><td><%=kbmax[0][5]%></td><td><%=kbmax[1][5]%></td><td><%=kbmax[2][5]%></td><td><%=kbmax[3][5]%></td><td><%=kbmax[4][5]%></td>
   </tr>
   <table border = 1 frame = void align = center width = 1050px height = 100px cellspacing = 0px cellpadding = 10px style="border: 1px solid green;">
   
  <tr height = 50px align = center><th width = 110px></th><th><font color = forestgreen size=6px>结果已入库。</font></th></tr>
</table>
</table>



</body>
</html>