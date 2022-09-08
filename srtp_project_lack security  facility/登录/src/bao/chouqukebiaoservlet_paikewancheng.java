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
			String sql = "select * from tb_lab_timetable";
			// ִ�в�ѯ
			ResultSet rs = stmt.executeQuery(sql);
			// ʵ����List����
			List<labkebiao> list = new ArrayList<labkebiao>();
			// �жϹ������ƶ������ж��Ƿ���Ч
			while(rs.next()){
				// ʵ�����γ̱����
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
