<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.List"%>
<%@page import="bao.kebiao"%>
<%@page import="bao.labkebiao"%>
<%@page import="java.lang.reflect.Field"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>选择其他时间</title>
</head>

<body>
<%

String name=request.getParameter("id");
Class.forName("com.mysql.cj.jdbc.Driver");
// 数据库连接字符串
String url = "jdbc:mysql://localhost:3306/mysql1";
// 数据库用户名
String username = "root";
// 数据库密码
String password = "123456789";
Connection conn = DriverManager.getConnection(url,username,password);
Statement stmt = conn.createStatement();

ResultSet rs = stmt.executeQuery("select * from tb_tiaokebiao where id='"+name+"'");
if(rs.next()){
	System.out.print("用户已上传");
	rs.close();
	conn.close();
	%>
	<div style=line-height:200px; margin:30px;">
	<h2 align="center">
	<font color=blueviolet size=5px>用户<%=name %>已上传，更多信息请联系管理员</font>
</h2>
</div> 
<% 
}
else{

int number=0;
int count=0;
String keshi[]=new String[30];
// 创建Connection连接

String sql2 = "select * from tb_tiaokebiao_number";
ResultSet rs9 = stmt.executeQuery(sql2);
while(rs9.next()){
	number++;
	keshi[count]=rs9.getString("time");
	count++;
}
rs.close();
rs9.close();
conn.close();
%>
<div style=line-height:100px; margin:30px;">
				    <font color=olive size=45px>欢迎<%=name%>，请选择新的上课时间</font>
				    </div>
				    
				    
				    <form action="chuli.jsp?id=<%=name%>" method="post" onsubmit="return check(this);">
		<table align="center" style="width:600px;height:80px;background:deepskyblue;color:green;">
			<tr align="right" >
		 		<td><font size="5">请选择时间（必选）:</font></td>
				<td><select name=diyi size="1" required>
				<option value="" ></option>
				<%int counter1=0; 
				for(;counter1<number;counter1++){
				%>
  <option value=<%=keshi[counter1] %> ><%=keshi[counter1] %></option>
  <%} %>


</select>
				</td>

			</tr>
			
			<tr align="right" >
		 		<td><font size="5">请选择时间（可选）:</font></td>
				<td><select name=dier size="1" >
				<option value="" ></option>
				<% counter1=0; 
				for(;counter1<number;counter1++){
				%>
  <option value=<%=keshi[counter1] %> ><%=keshi[counter1] %></option>
  <%} %>


</select>
				</td>

			</tr>
			
			<tr align="right" >
		 		<td><font size="5">请选择时间（可选）:</font></td>
				<td><select name=disan size="1" >
				<option value="" ></option>
				<%counter1=0; 
				for(;counter1<number;counter1++){
				%>
  <option value=<%=keshi[counter1] %> ><%=keshi[counter1] %></option>
  <% } 
				%>


</select>
				</td>

			</tr>
<tr align="center">
			<td><input type="submit" name=register value="请确认后提交" style="width:100px;height:50px;background:blanchedalmond;color:green;"></td>
			</tr>
</table>

		</form>
				    
				    
				    
				    
	<%} %>			    
				    
				    
				    
				    
				    
				    
</body>
</html>