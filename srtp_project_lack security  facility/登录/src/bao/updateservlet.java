package bao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class updateservlet
 */
public class updateservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.valueOf(request.getParameter("id"));
		String password = String.valueOf(request.getParameter("password")); 
		try {
			// �������ݿ�������ע�ᵽ����������
			Class.forName("com.mysql.jdbc.Driver");
			// ���ݿ������ַ���
			String url = "jdbc:mysql://localhost:3306/mysql1";
			// ���ݿ��û���
			String username = "root";
			// ���ݿ�����
			String password1 = "123456789";
			// ����Connection����
			Connection conn = DriverManager.getConnection(url,username,password1);
			// ����SQL���
			String sql = "update tb_students set password=? where id=?";
			// ��ȡPreparedStatement
			PreparedStatement ps = conn.prepareStatement(sql);
			// ��SQL����еĵ�һ��������ֵ
			ps.setString(1, password);
			// ��SQL����еĵڶ���������ֵ
			ps.setInt(2, id);
			// ִ�и��²���
			ps.executeUpdate();
			// �ر�PreparedStatement
			ps.close();
			// �ر�Connection
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		// �ض���FindServlet
		response.sendRedirect("findservlet");
	}
		// TODO Auto-generated method stub


}
