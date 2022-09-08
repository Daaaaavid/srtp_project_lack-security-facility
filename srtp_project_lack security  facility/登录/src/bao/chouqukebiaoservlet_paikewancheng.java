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
public class chouqukebiaoservlet_paikewancheng extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public chouqukebiaoservlet_paikewancheng() {
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
			String sql = "select * from tb_lab_timetable";
			// 执行查询
			ResultSet rs = stmt.executeQuery(sql);
			// 实例化List对象
			List<labkebiao> list = new ArrayList<labkebiao>();
			// 判断光标向后移动，并判断是否有效
			while(rs.next()){
				// 实例化课程表对象
				labkebiao kebiao1 = new labkebiao();
				kebiao1.setTerm(rs.getString("term"));
				
				kebiao1.setz11(rs.getString("z11"));
				kebiao1.setz12(rs.getString("z12"));
				kebiao1.setz13(rs.getString("z13"));
				kebiao1.setz14(rs.getString("z14"));
				kebiao1.setz15(rs.getString("z15"));
				kebiao1.setz16(rs.getString("z16"));

				kebiao1.setz21(rs.getString("z21"));
				kebiao1.setz22(rs.getString("z22"));
				kebiao1.setz23(rs.getString("z23"));
				kebiao1.setz24(rs.getString("z24"));
				kebiao1.setz25(rs.getString("z25"));
				kebiao1.setz26(rs.getString("z26"));

				kebiao1.setz31(rs.getString("z31"));
				kebiao1.setz32(rs.getString("z32"));
				kebiao1.setz33(rs.getString("z33"));
				kebiao1.setz34(rs.getString("z34"));
				kebiao1.setz35(rs.getString("z35"));
				kebiao1.setz36(rs.getString("z36"));

				kebiao1.setz41(rs.getString("z41"));
				kebiao1.setz42(rs.getString("z42"));
				kebiao1.setz43(rs.getString("z43"));
				kebiao1.setz44(rs.getString("z44"));
				kebiao1.setz45(rs.getString("z45"));
				kebiao1.setz46(rs.getString("z46"));

				kebiao1.setz51(rs.getString("z51"));
				kebiao1.setz52(rs.getString("z52"));
				kebiao1.setz53(rs.getString("z53"));
				kebiao1.setz54(rs.getString("z54"));
				kebiao1.setz55(rs.getString("z55"));
				kebiao1.setz56(rs.getString("z56"));
				
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
		request.getRequestDispatcher("shiyan2.jsp").forward(request, response);
	}


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
