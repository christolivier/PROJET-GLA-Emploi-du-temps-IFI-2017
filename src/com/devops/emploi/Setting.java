package com.devops.emploi;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.devops.db.DatabaseConnection;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.HttpSession;
/**
 * Servlet implementation class Setting
 */
@WebServlet("/Setting")
public class Setting extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	Connection connection = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	String PDF = "";
	String SKIN = "";
	String MINC = "";
	String LNG = "";
	String MAP = "";
	String AGENDA = "";
	String ICAL="";
	int uid=0;

	public Setting() {
		super();
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(true);
		uid =(Integer) session.getAttribute("ssuid");

		try {
			String[] interests = request.getParameterValues("stg");
			for (int i = 0; i < interests.length; i++) {
				PDF = interests[i];
			}

		} catch (Exception e1) {
			e1.printStackTrace();
		}

		try {
			String[] interests2 = request.getParameterValues("stg1");
			for (int i = 0; i < interests2.length; i++) {
				SKIN = interests2[i];
			}

		} catch (Exception e1) {
			e1.printStackTrace();
		}

		try {
			String[] interests3 = request.getParameterValues("stg2");
			for (int i = 0; i < interests3.length; i++) {
				MINC = interests3[i];
			}

		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		try {
			String[] interests3 = request.getParameterValues("stg3");
			for (int i = 0; i < interests3.length; i++) {
				MAP = interests3[i];
			}

		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		try {
			String[] interests3 = request.getParameterValues("stg4");
			for (int i = 0; i < interests3.length; i++) {
				AGENDA = interests3[i];
			}

		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		try {
			String[] interests3 = request.getParameterValues("stg5");
			for (int i = 0; i < interests3.length; i++) {
				ICAL = interests3[i];
			}

		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		LNG=request.getParameter("language");

		try {
			connection = DatabaseConnection.getConnection();
			ps = connection
					.prepareStatement("update setting set pdf=?, minc=?, skin=?, language=?, map=?, agenda=?, ical=? where uid=? ");
			ps.setString(1, PDF);
			ps.setString(2, MINC);
			ps.setString(3, SKIN);
			ps.setString(4, LNG);
			ps.setString(5, MAP);
			ps.setString(6, AGENDA);
			ps.setString(7, ICAL);
			ps.setInt(8, uid);

			ps.executeUpdate();

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
			
		}

		response.sendRedirect("home.jsp");

	}
}
