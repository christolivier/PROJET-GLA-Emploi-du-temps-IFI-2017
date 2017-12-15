package professeur;

import java.util.ArrayList;
import java.util.List;

public class ProfesseurModel {

	private String  motsearch;
	private List<Professeur> professeur=new ArrayList<Professeur> ();
	public String getMotsearch() {
		return motsearch;
	}
	public void setMotsearch(String motsearch) {
		this.motsearch = motsearch;
	}
	public List<Professeur> getProfesseur() {
		return professeur;
	}
	public void setProfesseur(List<Professeur> professeur) {
		this.professeur = professeur;
	}
	
}




