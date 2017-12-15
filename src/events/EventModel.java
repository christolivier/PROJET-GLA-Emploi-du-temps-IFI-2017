package events;

import java.util.ArrayList;
import java.util.List;

public class EventModel {
private String motCle;
private List<Event> event =new ArrayList<Event>();
public String getMotCle() {
	return motCle;
}
public void setMotCle(String motCle) {
	this.motCle = motCle;
}
public List<Event> getEvent() {
	return event;
}
public void setEvent(List<Event> event) {
	this.event = event;
}

}
