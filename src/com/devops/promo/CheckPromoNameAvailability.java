package com.devops.promo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.devops.db.DatabaseConnection;

/**
 * Servlet implementation class CheckUserNameAvailability
 */
@WebServlet("/CheckUserNameAvailability")
public class CheckPromoNameAvailability extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Connection connection;
	private PreparedStatement ps;
	private ResultSet rs;
	private String un;

	public CheckPromoNameAvailability() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		un = request.getParameter("uname");
		
		
		PrintWriter out = response.getWriter();

		try {
			connection = DatabaseConnection.getConnection();
			ps = connection
					.prepareStatement("select promoname from users where promoname=?");
			ps.setString(1, un);
			rs = ps.executeQuery();

			if (!rs.next()) {
				out.println("<font color=green><b>" + un + "</b> is avaliable");
			} else {
				out.println("<font color=red><b>" + un
						+ "</b> is already in use</font>");
			}
			out.println();

		} catch (Exception ex) {

			out.println("Error ->" + ex.getMessage());

		} finally {
			out.close();

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
		}

	}

}
