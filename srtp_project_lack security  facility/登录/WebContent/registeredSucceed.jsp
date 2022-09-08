<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>注册结果</title>
</head>

<body>
	
	<jsp:useBean id="student" class="bao.Student"></jsp:useBean>
	<jsp:setProperty property="*" name="student" />
	<%
		try {
			// 加载数据库驱动，注册到驱动管理器
			Class.forName("com.mysql.cj.jdbc.Driver");
			// 数据库连接字符串
			String url = "jdbc:mysql://localhost:3306/mysql1";
			// 数据库用户名
			String username = "root";
			// 数据库密码
			String sqpassword = "123456789";
			// 创建Connection连接
			Connection conn = DriverManager.getConnection(url,username,sqpassword);

			String sql = "insert into tb_students(id,password,school,tc,name,email) values(?,?,?,?,?,?)";

			
			

			Connection con = DriverManager.getConnection(url,username,sqpassword);
			 String name = request.getParameter("id").trim();
			// 获取Statement
				Statement stmt = con.createStatement();

				String sql2 = "select * from tb_students";
				// 执行查询
				ResultSet rs = stmt.executeQuery("select * from tb_students where id='"+name+"'");
				if(rs.next()){
					%>


				    <div style=line-height:600px; margin:30px;">
				    <font color=red size=50px>用户已存在！请点击</font><a href="login.jsp\"><font color=deepskyblue size=50px>登录</font></a>!
				    </div>
				   

					<% 
				

					conn.close();
					con.close();
			
				}
			
			
			
			
				else{
			// 获取PreparedStatement
			PreparedStatement ps = conn.prepareStatement(sql);
			// 对SQL语句中的第1个参数赋值
			ps.setLong(1, student.getId());
			// 对SQL语句中的第2个参数赋值
			ps.setString(2, student.getPassword());
			// 对SQL语句中的第3个参数赋值
			ps.setString(3,student.getSchool());
			// 对SQL语句中的第4个参数赋值
			ps.setString(4, student.getTc());
			// 对SQL语句中的第5个参数赋值
			ps.setString(5, student.getName());
			// 对SQL语句中的第6个参数赋值
			ps.setString(6, student.getEmail());
			// 执行更新操作，返回所影响的行数
			int row = ps.executeUpdate();
			// 判断是否更新成功
			if(row > 0){
				// 更新成输出信息

				%>


    <div style=line-height:600px; margin:30px;">
    <font color=blueviolet size=50px>注册成功,请点击</font><a
			href="register.jsp"><font color=deepskyblue size=50px>返回</font></a>！
    </div>
   

	<% 
			}

			// 关闭PreparedStatement，释放资源
			ps.close();
			// 关闭Connection，释放资源
			conn.close();
			con.close();
				}
		} catch (Exception e) {
			%>
			<div style= line-height:600px; margin:10px;">
<font color=red size=50px>注册失败,请检查个人信息</font>
</div>
		    <% 
			
			e.printStackTrace();
		}
	%>

</body>
</html>