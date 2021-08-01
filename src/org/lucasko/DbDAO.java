package org.lucasko;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbDAO extends DBConnection {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

	private int getNum() {
		int min = 1;
		int max = 1000;
		int random_int = (int) Math.floor(Math.random() * (max - min + 1) + min);
		return random_int;
	}

	public UserVO getUser() {

		Connection conn = getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		UserVO user = new UserVO();
		try {
			stmt = conn.createStatement();
			String sql = "";
			sql = "SELECT * FROM MOCK_DATA WHERE ID=" + getNum();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				user.setFirst_name(rs.getString("first_name"));
				user.setEmail(rs.getString("email"));
				user.setGender(rs.getString("gender"));
				user.setId(rs.getInt("id"));
				user.setLast_name(rs.getString("last_name"));
				user.setIp_address(rs.getString("ip_address"));

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(conn, stmt, rs);
		}

		return user;

	}

	private void close(Connection conn, Statement stmt, ResultSet rs) {

		try {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
