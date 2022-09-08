<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.List"%>
<%@page import="bao.Student"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style > 
 body{ 
      background-image:url(image/business-008.jpg); 
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
<title>所有学生信息</title>
<style type="text/css">
	form{margin: 0px;}
	td{font-size: 12px;}
	h2{margin: 2px}
</style>
<script type="text/javascript">

</script>
</head>
<body>
<table align="center" width="500" border="1" height="170" bordercolor="cornflower" bgcolor="black" cellpadding="1" cellspacing="1">
		<tr bgcolor="cornflower">
			<td align="center" colspan="7">
				<h2>所有学生信息</h2>
			</td>
		</tr>
		<tr align="center" bgcolor="#e1ffc1" >
			<td><b>学号</b></td>
			<td><b>密码</b></td>
			<td><b>学院</b></td>
			<td><b>教学班级</b></td>
			<td><b>姓名</b></td>
			<td><b>电子邮箱</b></td>
			<td><b>修改密码</b></td>
		</tr>
			<%
				// 获取图书信息集合
					List<Student> list = (List<Student>)request.getAttribute("list");
					// 判断集合是否有效
					if(list == null || list.size() < 1){
						out.print("没有数据！");
					}else{
						// 遍历图书集合中的数据
						for(Student student : list){
			%>
				<tr align="center" bgcolor="white">
					<td><%=student.getId()%></td>
					<td><%=student.getPassword()%></td>
					<td><%=student.getSchool()%></td>
					<td><%=student.getTc()%></td>
					<td><%=student.getName()%></td>
					<td><%=student.getEmail()%></td>
					<td>
						<form action="updateservlet" method="post" onsubmit="return check(this);">
							<input type="hidden" name="id" value="<%=student.getId()%>">
							<input type="text" name="password" size="4">
							<input type="submit" value="修改密码">
						</form>
					</td>
				</tr>
			<%

					}
				}
			%>
	</table>
</body>
</html>