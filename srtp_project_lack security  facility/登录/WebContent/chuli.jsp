<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>上传结果</title>
</head>
<body>

<%
try{
String diyi = request.getParameter("diyi").trim();
String dier = request.getParameter("dier").trim();
String disan = request.getParameter("disan").trim();
String name2=request.getParameter("id");
String classname=request.getParameter("classname");
System.out.println(name2);
//加载数据库驱动，注册到驱动管理器
			Class.forName("com.mysql.cj.jdbc.Driver");
			// 数据库连接字符串
			String url = "jdbc:mysql://localhost:3306/mysql1";
			// 数据库用户名
			String username = "root";
			// 数据库密码
			String sqpassword = "123456789";
			// 创建Connection连接
			Connection conn = DriverManager.getConnection(url,username,sqpassword);
			Statement stmt = conn.createStatement();
			String sql = "insert into tb_tiaokebiao(id,class,time1,time2,time3) values(?,?,?,?,?)";
			String classx="";
			ResultSet rs = stmt.executeQuery("select * from tb_students where id='"+name2+"'");
			if(rs.next())
			classx=rs.getString("tc");
			Connection con = DriverManager.getConnection(url,username,sqpassword);
			// 获取PreparedStatement
						PreparedStatement ps = con.prepareStatement(sql);
						// 对SQL语句中的第1个参数赋值
						ps.setString(1,name2);
						// 对SQL语句中的第2个参数赋值
						ps.setString(2, classx);
						// 对SQL语句中的第3个参数赋值
						ps.setString(3,dier);
						// 对SQL语句中的第4个参数赋值
						ps.setString(4,disan);
						ps.setString(5,disan);
						// 执行更新操作，返回所影响的行数
						int row = ps.executeUpdate();
						// 判断是否更新成功
						if(row > 0){
							// 更新成输出信息


%>
<div style=line-height:100px; margin:30px;>
				    <font color=olive size=25px><%=name2%>提交成功</font>
				    </div>

				    
				   <% 
					ps.close();
					// 关闭Connection，释放资源
					con.close();
					conn.close();
					}else{ 							
						%>
							<div style=line-height:100px; margin:30px;>
						    <font color=olive size=25px>提交失败，请联系管理员</font>
						    </div>
                     
<% 				
ps.close();
// 关闭Connection，释放资源
con.close();
}
						}
catch(Exception e){
	out.print(e);
} 
finally{

}
%>
</body>
</html>