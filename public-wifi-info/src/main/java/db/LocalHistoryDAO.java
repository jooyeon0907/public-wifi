package db;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class LocalHistoryDAO {
//	final static String DBURL = "jdbc:sqlite:public_wifi.db";
	final static String DBURL = "jdbc:sqlite:C:\\JEB\\task\\mission1\\wifi-project\\public-wifi-info\\public_wifi.db";

	public String getNowDate() {
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss");

		return now.format(formatter);
	}

	public void createLocalHistory(Double x, Double y) {

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName("org.sqlite.JDBC");
			conn = DriverManager.getConnection(DBURL);

			String selectSQL = "insert into location_history (x, y, search_date) values (?, ?, ?)";
			pstmt = conn.prepareStatement(selectSQL);
			pstmt.setDouble(1, x);
			pstmt.setDouble(2, y);
			pstmt.setString(3, getNowDate());

			int res = pstmt.executeUpdate();

			if (res > 0) {
				System.out.println("위치 히스토리 추가 성공");
			} else {
				System.out.println("위치 히스토리 추가 실패");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null && !pstmt.isClosed())
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				if (conn != null && !conn.isClosed())
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

	public List<LocalHistory> getLocalHistoryList() {
		List<LocalHistory> logcalHistorys = new ArrayList<LocalHistory>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName("org.sqlite.JDBC");
			conn = DriverManager.getConnection(DBURL);

			// 데이터 조회
			String selectSQL = "SELECT * FROM location_history order by id desc;";
			pstmt = conn.prepareStatement(selectSQL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				LocalHistory logcalHistory = new LocalHistory();
				logcalHistory.setId(rs.getInt("id"));
				logcalHistory.setX(rs.getDouble("x"));
				logcalHistory.setY(rs.getDouble("y"));
				logcalHistory.setSearchDate(rs.getString("search_date"));

				logcalHistorys.add(logcalHistory);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null && !rs.isClosed())
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				if (pstmt != null && !pstmt.isClosed())
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				if (conn != null && !conn.isClosed())
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return logcalHistorys;
	}

	public LocalHistory getLocalHistory(int id) {
		LocalHistory lg = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName("org.sqlite.JDBC");
			conn = DriverManager.getConnection(DBURL);

			// 데이터 조회
			String selectSQL = "SELECT * FROM location_history where id = ?";
			pstmt = conn.prepareStatement(selectSQL);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				lg = new LocalHistory();
				lg.setId(rs.getInt("id"));
				lg.setX(rs.getDouble("x"));
				lg.setY(rs.getDouble("y"));
				lg.setSearchDate(rs.getString("search_date"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null && !rs.isClosed())
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				if (pstmt != null && !pstmt.isClosed())
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				if (conn != null && !conn.isClosed())
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return lg;
	}

	public int deleteLocalHistory(int id) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int res = -1;

		try {
			Class.forName("org.sqlite.JDBC");
			conn = DriverManager.getConnection(DBURL);

			// 데이터 조회
			String selectSQL = "delete from location_history where id = ?";
			pstmt = conn.prepareStatement(selectSQL);
			pstmt.setInt(1, id);
			res = pstmt.executeUpdate();

			if (res > 0) {
				System.out.println("위치 히스토리 삭제 성공");
			} else {
				System.out.println("위치 히스토리 삭제 실패");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null && !rs.isClosed())
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				if (pstmt != null && !pstmt.isClosed())
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				if (conn != null && !conn.isClosed())
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return res;
	}

}
