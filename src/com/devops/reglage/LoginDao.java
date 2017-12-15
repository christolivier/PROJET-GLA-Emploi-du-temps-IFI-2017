package com.devops.reglage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.devops.db.DatabaseConnection;

public class LoginDao {

	public static boolean validate(String name, String pass) {
		boolean status = false;
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			connection = DatabaseConnection.getConnection();
			ps = connection
					.prepareStatement("select * from promotion where promoname=? and cpassword=?");
			ps.setString(1, name);
			ps.setString(2, pass);
			rs = ps.executeQuery();
			status = rs.next();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return status;

	}
	
	
	
	
	
	
	
	
	
	
	
	

}
