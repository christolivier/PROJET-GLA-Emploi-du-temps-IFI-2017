package TestUnitaire;
import java.util.List;
import org.junit.Test;
import professeur.Professeur;
import professeur.ProfesseurDaoImp;

public class TestJunit4 {
	@Test
	public void TestAjouterProfesseur(){
		
		ProfesseurDaoImp dao=new ProfesseurDaoImp();
		Professeur p1=dao.save(new Professeur("VINH TUONG", "GESTION DE PROJET", "vinhhotuonh@ifi.edu.vn", "DIRECTEUR AJOIND IFI"));
		System.out.println(p1.toString());
		//System.out.println("chercher les professeur par le cours");
		//List<Professeur> prof=dao.ProfesseurParMC("%G%");
		//for(Professeur p :prof ){
			//System.out.println(p.toString());
		//}
	}
	
	
}
