package professeur;

import java.util.List;

public interface IProfesseurDao {
	public Professeur save (Professeur p);// methode qui permet d'ajouter un professeur
	public List<Professeur> ProfesseurParMC(String mc); // liste des professeur par mot clé
	public Professeur getProfessseur(Long id); // methode qui permet de rechercher un professeur
	public Professeur update (Professeur p); // methode qui permet de faire la mise a jour
	public void deleteProfesseur (Long id); // methode qui permet de suprimer un professeur
	

}
