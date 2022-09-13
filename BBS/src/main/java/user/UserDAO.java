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
			/* mysql 접속 부분 */ 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
																
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM user WHERE userID = ?"; //sql문
		
		try {
			pstmt = conn.prepareStatement(SQL); //sql문 데이베이스로 입력
			pstmt.setString(1, userID); // sql문 ?에 매개변수 전달
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				if(rs.getString(1).equals(userPassword)) { // 비밀번호 비교
					return 1; //데이터베이스의 존재하는 해당 유저의 비밀번호와 매개변수로 넘겨받은 비밀번호가 맞으면 로그인 성공.
				} else {
					return 0; // 비밀번호 불일치
				}
			}
			return -1; //존재하지 않는 아이디
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -2; //데이터베이스 오류
	}
	
	public int join(User user) { //User클래스 인스턴스
		String SQL = "INSERT INTO user VALUES (?, ?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(SQL); //sql문 데이베이스로 입력
			/* SQL문장에 값들을 넣어줌 */
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			/*  */
			return pstmt.executeUpdate(); // 해당 Statement를 실행한 그 결과를 넣는다
			
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return -1; //데이터베이스 오류
	}
	
	
	
	
}
