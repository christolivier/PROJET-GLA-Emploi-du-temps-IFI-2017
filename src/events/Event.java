package events;

import java.io.Serializable;
import java.util.Date;

public class Event implements Serializable {
	private Long id;
	private String nom;
	private String date;
	private String lieu;
	@Override
	public String toString() {
		return "Event [id=" + id + ", nom=" + nom + ", date=" + date + ", lieu=" + lieu + "]";
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getLieu() {
		return lieu;
	}
	public void setLieu(String lieu) {
		this.lieu = lieu;
	}
	public Event(String nom, String date, String lieu) {
		super();
		this.nom = nom;
		this.date = date;
		this.lieu = lieu;
	}
	public Event() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	

}
