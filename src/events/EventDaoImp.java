package events;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.devops.db.DatabaseConnection;

import professeur.Professeur;

public class EventDaoImp implements IeventsDao {

	@Override
	public Event save(Event e) {
		Connection connection = DatabaseConnection.getConnection();
		try {
			PreparedStatement ps =connection.prepareStatement(" INSERT INTO EVENTS (NOM_EV, DATE_EV, LIEU_EV) VALUES(?,?,?)");
			
			ps.setString(1, e.getNom());
			ps.setString(2,e.getDate());
			ps.setString(3,e.getLieu());
			ps.executeUpdate();
			
			PreparedStatement ps2 =connection.prepareStatement(" SELECT MAX(ID_EV) AS MAX_ID FROM EVENTS");
			ResultSet rs=ps2.executeQuery();
			if(rs.next()){
				
				e.setId(rs.getLong("MAX_ID"));
			}
			
			ps.close();
			
			
			
		} catch (SQLException a) {
			// TODO Auto-generated catch block
			a.printStackTrace();
		}
		return e;
	}
	

	@Override
	public List<Event> EventParMC(String mc) {
		List<Event> events =new ArrayList<Event>();
		Connection connection = DatabaseConnection.getConnection();
		try {
			PreparedStatement ps =connection.prepareStatement(" SELECT * FROM EVENTS WHERE DATE_EV LIKE ?");
			
			ps.setString(1, mc);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()){
			
				Event e=new Event();
				e.setId(rs.getLong("ID_EV"));
				e.setNom(rs.getString("NOM_EV"));
				e.setDate(rs.getString("DATE_EV"));
				e.setLieu(rs.getString("LIEU_EV"));
				events.add(e);
			}
		} catch (SQLException a) {
			// TODO Auto-generated catch block
			a.printStackTrace();
		}
		
		return events;
	}

	@Override
	public Event getEvent(Long id) {
		Event e=null;
		Connection connection = DatabaseConnection.getConnection();
		try {
			PreparedStatement ps =connection.prepareStatement(" SELECT * FROM EVENTS WHERE ID_EV= ?");
			
			ps.setLong(1, id);
			ResultSet rs=ps.executeQuery();
			
			if(rs.next()){
			
				e=new Event();
				e.setId(rs.getLong("ID_EV"));
				e.setNom(rs.getString("NOM_EV"));
				e.setDate(rs.getString("DATE_EV"));
				e.setLieu(rs.getString("LIEU_EV"));
				
			}
		} catch (SQLException a) {
			// TODO Auto-generated catch block
			a.printStackTrace();
		}
		
		return e;
	}

	@Override
	public Event update(Event e) {
		Connection connection = DatabaseConnection.getConnection();
		try {
			PreparedStatement ps =connection.prepareStatement(" UPDATE  EVENTS  SET NOM_EV=?,DATE_EV=?,LIEU_EV=? WHERE ID_EV=? ");
			
			ps.setString(1,e.getNom());
			ps.setString(2,e.getDate());
			ps.setString(3,e.getLieu());
			ps.setLong(4,e.getId());
			ps.executeUpdate();
			ps.close();	
		} catch (SQLException a) {
			// TODO Auto-generated catch block
			a.printStackTrace();
		}
		return e;
	}

	@Override
	public void deleteEvent(Long id) {
		Connection connection = DatabaseConnection.getConnection();
		try {
			PreparedStatement ps =connection.prepareStatement(" DELETE FROM EVENTS WHERE ID_EV=?");
			
			ps.setLong(1, id);
			ps.executeUpdate();
			ps.close();
			
			
			
		} catch (SQLException a) {
			// TODO Auto-generated catch block
			a.printStackTrace();
		}
		
	}

}
