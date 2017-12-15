package events;

import java.util.List;



public interface IeventsDao {

	public Event save (Event e);// methode qui permet d'ajouter un Event
	public List<Event> EventParMC(String mc); // liste des Event par mot clé
	public Event getEvent(Long id); // methode qui permet de rechercher un Event
	public Event update (Event e); // methode qui permet de faire la mise a jour
	public void deleteEvent (Long id); // methode qui permet de suprimer un Event
}
