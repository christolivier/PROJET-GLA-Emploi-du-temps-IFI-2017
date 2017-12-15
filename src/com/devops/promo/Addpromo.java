package com.devops.promo;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.devops.db.DatabaseConnection;

import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class AddUser Servlet for Add new user and add
 * calendar default settings to that user
 */
@WebServlet("/Addpromo")
public class Addpromo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	private String promoname;
	private String password;
	private String cpassword;
	private String status = "A";
	private String position = "U";
	private Connection connection;
	private PreparedStatement ps;
	private ResultSet rs = null;

	public Addpromo() {
		super();

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		
		promoname = request.getParameter("username");
		password= request.getParameter("password");
		cpassword = request.getParameter("cpassword");
		

		if ( password==""&&  cpassword==""&& promoname=="" ) {

			response.sendRedirect("admin/unsuccess.jsp");
			

		} else {
			// Add new promo
			
			

			try {
				connection = DatabaseConnection.getConnection();
				ps = connection
						.prepareStatement("insert into promotion (promoname,password,cpassword,status,position) values (?,?, ?, ?, ?)");

				
				ps.setString(1, promoname);
				ps.setString(2, password);
				ps.setString(3, cpassword);
				ps.setString(4, status);
				ps.setString(5, position);

				int i = ps.executeUpdate();

				int luid = 0;

				// add calendar default setting
				ps = connection
						.prepareStatement("SELECT uid FROM promotion ORDER BY uid DESC LIMIT 1");

				rs = ps.executeQuery();
				if (rs.next()) {

					luid = rs.getInt("uid");
				}

				int stuid = luid;
				String stpdf = "pdfD";
				String stmic = "mcA";
				String stskin = "sk1";
				String stlng = "English";
				String stmap = "mapD";
				String stag = "agD";
				String stic = "icD";

				ps = connection
						.prepareStatement("insert into setting(uid,pdf,minc,skin,language,map,agenda,ical) values (?, ?, ?, ?, ?,?, ?, ?)");

				ps.setInt(1, stuid);
				ps.setString(2, stpdf);
				ps.setString(3, stmic);
				ps.setString(4, stskin);
				ps.setString(5, stlng);
				ps.setString(6, stmap);
				ps.setString(7, stag);
				ps.setString(8, stic);

				int x = ps.executeUpdate();

				if (i != 0 && x !=0 ) {
					response.sendRedirect("admin/success.jsp");
				} else {
					response.sendRedirect("admin/unsuccess.jsp");
				}

			} catch (SQLException e) {
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
		}

	}

}
