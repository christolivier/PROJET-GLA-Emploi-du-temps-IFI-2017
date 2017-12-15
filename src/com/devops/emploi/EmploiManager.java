package com.devops.emploi;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;

import javax.servlet.http.HttpServletRequest;


import com.devops.db.DatabaseConnection;
import com.dhtmlx.planner.DHXEv;
import com.dhtmlx.planner.DHXEvent;
import com.dhtmlx.planner.DHXEventRec;
import com.dhtmlx.planner.DHXEventsManager;
import com.dhtmlx.planner.DHXStatus;
import com.mysql.jdbc.Statement;

public class EmploiManager<HttpSession, request> extends DHXEventsManager {
	HttpServletRequest request;

	public EmploiManager(HttpServletRequest request) {

		super(request);
		this.request = request;
	}

	public Iterable getEvents() {
		DHXEventsManager.date_format = "yyyy-MM-dd HH:mm:ss";
		List evs = new ArrayList();
		try {
			java.sql.Connection conn = DatabaseConnection.getConnection();
			java.sql.Statement statement = conn.createStatement();

			javax.servlet.http.HttpSession session = request.getSession(true);
			int promo_id = Integer.parseInt(session.getAttribute("ssuid")
					.toString());
			
			

			String query = "SELECT emploi_id, course_name, start_date, end_date, color FROM emploi WHERE uid= "+ promo_id +" ";
			String room = getRequest().getParameter("departments");
			if (room != null) {
				query += "WHERE room_id='" + room + "'";
			}

			ResultSet resultset = statement.executeQuery(query);

			while (resultset.next()) {
			
				EmploiRec e = new EmploiRec();
				e.setId(Integer.parseInt(resultset.getString("emploi_id")));
				e.setText(resultset.getString("course_name"));
				e.setStart_date(resultset.getString("start_date"));
				e.setEnd_date(resultset.getString("end_date"));
				e.setColor(resultset.getString("color"));
				evs.add(e);
			}
			conn.close();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		DHXEventsManager.date_format = "MM/dd/yyyy HH:mm";

		return evs;
	}
	

	@Override
	public DHXStatus saveEvent(DHXEv emploi, DHXStatus status) {
		java.sql.Connection conn = DatabaseConnection.getConnection();
		java.sql.PreparedStatement ps = null;
		java.sql.ResultSet result = null;
		EmploiRec e = (EmploiRec) emploi;
		
		HttpSession session = (HttpSession) request.getSession(true);
		int user_id = Integer.parseInt(((javax.servlet.http.HttpSession) session).getAttribute("ssuid")
				.toString());
		
		try {
			String query = null;
			String start_date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
					.format(e.getStart_date());
			String end_date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
					.format(e.getEnd_date());

			if (status == DHXStatus.UPDATE) {
				query = "UPDATE emploi SET course_name=?, start_date=?, end_date=?, color=? WHERE emploi_id=? ";
				ps = conn.prepareStatement(query,
						Statement.RETURN_GENERATED_KEYS);
				ps.setString(1, e.getText());
				ps.setString(2, start_date);
				ps.setString(3, end_date);
				ps.setString(4, e.getColor());
				ps.setInt(5, e.getId());
			
				
			} else if (status == DHXStatus.INSERT) {
				query = "INSERT INTO emploi (emploi_id, course_name, start_date, end_date,uid,color) VALUES (null, ?, ?, ?, ?, ?)  ";
				ps = conn.prepareStatement(query,
						Statement.RETURN_GENERATED_KEYS);
				ps.setString(1, e.getText());
				ps.setString(2, start_date);
				ps.setString(3, end_date);
				ps.setInt(4, user_id);
				ps.setString(5, e.getColor());
			} else if (status == DHXStatus.DELETE) {
				query = "DELETE FROM emploi WHERE emploi_id=?  LIMIT 1";
				ps = conn.prepareStatement(query,
						Statement.RETURN_GENERATED_KEYS);
				ps.setInt(1, emploi.getId());
			}
			if (ps != null) {
				ps.executeUpdate();
				result = ps.getGeneratedKeys();
				if (result.next()) {
					emploi.setId(result.getInt(1));
				}
			}

		
			if (status == DHXStatus.DELETE) {
				query = "DELETE FROM emploi WHERE emploi_id=? LIMIT 1";
				ps = conn.prepareStatement(query);
				ps.setInt(1, emploi.getId());
				ps.executeUpdate();
			}

		} catch (SQLException e1) {
			e1.printStackTrace();
		} finally {
			if (result != null)
				try {
					result.close();
				} catch (SQLException e1) {
				}
			if (ps != null)
				try {
					ps.close();
				} catch (SQLException e1) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e1) {
				}
		}

		return status;
	}

	@Override
	public DHXEv createEvent(String id, DHXStatus status) {
		return new EmploiRec();
	}

}
