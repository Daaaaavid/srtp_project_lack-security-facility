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

public class findservlet_showlist_teachers extends HttpServlet {
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
			// ��ȡѧ����Ϣ��SQL���
			String sql = "select * from tb_teachers";
			// ִ�в�ѯ
			ResultSet rs = stmt.executeQuery(sql);
			// ʵ����List����
			List<Teacher> list = new ArrayList<Teacher>();
			// �жϹ������ƶ������ж��Ƿ���Ч
			while(rs.next()){
				// ʵ����Student����
				Teacher teacher = new Teacher();
				
				teacher.setId(rs.getLong("id"));
				teacher.setPassword(rs.getString("password"));
				
				teacher.setSchool(rs.getString("school"));
				teacher.setMb(rs.getString("mb"));
				
				teacher.setName(rs.getString("name"));
				teacher.setEmail(rs.getString("email"));
				
				
				list.add(teacher);
			}
			// ��ѧ�����Ϸ��õ�request֮��
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
		request.getRequestDispatcher("find_teacher_list.jsp").forward(request, response);
	}
}
