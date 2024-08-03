package poly.com.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import javax.persistence.Query;
import javax.persistence.StoredProcedureQuery;
import javax.persistence.TypedQuery;

/**
 * Servlet implementation class Bai3SearchServlet
 */
@WebServlet({
	"/bai3-title",
	"/bai3-id",
	"/bai3-range",
	"/bai3-months",
	"/bai4-ran",
	"/bai4-year"
})
public class Bai3SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EntityManager em = JpaUtils.getEntityManager();
	@Override
	protected void finalize() throws Throwable{
		em.close();
		super.finalize();
	}
	
    public Bai3SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String forward = "bai3-title.jsp";
		String url = request.getRequestURL().toString();
		if(url.contains("bai3-title")) {
			forward = "bai3-title.jsp";
		}
		if(url.contains("bai3-id")) {
			forward = "bai3-id.jsp";
		}
		if(url.contains("bai3-range")) {
			forward = "bai3-range.jsp";
		}
		if(url.contains("bai3-months")) {
			forward = "bai3-months.jsp";
		}
		if(url.contains("bai4-ran")) {
			random10(request, response);
			forward = "bai4-ran.jsp";
		}
		if(url.contains("bai4-year")) {
			if(request.getParameter("year")==null)
				yearSelect(request, response);
			else 
				yearSearch(request, response);
			forward = "bai4-year.jsp";
		}
		request.getRequestDispatcher("/views/" + forward).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String forward = "bai3-title.jsp";
		String url = request.getRequestURL().toString();
		if(url.contains("bai3-title")) {
			titleSearch(request, response);
			forward = "bai3-title.jsp";
		}
		if(url.contains("bai3-id")) {
			idSearch(request, response);
			forward = "bai3-id.jsp";
		}
		if(url.contains("bai3-range")) {
			rangeSearch(request, response);
			forward = "bai3-range.jsp";
		}
		if(url.contains("bai3-months")) {
			monthSearch(request, response);
			forward = "bai3-months.jsp";
		}
		request.getRequestDispatcher("/views/" + forward).forward(request, response);
	}
	
	protected void titleSearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String title = request.getParameter("title");
			TypedQuery<Video> query = em.createNamedQuery("Video.findByKeyword", Video.class);
			query.setParameter("keyword", "%" + title + "%");
			List<Video> list = query.getResultList();
			request.setAttribute("videos", list);
			request.setAttribute("keyword", title);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
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
					TypedQuery<Video> query = em.createNamedQuery("Video.findByUser", Video.class);
					query.setParameter("id", id);
					List<Video> video = query.getResultList();
					request.setAttribute("user", user);
					request.setAttribute("favorite", video);
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			request.setAttribute("error_id", "Username invalid!");
		}
	}
	
	protected void rangeSearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String dateFrom = request.getParameter("dateFrom");
			String dateTo = request.getParameter("dateTo");
			if(!dateFrom.equals("") && !dateTo.equals("")) {
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				Date dateF = format.parse(dateFrom);
				Date dateT = format.parse(dateTo);
				TypedQuery<Video> query = em.createNamedQuery("Video.findInRange", Video.class);
				query.setParameter("min", dateF);
				query.setParameter("max", dateT);
				List<Video> video = query.getResultList();
				request.setAttribute("videos", video);
				request.setAttribute("dateFrom", dateFrom);
				request.setAttribute("dateTo", dateTo);
			}
			else {
				request.setAttribute("error_date", "Date null!");
				request.setAttribute("dateFrom", dateFrom);
				request.setAttribute("dateTo", dateTo);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			request.setAttribute("error_date", "Fail!");
		}
	}
	
	protected void monthSearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String[] months = request.getParameterValues("month");
			if(months!=null) {
				List<Integer> list = new ArrayList<>();
				for(String x:months) {
					list.add(Integer.parseInt(x));
				}
				List<Boolean> listlist = new ArrayList<>();
				for(int i=1;i<=12;i++) {
					if(list.contains(i))
						listlist.add(true);
					else 
						listlist.add(false);
				}
				TypedQuery<Video> query = em.createNamedQuery("Video.findInMonths", Video.class);
				query.setParameter("months", list);
				List<Video> video = query.getResultList();
				request.setAttribute("videos", video);
				request.setAttribute("result", listlist);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			request.setAttribute("error_date", "Fail!");
		}
	}
	
	protected void random10(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			Query query = em.createNamedQuery("Report.random10");
			List<Video> video = query.getResultList();
			request.setAttribute("videos", video);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			request.setAttribute("error_date", "Fail!");
		}
	}
	
	protected void yearSearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			Integer year = Integer.parseInt(request.getParameter("year"));
			Integer index = Integer.parseInt(request.getParameter("index"));
			StoredProcedureQuery query = em.createNamedStoredProcedureQuery("Report.favoriteByYear");
			query.setParameter("year", year);
			List<Object[]> reports = query.getResultList();
			request.setAttribute("reports", reports);
			request.setAttribute("index", index);
			TypedQuery<Integer> query1 = em.createNamedQuery("Video.selectYear", Integer.class);
			List<Integer> year1 = query1.getResultList();
			List<Object[]> yearyear = new ArrayList<>();
			for(int i=0;i<year1.size();i++) {
				Object[] row = new Object[] {
						year1.get(i),
						i
				};
				yearyear.add(row);
			}
			request.setAttribute("years", yearyear);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	protected void yearSelect(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			TypedQuery<Integer> query = em.createNamedQuery("Video.selectYear", Integer.class);
			List<Integer> year = query.getResultList();
			List<Object[]> yearyear = new ArrayList<>();
			for(int i=0;i<year.size();i++) {
				Object[] row = new Object[] {
						year.get(i),
						i
				};
				yearyear.add(row);
			}
			request.setAttribute("years", yearyear);
			StoredProcedureQuery query2 = em.createNamedStoredProcedureQuery("Report.favoriteByYear");
			query2.setParameter("year", year.get(0));
			List<Object[]> reports = query2.getResultList();
			request.setAttribute("reports", reports);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
