package com.devops.reglage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dhtmlx.planner.DHXPlanner;
import com.dhtmlx.planner.DHXSkin;
import com.devops.db.*;

public class EmploiSetting {

	Connection connection = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	int uid = 99999999;
	String PDF = "";
	String MINC = "";
	String SKIN = "";
	String LNG = "";
	String MAP = "";
	String AGEND = "";
	String ICAL = "";

	DHXPlanner s = new DHXPlanner("./codebase/", DHXSkin.TERRACE);

	DatabaseConnection dbc = new DatabaseConnection();

	// PDF
	public String activepdf(int uidd) {
		uid = uidd;

		try {
			connection = DatabaseConnection.getConnection();
			ps = connection
					.prepareStatement("select * from setting where uid=? ");
			ps.setInt(1, uid);

			rs = ps.executeQuery();
			if (rs.next()) {

				PDF = rs.getString("pdf");

			}

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

		return PDF;

	}

	// Mini Calendar
	public String activeminc(int uidd) {
		uid = uidd;

		try {
			connection = DatabaseConnection.getConnection();
			ps = connection
					.prepareStatement("select * from setting where uid=? ");
			ps.setInt(1, uid);

			rs = ps.executeQuery();
			if (rs.next()) {

				MINC = rs.getString("minc");

			}

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

		return MINC;

	}

	// Skin
	public String skinChange(int uidd) {
		uid = uidd;

		try {
			connection = DatabaseConnection.getConnection();
			ps = connection
					.prepareStatement("select * from setting where uid=? ");
			ps.setInt(1, uid);

			rs = ps.executeQuery();
			if (rs.next()) {

				SKIN = rs.getString("skin");

			}

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

		return SKIN;

	}

	// Language
	public String changeLanguage(int uidd) {
		uid = uidd;

		try {
			connection = DatabaseConnection.getConnection();
			ps = connection
					.prepareStatement("select * from setting where uid=? ");
			ps.setInt(1, uid);

			rs = ps.executeQuery();
			if (rs.next()) {

				LNG = rs.getString("language");

			}

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

		return LNG;

	}

	// MAP
	public String activeMap(int uidd) {
		uid = uidd;

		try {
			connection = DatabaseConnection.getConnection();
			ps = connection
					.prepareStatement("select * from setting where uid=? ");
			ps.setInt(1, uid);

			rs = ps.executeQuery();
			if (rs.next()) {

				MAP = rs.getString("map");

			}

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

		return MAP;

	}

	// AGENDA
	public String activeAgenda(int uidd) {
		uid = uidd;

		try {
			connection = DatabaseConnection.getConnection();
			ps = connection
					.prepareStatement("select * from setting where uid=? ");
			ps.setInt(1, uid);

			rs = ps.executeQuery();
			if (rs.next()) {

				AGEND = rs.getString("agenda");

			}

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

		return AGEND;

	}

	// ICAL
	public String activeIcal(int uidd) {
		uid = uidd;

		try {
			connection = DatabaseConnection.getConnection();
			ps = connection
					.prepareStatement("select * from setting where uid=? ");
			ps.setInt(1, uid);

			rs = ps.executeQuery();
			if (rs.next()) {

				ICAL = rs.getString("ical");

			}

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

		return ICAL;

	}

}
