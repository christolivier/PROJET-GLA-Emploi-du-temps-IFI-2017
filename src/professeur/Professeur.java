package professeur;

import java.io.Serializable;

public class Professeur implements Serializable {
	private Long id;
	private String nomprenom;
	private String cours;
	private String email;
	private String minicv;
	
		
	@Override
	public String toString() {
		return "Professeur [id=" + id + ", nomprenom=" + nomprenom + ", cours=" + cours + ", email=" + email
				+ ", minicv=" + minicv + "]";
	}


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getNomprenom() {
		return nomprenom;
	}


	public void setNomprenom(String nomprenom) {
		this.nomprenom = nomprenom;
	}


	public String getCours() {
		return cours;
	}


	public void setCours(String cours) {
		this.cours = cours;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getMinicv() {
		return minicv;
	}


	public void setMinicv(String minicv) {
		this.minicv = minicv;
	}


	public Professeur(String nomprenom, String cours, String email, String minicv) {
		super();
		this.nomprenom = nomprenom;
		this.cours = cours;
		this.email = email;
		this.minicv = minicv;
	}


	public Professeur() {
		super();
		// TODO Auto-generated constructor stub
	}

}
