package professeur;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.devops.db.DatabaseConnection;

public class ProfesseurDaoImp implements IProfesseurDao {

	@Override
	public Professeur save(Professeur p) {
	
		Connection connection = DatabaseConnection.getConnection();
		try {
			PreparedStatement ps =connection.prepareStatement(" INSERT INTO PROFESSEUR (NOMPRENOM_PROF, COURS, EMAIL,MINICV) VALUES(?,?,?,?)");
			
			ps.setString(1, p.getNomprenom());
			ps.setString(2,p.getCours());
			ps.setString(3,p.getEmail());
			ps.setString(4,p.getMinicv());
			ps.executeUpdate();
			
			PreparedStatement ps2 =connection.prepareStatement(" SELECT MAX(ID_PROF) AS MAX_ID FROM PROFESSEUR");
			ResultSet rs=ps2.executeQuery();
			if(rs.next()){
				
				p.setId(rs.getLong("MAX_ID"));
			}
			
			ps.close();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return p;
	}

	@Override
	public List<Professeur> ProfesseurParMC(String mc) {
			List<Professeur> professeurs =new ArrayList<Professeur>();
		Connection connection = DatabaseConnection.getConnection();
		try {
			PreparedStatement ps =connection.prepareStatement(" SELECT * FROM PROFESSEUR WHERE COURS LIKE ?");
			
			ps.setString(1, mc);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()){
			
				Professeur p=new Professeur();
				p.setId(rs.getLong("ID_PROF"));
				p.setNomprenom(rs.getString("NOMPRENOM_PROF"));
				p.setCours(rs.getString("COURS"));
				p.setEmail(rs.getString("EMAIL"));
				p.setMinicv(rs.getString("MINICV"));
				professeurs.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return professeurs;
	}

	@Override
	public Professeur getProfessseur(Long id) {
		Professeur p=null;
		Connection connection = DatabaseConnection.getConnection();
		try {
			PreparedStatement ps =connection.prepareStatement(" SELECT * FROM PROFESSEUR WHERE ID_PROF= ?");
			
			ps.setLong(1, id);
			ResultSet rs=ps.executeQuery();
			
			if(rs.next()){
			
				p=new Professeur();
				p.setId(rs.getLong("ID_PROF"));
				p.setNomprenom(rs.getString("NOMPRENOM_PROF"));
				p.setCours(rs.getString("COURS"));
				p.setEmail(rs.getString("EMAIL"));
				p.setMinicv(rs.getString("MINICV"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return p;
	}

	@Override
	public Professeur update(Professeur p) {
		Connection connection = DatabaseConnection.getConnection();
		try {
			PreparedStatement ps =connection.prepareStatement(" UPDATE  PROFESSEUR  SET NOMPRENOM_PROF=?,COURS=?,EMAIL=?,MINICV=? WHERE ID_PROF=? ");
			
			ps.setString(1,p.getNomprenom());
			ps.setString(2,p.getCours());
			ps.setString(3,p.getEmail());
			ps.setString(4,p.getMinicv());
			ps.setLong(5,p.getId());
			ps.executeUpdate(); 
			ps.close();	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return p;
	}

	@Override
	public void deleteProfesseur(Long id) {
		Connection connection = DatabaseConnection.getConnection();
		try {
			PreparedStatement ps =connection.prepareStatement(" DELETE FROM PROFESSEUR WHERE ID_PROF=?");
			
			ps.setLong(1, id);
			ps.executeUpdate();
			ps.close();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
		
	}

	
	


