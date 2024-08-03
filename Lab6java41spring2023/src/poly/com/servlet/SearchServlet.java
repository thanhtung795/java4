package poly.com.servlet;

import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.poly.entity.Favorite;
import edu.poly.entity.Report;
import edu.poly.entity.user;
import edu.poly.entity.Video;
import edu.poly.utils.JpaUtils;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

@WebServlet({
	"/id-search",
	"/title-search",
	"/persion-search",
	"/favorite-search",
	"/group-video"
})
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EntityManager em = JpaUtils.getEntityManager();
	@Override
	protected void finalize() throws Throwable{
		em.close();
		super.finalize();
	}

    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String forward = "id-search.jsp";
		String url = request.getRequestURL().toString();
		if(url.contains("id-search")) {
			forward = "id-search.jsp";
		}
		if(url.contains("title-search")) {
			forward = "title-search.jsp";
		}
		if(url.contains("persion-search")) {
			forward = "persion-search.jsp";
		}
		if(url.contains("favorite-search")) {
			favoriteSearch(request, response);
			forward = "favorite-search.jsp";
		}
		if(url.contains("group-video")) {
			groupVideo(request, response);
			forward = "group-video.jsp";
		}
		request.getRequestDispatcher("/views/" + forward).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String forward = "";
		String url = request.getRequestURL().toString();
		if(url.contains("id-search")) {
			idSearch(request, response);
			forward = "id-search.jsp";
		}
		if(url.contains("title-search")) {
			titleSearch(request, response);
			forward = "title-search.jsp";
		}
		if(url.contains("persion-search")) {
			persionSearch(request, response);
			forward = "persion-search.jsp";
		}
		request.getRequestDispatcher("/views/"+forward).forward(request, response);
	}
	protected void idSearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String id = request.getParameter("id");
			if(id.equals("")) {
				request.setAttribute("error_id", "Username invalid!");
			}
			else {
				user user = em.find(user.class, id);
				if(user == null) {
					request.setAttribute("error_id", "Username invalid!");
				}
				else {
					List<Favorite> favorites = user.getFavorites();
					request.setAttribute("user", user);
					request.setAttribute("favorite", favorites);
				}
			}
		} 
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			request.setAttribute("error_id", "Username invalid!");
		}
	}
	
	protected void titleSearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String title = request.getParameter("title");
			//String spql = "Select distinct o.video from Favorite o where o.video.title like:keyword";
			String spql = "Select distinct o from Video o where o.title like:keyword";
			TypedQuery<Video> query = em.createQuery(spql, Video.class);
			query.setParameter("keyword", "%" + title + "%");
			List<Video> list = query.getResultList();
			request.setAttribute("videos", list);
			request.setAttribute("keyword", title);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	protected void persionSearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String id = request.getParameter("id");
			String spql = "Select o.user from Favorite o where o.video.id=:id";
			TypedQuery<user> query = em.createQuery(spql, user.class);
			query.setParameter("id", id);
			List<user> list = query.getResultList();
			request.setAttribute("users", list);
			request.setAttribute("id", id);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	protected void favoriteSearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String favorite = request.getParameter("favorite");
			if(!favorite.equals("")) {
				String spql = "";
				if(favorite.equals("true")) 
					spql = "Select o from Video o where o.favorites is not empty";
				else 
					spql = "Select o from Video o where o.favorites is empty";
				TypedQuery<Video> query = em.createQuery(spql, Video.class);
				List<Video> list = query.getResultList();
				request.setAttribute("Video", list);
				request.setAttribute("favorite", favorite);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	protected void groupVideo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String spql = "select new Report(o.video.title, count(o), max(o.likeDate), min(o.likeDate))"
					+" from Favorite o group by o.video.title";
			TypedQuery<Report> query = em.createQuery(spql, Report.class);
			List<Report> list = query.getResultList();
			request.setAttribute("reports", list);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
