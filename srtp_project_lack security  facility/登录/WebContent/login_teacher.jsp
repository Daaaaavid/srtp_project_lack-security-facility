<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>北京科技大学教工登录</title>
</head>
<body>
<h2 align="center">
		<font color=blueviolet size=50px>你好，教工请在此登录</font></a>
	</h2>
	<form action="teacher.jsp" method="post">
		<table align="center" style="border: 1px solid green;">
			<tr>
				<td align="center"><font color=forestgreen size=6px>用户名：</font></td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td align="center"><font color=forestgreen size=6px>密&nbsp;&nbsp;码：</font></td>
				<td><input type="text" name="password"></td>
			</tr>
			<tr>
				<td><input type="submit" value="登录" name="login"></td>
				<td><input type="reset" value="重新填写" name="reset"></td>
			</tr>
		</table>

	</form>
</body>
</html>