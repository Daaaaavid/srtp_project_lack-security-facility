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

public class findservlet_changepwd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
			// ���ͼ����Ϣ��SQL���
			String sql = "select * from tb_students";
			// ִ�в�ѯ
			ResultSet rs = stmt.executeQuery(sql);
			// ʵ����List����
			List<Student> list = new ArrayList<Student>();
			// �жϹ������ƶ������ж��Ƿ���Ч
			while(rs.next()){
				// ʵ����Book����
				Student student = new Student();
				
				student.setId(rs.getLong("id"));
				student.setPassword(rs.getString("password"));
				
				student.setSchool(rs.getString("school"));
				student.setTc(rs.getString("tc"));
				
				student.setName(rs.getString("name"));
				student.setEmail(rs.getString("email"));
				
				
				list.add(student);
			}
			// ��ͼ�鼯�Ϸ��õ�request֮��
			request.setAttribute("list", list);
			rs.close();		// �ر�ResultSet
			stmt.close();	// �ر�Statement
			conn.close();	// �ر�Connection
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// ����ת����book_list.jsp
		request.getRequestDispatcher("changepwd_student_list.jsp").forward(request, response);
	}
}
