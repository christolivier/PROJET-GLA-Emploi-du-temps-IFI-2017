package professeur;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import events.Event;
import events.EventModel;
import events.IeventsDao;
import events.EventDaoImp;

import professeur.Professeur;
import professeur.ProfesseurDaoImp;
import professeur.ProfesseurModel;
import professeur.IProfesseurDao;



@WebServlet(name = "cs", urlPatterns = { "/professeurServlet", "*.do" })
public class professeurServlet extends HttpServlet {
	private IProfesseurDao metier;
	private IeventsDao metierEV;
	@Override
	public void init() throws ServletException {
		//instencier la couche metier
		metier= new ProfesseurDaoImp();
		metierEV= new EventDaoImp();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				String path=request.getServletPath();
				System.out.println(path);
				
				if(path.equals("/search.do")){
					String motsearch=request.getParameter("motsearch");
					ProfesseurModel  model=new ProfesseurModel();
					model.setMotsearch(motsearch);
					List<Professeur> professeur=metier.ProfesseurParMC("%"+motsearch+"%");
					model.setProfesseur(professeur);
					request.setAttribute("model", model);
					request.getRequestDispatcher("admin/searchProf.jsp").forward(request, response); 
					
				}else if(path.equals("/searchG.do")){
					String motsearch=request.getParameter("motsearch");
					ProfesseurModel  model=new ProfesseurModel();
					model.setMotsearch(motsearch);
					List<Professeur> professeur=metier.ProfesseurParMC("%"+motsearch+"%");
					model.setProfesseur(professeur);
					request.setAttribute("model", model);
					//System.out.println("ok je resors");
					request.getRequestDispatcher("gestionProf.jsp").forward(request, response); 
					
				}else if (path.equals("/Addprof.do") && (request.getMethod().equals("POST"))){
					
					String nomprenom= request.getParameter("profname");
					String cours=request.getParameter("cours");
					String email=request.getParameter("email");
					String minicv=request.getParameter("minicv");
					Professeur p=metier.save(new Professeur(nomprenom, cours, email, minicv));
					request.setAttribute("Professeur", p);
					request.getRequestDispatcher("admin/confirmationprof.jsp").forward(request, response); 
				}else if(path.equals("/Supprime.do")){
					Long id = Long.parseLong(request.getParameter("id"));
					metier.deleteProfesseur(id);
					/*request.getRequestDispatcher("admin/searchProf.jsp?motCle=").forward(request, response);*/
				response.sendRedirect("search.do?motCle=");
					
				}else if(path.equals("/Edit.do")){
					Long id = Long.parseLong(request.getParameter("id"));
					
					Professeur p=metier.getProfessseur(id);
					request.setAttribute("Professeur", p);
					request.getRequestDispatcher("admin/EditProf.jsp").forward(request, response); 
					
				}else if(path.equals("/EditG.do")){
					Long id = Long.parseLong(request.getParameter("id"));
					Professeur p=metier.getProfessseur(id);
					request.setAttribute("Professeur", p);
					request.getRequestDispatcher("affichageProf.jsp").forward(request, response); 
					
				}else if (path.equals("/Update.do") && (request.getMethod().equals("POST"))){
					Long id=Long.parseLong(request.getParameter("id"))    ;
					String nomprenom= request.getParameter("profname");
					String cours=request.getParameter("cours");
					String email=request.getParameter("email");
					String minicv=request.getParameter("minicv");
					Professeur p=new Professeur(nomprenom, cours, email, minicv);
					p.setId(id);
					metier.update(p);
					
					request.setAttribute("Professeur", p);
					
					request.getRequestDispatcher("admin/confirmationprof.jsp").forward(request, response); 
				}
				
				//controleur events
				
				else if(path.equals("/searchEV.do")){
					System.out.println("dans la boucle events");
					String motCle=request.getParameter("motCle");
					EventModel  modelEV=new EventModel();
					modelEV.setMotCle(motCle);
					List<Event> event=metierEV.EventParMC("%"+motCle+"%");
					modelEV.setEvent(event);
					request.setAttribute("modelEV", modelEV);
					request.getRequestDispatcher("admin/searchEvent.jsp").forward(request, response); 
					
				}else if(path.equals("/searchGEV.do")){
					String motCle=request.getParameter("motCle");
					EventModel  modelEV=new EventModel();
					modelEV.setMotCle(motCle);
					List<Event> event=metierEV.EventParMC("%"+motCle+"%");
					modelEV.setEvent(event);
					request.setAttribute("modelEV", modelEV);
					request.getRequestDispatcher("gestionEV.jsp").forward(request, response); 
					
				}
				
				else if (path.equals("/AddEV.do") && (request.getMethod().equals("POST"))){
					String nom= request.getParameter("nom");
					String date=request.getParameter("date");
					String lieu=request.getParameter("lieu");
					Event e=metierEV.save(new Event(nom, date, lieu));
					request.setAttribute("Event", e);
					request.getRequestDispatcher("admin/confirmationEV.jsp").forward(request, response);
					
				}else if(path.equals("/SupprimeEV.do")){
					Long id = Long.parseLong(request.getParameter("id"));
					metierEV.deleteEvent(id);
					/*request.getRequestDispatcher("admin/searchProf.jsp?motCle=").forward(request, response);*/
				response.sendRedirect("searchEV.do?motCle=");
					
				}else if(path.equals("/EditEV.do")){
					Long id = Long.parseLong(request.getParameter("id"));
					Event e=metierEV.getEvent(id);
					request.setAttribute("Event", e);
					request.getRequestDispatcher("admin/EditEvent.jsp").forward(request, response); 
					
				}else if (path.equals("/UpdateEV.do") && (request.getMethod().equals("POST"))){
					Long id=Long.parseLong(request.getParameter("id"))    ;
					String nom= request.getParameter("nom");
					String date=request.getParameter("date");
					String lieu=request.getParameter("lieu");
					Event e=new Event(nom, date, lieu);
					e.setId(id);
					metierEV.update(e);
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

