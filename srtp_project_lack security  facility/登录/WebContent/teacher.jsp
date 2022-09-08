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
      background-image:url(image/business-027.jpg); 
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
<title>登录结果</title>
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
							String sql = "select * from tb_teachers";
							// 执行查询
							ResultSet rs = stmt.executeQuery("select * from tb_teachers where id='"+name+"'");
			if(rs.next()){
				rs=stmt.executeQuery("select * from tb_teachers where id='"+name+"' and password='"+password+"'");
				if(rs.next()){
					request.getRequestDispatcher("login_success.jsp").forward(request,response);
				}else{
					%>


				    <div style=line-height:600px; margin:30px;">
				    <font color=blueviolet size=50px>密码输入错误！请重新</font><a
							href="login_teacher.jsp"><font color=deepskyblue size=50px>登录</font></a>！
				    </div>
				   

					<% 
					
				}
			}else{
				%>


			    <div style=line-height:600px; margin:30px;">
			    <font color=blueviolet size=50px>用户不存在！请联系管理员添加。</font>
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