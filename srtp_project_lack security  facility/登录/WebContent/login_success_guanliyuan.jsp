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
      background-image:url(image/business-033.jpg); 
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
<title>管理员页面</title>
</head>
<body>

<div style=line-height:200px; margin:30px;">
<h2 align="center">
		<font color=blueviolet size=5px>查看所有学生请点击</font><a
			href="findservlet_showlist"><font color=deepskyblue size=5px>查看学生信息</font></a>
	</h2>
	<h2 align="center">
		<font color=blueviolet size=5px>修改学生密码请点击</font><a
			href="findservlet_changepwd"><font color=deepskyblue size=5px>修改学生密码</font></a>
	</h2>
	<h2 align="center">
		<font color=blueviolet size=5px>添加课程表请点击</font><a
			href="add_class.jsp"><font color=deepskyblue size=5px>添加课程表</font></a>
	</h2>
	<h2 align="center">
		<font color=blueviolet size=5px>查看所有教师请点击</font><a
			href="findservlet_showlist_teachers"><font color=deepskyblue size=5px>查看教师信息</font></a>
	</h2>
	</div>
</body>
</html>