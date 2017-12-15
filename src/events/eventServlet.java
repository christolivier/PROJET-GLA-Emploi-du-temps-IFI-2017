/*package events;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import events.IeventsDao;
import events.Event;
import events.EventModel;
import events.EventDaoImp;


@WebServlet(name = "cs", urlPatterns = { "/eventServlet", "*.do" })
public class eventServlet extends HttpServlet {
	private IeventsDao metier;
	@Override
	public void init() throws ServletException {
		//instencier la couche metier
		metier= new EventDaoImp();
	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path=request.getServletPath();
		System.out.println(path);
		if(path.equals("/searchEV.do")){
			System.out.println("dans la boucle");
			String motCle=request.getParameter("motCle");
			EventModel  model=new EventModel();
			model.setMotCle(motCle);
			List<Event> event=metier.EventParMC("%"+motCle+"%");
			model.setEvent(event);
			request.setAttribute("model", model);
			request.getRequestDispatcher("admin/searchEvent.jsp").forward(request, response); 
			
		}else if (path.equals("/AddEV.do") && (request.getMethod().equals("POST"))){
			String nom= request.getParameter("nom");
			String date=request.getParameter("date");
			String lieu=request.getParameter("lieu");
			Event e=metier.save(new Event(nom, date, lieu));
			request.setAttribute("Event", e);
			request.getRequestDispatcher("admin/confirmationEV.jsp").forward(request, response);
			
		}else if(path.equals("/SupprimeEV.do")){
			Long id = Long.parseLong(request.getParameter("id"));
			metier.deleteEvent(id);
			request.getRequestDispatcher("admin/searchProf.jsp?motCle=").forward(request, response);
		response.sendRedirect("searchEV.do?motCle=");
			
		}else if(path.equals("/EditEV.do")){
			Long id = Long.parseLong(request.getParameter("id"));
			Event e=metier.getEvent(id);
			request.setAttribute("Event", e);
			request.getRequestDispatcher("admin/EditEvent.jsp").forward(request, response); 
			
		}else if (path.equals("/UpdateEV.do") && (request.getMethod().equals("POST"))){
			Long id=Long.parseLong(request.getParameter("id"))    ;
			String nom= request.getParameter("nom");
			String date=request.getParameter("date");
			String lieu=request.getParameter("lieu");
			Event e=new Event(nom, date, lieu);
			e.setId(id);
			metier.update(e);
			request.setAttribute("Event",e);
			request.getRequestDispatcher("admin/confirmationEV.jsp").forward(request, response); 
		}
		
		else{
			response.sendError(response.SC_NOT_FOUND);
			}
}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
}
*/