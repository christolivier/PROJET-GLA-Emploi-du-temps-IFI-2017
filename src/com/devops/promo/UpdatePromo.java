package com.devops.promo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.devops.db.DatabaseConnection;

/**
 * Servlet implementation class UpdateUser
 */
@WebServlet("/UpdatePromo")
public class UpdatePromo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdatePromo() {
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
		// old user values

		String ofn = request.getParameter("oldpro");
		String oln = request.getParameter("oldpass");
		String oem = request.getParameter("oldstat");
		String oun = request.getParameter("oldposi");
		

		// new user values
		String nfn = request.getParameter("newpro");
		String nln = request.getParameter("newpass");
		String nem = request.getParameter("status");
		String nun = request.getParameter("position");
		

		// checkbox values

		String chfn = request.getParameter("checpro");
		String chln = request.getParameter("checpass");
		String chem = request.getParameter("checstat");
		String chun = request.getParameter("checposi");
		
		// new values
		String nus = "";
		String nuss = request.getParameter("status");
		if (nuss.equals("Active")) {
			nus = "A";
		} else {
			nus = "I";
		}
		
		

		String nup = "";
		String nupp = request.getParameter("position");
		if (nupp.equals("Admin")) {
			nup = "A";
		} else {
			nup = "U";
		}

		String i = request.getParameter("txo");
		int UID = Integer.parseInt(i);
		String UFN = "";
		String ULN = "";
		String UEm = "";
		String UUN = "";
		

		if (UID != 0) {

			if (chfn != null) {
				UFN = nfn;
			} else {
				UFN = ofn;
			}
			if (chln != null) {
				ULN = nln;
			} else {
				ULN = oln;
			}

			if (chem != null) {
				UEm = nus;
			} else {
				UEm = oem;
			}

			if (chun != null) {
				UUN = nup;
			} else {
				UUN = oun;
			}
			
			

			Connection connection = null;
			PreparedStatement ps = null;

			try {
				connection = DatabaseConnection.getConnection();
				ps = connection
						.prepareStatement("update promotion set  promoname=?, cpassword=?, status=?, position=? where uid=? ");
				ps.setString(1, UFN);
				ps.setString(2, ULN);
				ps.setString(3, UEm);
				ps.setString(4, UUN);
				ps.setInt(5, UID);

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

			response.sendRedirect("admin/promoupdateSuccess.jsp");
		} else {

			response.sendRedirect("admin/promoupdateunsuccess.jsp");
		}

	}

}
