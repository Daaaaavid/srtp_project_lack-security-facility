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
			// �������ݿ�������ע�ᵽ����������
			Class.forName("com.mysql.cj.jdbc.Driver");
			// ���ݿ������ַ���
			String url = "jdbc:mysql://localhost:3306/mysql1";
			// ���ݿ��û���
			String username = "root";
			// ���ݿ�����
			String password = "123456789";
			// ����Connection����
			Connection conn = DriverManager.getConnection(url,username,password);
			// ��ȡStatement
			Statement stmt = conn.createStatement();
			// ��ȡѧ����Ϣ��SQL���
			String sql = "select * from tb_classes";
			// ִ�в�ѯ
			ResultSet rs = stmt.executeQuery(sql);
			// ʵ����List����
			List<kebiao> list = new ArrayList<kebiao>();
			// �жϹ������ƶ������ж��Ƿ���Ч
			while(rs.next()){
				// ʵ�����γ̱����
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
			// ���α��Ϸ��õ�request֮��
			request.setAttribute("list", list);
			rs.close();		// �ر�ResultSet
			stmt.close();	// �ر�Statement
			conn.close();	// �ر�Connection
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// ����ת����find_student_list.jsp
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
