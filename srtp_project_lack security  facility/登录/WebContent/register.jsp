<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style > 
 body{ 
      background-image:url(image/business-051.jpg); 
      background-origin:content;
      background-size:cover;
      background-repeat:no-repeat; 
 } 
 </style>
<title>新用户注册</title>
</head>
<script type="text/javascript">
	function check(form){
		with(form){
			if(id.value == ""){
				alert("学号不能为空");
				return false;
			}
			if(password.value == ""){
				alert("密码不能为空");
				return false;
			}
			
			if(school.value == ""){
				alert("学院不能为空");
				return false;
			}
			if(tc.value == ""){
				alert("教学班不能为空");
				return false;
			}
			if(name.value == ""){
				alert("姓名不能为空");
				return false;
			}
			if(email.value == ""){
				alert("电子邮箱不能为空");
				return false;
			}
			return true;
		}
	}
</script>
<body align="center">
<h2 align="center"><font color=blueviolet size=50px>欢迎注册成为本网站用户</font></h2>
	<form action="registeredSucceed.jsp" method="post" onsubmit="return check(this);">
		<table align="center" style="width:300px;height:30px;background:deepskyblue;color:green;">
			<tr align="right">
		 		<td>请输入学号:</td>
				<td><input type="text" name=id autofocus="autofocus"></td>
			</tr>
			<tr align="right">
				<td>请输入密码:</td>
				<td><input type="text" name=password></td>
			</tr>

			<tr align="right">
		 		<td>请输入学院:</td>
				<td>
				
				<select name=school>
  <option value="计算机与通信工程学院" >计算机与通信工程学院</option>
  <option value="土木与资源工程学院">土木与资源工程学院</option>
  <option value="冶金与生态工程学院">冶金与生态工程学院</option>
  <option value="材料科学与工程学院">材料科学与工程学院</option>
  <option value="机械工程学院">机械工程学院</option>
  
  
  <option value="能源与环境工程学院" selected>能源与环境工程学院</option>
  <option value="自动化学院">自动化学院</option>
  <option value="数理学院">数理学院</option>
  
  
  <option value="化学与生物工程学院">化学与生物工程学院</option>
  <option value="经济管理学院">经济管理学院</option>
  <option value="文法学院">文法学院</option>
  <option value="马克思主义学院">马克思主义学院</option>
  
  
  
  <option value="外国语学院">外国语学院</option>
  <option value="高等工程师学院">高等工程师学院</option>

</select>
				
				
				
				
				</td>
			</tr>
			
			<tr align="right">
		 		<td>请输入教学班级:</td>
				<td><input type="text" name=tc autofocus="autofocus"></td>
			</tr>
			<tr align="right">
		 		<td>请输入姓名:</td>
				<td><input type="text" name=name autofocus="autofocus"></td>
			</tr>
			<tr align="right">
		 		<td>请输入电子邮箱:</td>
				<td><input type="text" name=email autofocus="autofocus"></td>
			</tr>
</table>
<table align="center">
		<tr align="center">
			<td><input type="reset" name=refill value="重填" style="width:100px;height:25px;background:darkgary;color:darkviolet;"></td>
			</tr>

			<tr align="center">
			<td><input type="submit" name=register value="注册" style="width:100px;height:50px;background:deepskyblue;color:green;"></td>
			</tr>
			</table>
		</form>
	 
</body>
</html>