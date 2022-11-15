package product;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import product.pdDTO;

public class pdDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private Statement stmt;

	public pdDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/bbs?useUnicode=true&characterEncoding=utf8";
			String dbID = "root";
			String dbPassword = "mysql";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();

		}
	} // end of constructor

	public int productUplode(pdDTO pdDTO) {
		String sql = "INSERT INTO productinformation VALUES (?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pdDTO.getPdcode());
			pstmt.setString(2, pdDTO.getPdname());
			pstmt.setInt(3, pdDTO.getPdprice());
			pstmt.setInt(4, pdDTO.getStock());
			pstmt.setString(5, pdDTO.getPdsize());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return -1; // 데이터베이스 오류
	} // end of 상품등록()

	public List<pdDTO> pdList() {
		ArrayList<pdDTO> dtos = new ArrayList<pdDTO>();
		// 리스트 작성
		try {
			String sql = "SELECT pdcode,pdname,pdprice,stock,pdsize FROM productinformation";
			// sql문
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				pdDTO dto = new pdDTO();
				dto.setPdcode(rs.getString("pdcode"));
				dto.setPdname(rs.getString("pdname"));
				dto.setPdprice(rs.getInt("pdprice"));
				dto.setStock(rs.getInt("stock"));
				dto.setPdsize(rs.getString("pdsize"));

				dtos.add(dto);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return dtos;
	}

	public int delete(String pdcode) {
		// 상품삭제
		String sql = "SELECT pdcode,pdname,pdprice,stock,pdsize FROM productinformation";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pdcode);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

	public List<pdDTO> addList(String pdcode) {
		ArrayList<pdDTO> dtos = new ArrayList<pdDTO>();
		// 리스트 작성
		try {
			String sql = "SELECT pdcode,pdname,pdprice,stock,pdsize FROM productinformation where = ?";

			pdDAO dao = new pdDAO();
			pdDTO dto = new pdDTO();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery(sql);

			pstmt.setString(1, pdcode);

			while (rs.next()) {

				dto.setPdcode(rs.getString("pdcode"));
				dto.setPdname(rs.getString("pdname"));
				dto.setPdprice(rs.getInt("pdprice"));
				dto.setStock(rs.getInt("stock"));
				dto.setPdsize(rs.getString("pdsize"));

				dtos.add(dto);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return dtos;
	}

	public pdDTO cart(String pdcode) {
	
		pdDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement("SELECT * FROM productinformation WHERE pdcode=?");
			pstmt.setString(1, pdcode);
			rs = pstmt.executeQuery();
			if(rs.next()){
				 dto = new pdDTO(
						rs.getString("pdcode")
						,rs.getString("pdname")
						,rs.getInt("pdprice")
						,rs.getInt("stock")
						,rs.getString("pdsize"));
						
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}
	
}
