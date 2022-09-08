<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加结果</title>
</head>
<body>
<jsp:useBean id="ban" class="bao.kebiao"></jsp:useBean>
	<jsp:setProperty property="*" name="ban"/>
	<%
		try {
			// 加载数据库驱动，注册到驱动管理器
			Class.forName("com.mysql.cj.jdbc.Driver");
			// 数据库连接字符串
			String url = "jdbc:mysql://localhost:3306/mysql1";
			// 数据库用户名
			String username = "root";
			// 数据库密码
			String password = "123456789";
			// 创建Connection连接
			Connection conn = DriverManager.getConnection(url,username,password);
			// 添加图书信息的SQL语句
			String sql = "insert into tb_classes(tc,z11,z12,z13,z14,z15,z16,z21,z22,z23,z24,z25,z26,z31,z32,z33,z34,z35,z36,z41,z42,z43,z44,z45,z46,z51,z52,z53,z54,z55,z56) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			// 获取PreparedStatement
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1,ban.getTc());

			ps.setInt(2, ban.getz11());
			ps.setInt(3, ban.getz12());
			ps.setInt(4, ban.getz13());
			ps.setInt(5, ban.getz14());
			ps.setInt(6, ban.getz15());
			ps.setInt(7, ban.getz16());
			
			ps.setInt(8, ban.getz21());
			ps.setInt(9, ban.getz22());
			ps.setInt(10, ban.getz23());
			ps.setInt(11, ban.getz24());
			ps.setInt(12, ban.getz25());
			ps.setInt(13, ban.getz26());
			
			ps.setInt(14, ban.getz31());
			ps.setInt(15, ban.getz32());
			ps.setInt(16, ban.getz33());
			ps.setInt(17, ban.getz34());
			ps.setInt(18, ban.getz35());
			ps.setInt(19, ban.getz36());
			
			ps.setInt(20, ban.getz41());
			ps.setInt(21, ban.getz42());
			ps.setInt(22, ban.getz43());
			ps.setInt(23, ban.getz44());
			ps.setInt(24, ban.getz45());
			ps.setInt(25, ban.getz46());
			
			ps.setInt(26, ban.getz51());
			ps.setInt(27, ban.getz52());
			ps.setInt(28, ban.getz53());
			ps.setInt(29, ban.getz54());
			ps.setInt(30, ban.getz55());
			ps.setInt(31, ban.getz56());
			
			// 执行更新操作，返回所影响的行数
			int row = ps.executeUpdate();
			// 判断是否更新成功
			if(row > 0){
				// 更新成输出信息
				out.print("成功添加了 " + row + "条数据！");
			}
			// 关闭PreparedStatement，释放资源
			ps.close();
			// 关闭Connection，释放资源
			conn.close();
		} catch (Exception e) {
			out.print("课程信息添加失败！");
			e.printStackTrace();
		}
	%>
	<br>
	<a href="add_class.jsp">返回</a>
</body>
</html>