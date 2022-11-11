package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.mysql.cj.jdbc.Driver;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/bbs?useUnicode=true&characterEncoding=utf8";
			String dbID = "root";
			String dbPassword = "mysql";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		} catch (Exception e) {
			e.printStackTrace();

		}
	} // end of constructor

	public int login(String userID, String userPassword) {
		String sql = "select userPassword from user where userID=?";


		try {
			pstmt = conn.prepareStatement(sql); // sql 쿼리문을 대기시킴
			pstmt.setString(1, userID); // 첫번째 ?에 parameter로 받아온 userID 입력.
			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (rs.getString(1).equals(userPassword)) {
					return 1; //로그인 성공. 쿼리문을 실행시켜 가져온 패스워드가 login()을 실행 할 때 넣어준 패스워드와 일치한다.
				}else {
					return 0;
					//로그인  실패. 쿼리문을 실행시켜 가져온 패스워드가 login()을 실행 할 때 넣어준 패스워드와 다르다.
				}
			}
			return -1; //아이디 없음. 쿼리문을 실행한 결과 값이 없다. 즉, 없는 아이디.
		} catch (Exception e) {
			
		}
		return -2;		//오류.
	}//end of login()
	
	public int join(User user) {
		String sql = "INSERT INTO USER VALUES (?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}	//end of join()
}// end of class
