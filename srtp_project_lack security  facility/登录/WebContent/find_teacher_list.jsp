<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.List"%>
<%@page import="bao.Teacher"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style > 
 body{ 
      background-image:url(image/business-007.jpg); 
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
<title>所有教师信息</title>
<style type="text/css">
	td{font-size: 12px;}
	h2{margin: 0px}
</style>
</head>
<body>
	<table align="center" vertical-align="middle" width="450" border="1" height="180" bordercolor="burlywood" bgcolor="black" cellpadding="1" cellspacing="1">
		<tr bgcolor="burlywood">
			<td align="center" colspan="6">
				<h2>所有教师信息</h2>
			</td>
		</tr>
		<tr align="center" bgcolor="#e1ffc1" >
			<td><b>工号</b></td>
			<td><b>密码</b></td>
			<td><b>学院</b></td>
			<td><b>手机号码</b></td>
			<td><b>姓名</b></td>
			<td><b>电子邮箱</b></td>
		</tr>
			<%
				// 获取学生信息集合
					List<Teacher> list = (List<Teacher>)request.getAttribute("list");
					// 判断集合是否有效
					if(list == null || list.size() < 1){
						out.print("没有数据！");
					}else{
						// 遍历学生集合中的数据
						for(Teacher teacher : list){
			%>
				<tr align="center" bgcolor="white">
					<td><%=teacher.getId()%></td>
					<td><%=teacher.getPassword()%></td>
					<td><%=teacher.getSchool()%></td>
					<td><%=teacher.getMb()%></td>
					<td><%=teacher.getName()%></td>
					<td><%=teacher.getEmail()%></td>
				</tr>
			<%
					}
				}
			%>
	</table>
</body>
</html>