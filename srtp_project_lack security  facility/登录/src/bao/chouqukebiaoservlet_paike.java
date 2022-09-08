package bao;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class chouqukebiaoservlet_paike extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public chouqukebiaoservlet_paike() {
        super();
        // TODO Auto-generated constructor stub
    }

    
    
    
    
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
			// 获取Statement
			Statement stmt = conn.createStatement();
			// 获取学生信息的SQL语句
			String sql = "select * from tb_classes";
			// 执行查询
			ResultSet rs = stmt.executeQuery(sql);
			// 实例化List对象
			List<kebiao> list = new ArrayList<kebiao>();
			// 判断光标向后移动，并判断是否有效
			while(rs.next()){
				// 实例化课程表对象
				kebiao kebiao1 = new kebiao();
				kebiao1.setTc(rs.getString("tc"));
				
				kebiao1.setz11(rs.getInt("z11"));
				kebiao1.setz12(rs.getInt("z12"));
				kebiao1.setz13(rs.getInt("z13"));
				kebiao1.setz14(rs.getInt("z14"));
				kebiao1.setz15(rs.getInt("z15"));
				kebiao1.setz16(rs.getInt("z16"));

				kebiao1.setz21(rs.getInt("z21"));
				kebiao1.setz22(rs.getInt("z22"));
				kebiao1.setz23(rs.getInt("z23"));
				kebiao1.setz24(rs.getInt("z24"));
				kebiao1.setz25(rs.getInt("z25"));
				kebiao1.setz26(rs.getInt("z26"));

				kebiao1.setz31(rs.getInt("z31"));
				kebiao1.setz32(rs.getInt("z32"));
				kebiao1.setz33(rs.getInt("z33"));
				kebiao1.setz34(rs.getInt("z34"));
				kebiao1.setz35(rs.getInt("z35"));
				kebiao1.setz36(rs.getInt("z36"));

				kebiao1.setz41(rs.getInt("z41"));
				kebiao1.setz42(rs.getInt("z42"));
				kebiao1.setz43(rs.getInt("z43"));
				kebiao1.setz44(rs.getInt("z44"));
				kebiao1.setz45(rs.getInt("z45"));
				kebiao1.setz46(rs.getInt("z46"));

				kebiao1.setz51(rs.getInt("z51"));
				kebiao1.setz52(rs.getInt("z52"));
				kebiao1.setz53(rs.getInt("z53"));
				kebiao1.setz54(rs.getInt("z54"));
				kebiao1.setz55(rs.getInt("z55"));
				kebiao1.setz56(rs.getInt("z56"));
				
				list.add(kebiao1);
			}
			// 将课表集合放置到request之中
			request.setAttribute("list", list);
			rs.close();		// 关闭ResultSet
			stmt.close();	// 关闭Statement
			conn.close();	// 关闭Connection
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// 请求转发到find_student_list.jsp
		request.getRequestDispatcher("shiyan.jsp").forward(request, response);
	}


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
