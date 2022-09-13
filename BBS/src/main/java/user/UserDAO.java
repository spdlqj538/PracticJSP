package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public UserDAO() { 
		try {
			/* */
			String dbURL = "jdbc:mysql://localhost:3306/BBS";
			String dbID = "root";
			String dbPassword = "root";
			Class.forName("com.mysql.jdbc.Driver");
			
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			/* mysql ���� �κ� */ 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
																
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM user WHERE userID = ?"; //sql��
		
		try {
			pstmt = conn.prepareStatement(SQL); //sql�� ���̺��̽��� �Է�
			pstmt.setString(1, userID); // sql�� ?�� �Ű����� ����
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				if(rs.getString(1).equals(userPassword)) { // ��й�ȣ ��
					return 1; //�����ͺ��̽��� �����ϴ� �ش� ������ ��й�ȣ�� �Ű������� �Ѱܹ��� ��й�ȣ�� ������ �α��� ����.
				} else {
					return 0; // ��й�ȣ ����ġ
				}
			}
			return -1; //�������� �ʴ� ���̵�
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -2; //�����ͺ��̽� ����
	}
	
	public int join(User user) { //UserŬ���� �ν��Ͻ�
		String SQL = "INSERT INTO user VALUES (?, ?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(SQL); //sql�� ���̺��̽��� �Է�
			/* SQL���忡 ������ �־��� */
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			/*  */
			return pstmt.executeUpdate(); // �ش� Statement�� ������ �� ����� �ִ´�
			
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return -1; //�����ͺ��̽� ����
	}
	
	
	
	
}