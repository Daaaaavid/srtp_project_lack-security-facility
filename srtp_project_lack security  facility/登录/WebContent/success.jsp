<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style > 
 body{ 
      background-image:url(image/business-028.jpg); 
      background-origin:content;
      background-size:cover;
      background-repeat:no-repeat; 

 } 
  body{
margin:0 auto;
text-align:center;
valign:middle;
}
 </style>
<title>北京科技大学数电实验</title>
<link rel="shortcut icon" type="image/jpg" href="image/3ac79f3df8dcd100baa1bf0f4ac15010b912c8fc81c1.jpg">
</head>
<body>
	<jsp:useBean id="student" class="bao.Student"></jsp:useBean>
	<%
		try{
			// 加载数据库驱动，注册到驱动管理器
						Class.forName("com.mysql.cj.jdbc.Driver");
						// 数据库连接字符串
						String url = "jdbc:mysql://localhost:3306/mysql1";
						// 数据库用户名
						String username = "root";
						// 数据库密码
						String sqpassword = "123456789";
						// 创建Connection连接
						Connection con = DriverManager.getConnection(url,username,sqpassword);
						 String name = request.getParameter("id").trim();
						 String password = request.getParameter("password").trim();
						// 获取Statement
							Statement stmt = con.createStatement();
							// 添加图书信息的SQL语句
							String sql = "select * from tb_students";
							// 执行查询
							ResultSet rs = stmt.executeQuery("select * from tb_students where id='"+name+"'");
			if(rs.next()){
				rs=stmt.executeQuery("select * from tb_students where id='"+name+"' and password='"+password+"'");
				if(rs.next()){
					%>


				    <div style=line-height:100px; margin:30px;>
				    <font color=olive size=25px>欢迎，<%=name%></font>
				    </div>
				    
				    
				    <div style="line-height:200px; margin:30px; background:#483D8B; width:600px; margin:0 auto; color:#F0E68C">
				    <font color=indianred size=50px>查看班级预排课结果请点击</font><a
							href="chouqukebiaoservlet_paikewancheng"><font color=deepskyblue size=50px>查看</font></a>
				    </div>
				    
				    
				    <div style="line-height:250px; margin:30px; background:#D3D3D3; width:600px; margin:0 auto; color:#F0E68C">
				    <font color=darkorange size=50px>申请调整上课时间请</font>
				    <a href="tiaozhengshijian.jsp?id=<%=name%>"><font color=deepskyblue size=50px>点击</font></a>
				    </div>
				    
				    <div style="line-height:200px; margin:30px; background:#66CDAA; width:600px; margin:0 auto; color:#F0E68C">
				    <font color=darkorange size=50px>敬请期待</font>
				    </div>
				    
				    <div style="line-height:200px; margin:30px; background:#90EE90; width:600px; margin:0 auto; color:#F0E68C">
				    <font color=darkorange size=50px>敬请期待</font>
				    </div>
				    
				    <div style="line-height:200px; margin:30px; background:#808080; width:600px; margin:0 auto; color:#F0E68C">
				    <font color=darkorange size=50px>敬请期待</font>
				    </div>
				    
				    
				    
				    
				    
				    
				   

					<% 

				}else{
					%>


				    <div style=line-height:600px; margin:30px;">
				    <font color=blueviolet size=50px>密码输入错误！请重新</font><a
							href="index.jsp"><font color=deepskyblue size=50px>登录</font></a>！
				    </div>
				   

					<% 

				}
			}else{
				%>


			    <div style=line-height:600px; margin:30px;">
			    <font color=blueviolet size=50px>用户不存在！请点击</font><a
						href="registered.jsp.jsp"><font color=deepskyblue size=50px>注册</font></a>！
			    </div>
			   

				<% 
	
			}

						// 关闭Connection，释放资源
						con.close();
						rs.close();
						stmt.close();
		}catch(Exception e){
			out.print(e);
		}
	%>

</body>

</html>