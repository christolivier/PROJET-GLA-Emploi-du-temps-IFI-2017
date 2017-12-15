package professeur;

import java.util.List;

public class testDao {

	public static void main(String[] args) {
		ProfesseurDaoImp dao=new ProfesseurDaoImp();
		//Professeur p1=dao.save(new Professeur("VINH TUONG", "GESTION DE PROJET", "vinhhotuonh@ifi.edu.vn", "DIRECTEUR AJOIND IFI"));
		//System.out.println(p1.toString());
		System.out.println("chercher les professeur par le cours");
		List<Professeur> prof=dao.ProfesseurParMC("%G%");
		for(Professeur p :prof ){
			System.out.println(p.toString());
		}
	}

}
