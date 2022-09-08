<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style > 
 body{ 
      background-image:url(image/business-019.jpg); 
      background-origin:content;
      background-size:cover;
      background-repeat:no-repeat; 

 } 
  body{
margin:0 auto;
radio-align:center;
valign:middle;
}
 </style>
<title>添加课程表</title>
</head>
<body>
	<form action="AddClass.jsp" method="post" onsubmit="return check(this);">
		<table align="center" width="450">
			<tr>
				<td align="center" colspan="2">
					<h2>添加课程信息</h2>
					<hr>
				</td>
			</tr>
			<tr>
				<td align="right">教学班级：</td>
				<td><input type="text" name="tc" /></td>
			</tr>
			
			
			
			<tr>
				<td align="right">周一第一节：</td>
				<td><input type="radio" name="z11" value="0" checked> 有课
                <input type="radio" name="z11" value="1" /> 无课</td>
			</tr>
			
						<tr>
				<td align="right">周一第二节：</td>
				<td><input type="radio" name="z12" value="0" checked> 有课
                <input type="radio" name="z12" value="1" /> 无课</td>
			</tr>
			
			<tr>
				<td align="right">周一第三节：</td>
				<td><input type="radio" name="z13" value="0" checked> 有课
                <input type="radio" name="z13" value="1" /> 无课</td>
			</tr>
			
						<tr>
				<td align="right">周一第四节：</td>
				<td><input type="radio" name="z14" value="0" checked> 有课
                <input type="radio" name="z14" value="1" /> 无课</td>
			</tr>
			
						<tr>
				<td align="right">周一第五节：</td>
				<td><input type="radio" name="z15" value="0" checked> 有课
                <input type="radio" name="z15" value="1" /> 无课</td>
			</tr>
			
			<tr>
				<td align="right">周一第六节：</td>
				<td><input type="radio" name="z16" value="0" checked> 有课
                <input type="radio" name="z16" value="1" /> 无课</td>
			</tr>
			
						<tr>
				<td align="right">周二第一节：</td>
				<td><input type="radio" name="z21" value="0" checked> 有课
                <input type="radio" name="z21" value="1" /> 无课</td>
			</tr>
			
						<tr>
				<td align="right">周二第二节：</td>
				<td><input type="radio" name="z22" value="0" checked> 有课
                <input type="radio" name="z22" value="1" /> 无课</td>
			</tr>
			
			<tr>
				<td align="right">周二第三节：</td>
				<td><input type="radio" name="z23" value="0" checked> 有课
                <input type="radio" name="z23" value="1" /> 无课</td>
			</tr>
			
						<tr>
				<td align="right">周二第四节：</td>
				<td><input type="radio" name="z24" value="0" checked> 有课
                <input type="radio" name="z24" value="1" /> 无课</td>
			</tr>
			
						<tr>
				<td align="right">周二第五节：</td>
				<td><input type="radio" name="z25" value="0" checked> 有课
                <input type="radio" name="z25" value="1" /> 无课</td>
			</tr>
			
			<tr>
				<td align="right">周二第六节：</td>
				<td><input type="radio" name="z26" value="0" checked> 有课
                <input type="radio" name="z26" value="1" /> 无课</td>
			</tr>
			
						<tr>
				<td align="right">周三第一节：</td>
				<td><input type="radio" name="z31" value="0" checked> 有课
                <input type="radio" name="z31" value="1" /> 无课</td>
			</tr>
			
						<tr>
				<td align="right">周三第二节：</td>
				<td><input type="radio" name="z32" value="0" checked> 有课
                <input type="radio" name="z32" value="1" /> 无课</td>
			</tr>
			
			<tr>
				<td align="right">周三第三节：</td>
				<td><input type="radio" name="z33" value="0" checked> 有课
                <input type="radio" name="z33" value="1" /> 无课</td>
			</tr>
			
						<tr>
				<td align="right">周三第四节：</td>
				<td><input type="radio" name="z34" value="0" checked> 有课
                <input type="radio" name="z34" value="1" /> 无课</td>
			</tr>
			
						<tr>
				<td align="right">周三第五节：</td>
				<td><input type="radio" name="z35" value="0" checked> 有课
                <input type="radio" name="z35" value="1" /> 无课</td>
			</tr>
			
			<tr>
				<td align="right">周三第六节：</td>
				<td><input type="radio" name="z36" value="0" checked> 有课
                <input type="radio" name="z36" value="1" /> 无课</td>
			</tr>
			
						<tr>
				<td align="right">周四第一节：</td>
				<td><input type="radio" name="z41" value="0" checked> 有课
                <input type="radio" name="z41" value="1" /> 无课</td>
			</tr>
			
						<tr>
				<td align="right">周四第二节：</td>
				<td><input type="radio" name="z42" value="0" checked> 有课
                <input type="radio" name="z42" value="1" /> 无课</td>
			</tr>
			
			<tr>
				<td align="right">周四第三节：</td>
				<td><input type="radio" name="z43" value="0" checked> 有课
                <input type="radio" name="z43" value="1" /> 无课</td>
			</tr>
			
						<tr>
				<td align="right">周四第四节：</td>
				<td><input type="radio" name="z44" value="0" checked> 有课
                <input type="radio" name="z44" value="1" /> 无课</td>
			</tr>
			
						<tr>
				<td align="right">周四第五节：</td>
				<td><input type="radio" name="z45" value="0" checked> 有课
                <input type="radio" name="z45" value="1" /> 无课</td>
			</tr>
			
			<tr>
				<td align="right">周四第六节：</td>
				<td><input type="radio" name="z46" value="0" checked> 有课
                <input type="radio" name="z46" value="1" /> 无课</td>
			</tr>
			
						<tr>
				<td align="right">周五第一节：</td>
				<td><input type="radio" name="z51" value="0" checked> 有课
                <input type="radio" name="z51" value="1" /> 无课</td>
			</tr>
			
						<tr>
				<td align="right">周五第二节：</td>
				<td><input type="radio" name="z52" value="0" checked> 有课
                <input type="radio" name="z52" value="1" /> 无课</td>
			</tr>
			
			<tr>
				<td align="right">周五第三节：</td>
				<td><input type="radio" name="z53" value="0" checked> 有课
                <input type="radio" name="z53" value="1" /> 无课</td>
			</tr>
			
						<tr>
				<td align="right">周五第四节：</td>
				<td><input type="radio" name="z54" value="0" checked> 有课
                <input type="radio" name="z54" value="1" /> 无课</td>
			</tr>
			
						<tr>
				<td align="right">周五第五节：</td>
				<td><input type="radio" name="z55" value="0" checked> 有课
                <input type="radio" name="z55" value="1" /> 无课</td>
			</tr>
			
			<tr>
				<td align="right">周五第六节：</td>
				<td><input type="radio" name="z56" value="0" checked> 有课
                <input type="radio" name="z56" value="1" /> 无课</td>
			</tr>
			
			
			
			
			
			<tr>
				<td align="center" colspan="2">
					<input type="submit" value="添　加">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>