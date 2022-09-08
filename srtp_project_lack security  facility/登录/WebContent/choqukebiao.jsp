<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>准备排课e</title>
</head>
<body>

<%
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
							
							rs.close();
							conn.close();
							%>
							<div style=line-height:200px; margin:30px;">
							<h2 align="center">
							<font color=blueviolet size=5px>已存在课表，更多信息请联系管理员</font>
						</h2>
						</div> 
						<% }
						else{%>
<div style=line-height:200px; margin:30px;">
<h2 align="center">
		<font color=blueviolet size=5px>请确认所有班级已上传课表后方可</font><a
			href="chouqukebiaoservlet_paike"><font color=deepskyblue size=5px>开始安排课程</font></a>
	</h2>
	</div>
	<%} %>
</body>
</html>