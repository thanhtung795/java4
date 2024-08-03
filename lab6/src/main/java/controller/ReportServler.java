package controller;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Report;
import utils.JpaUtils;

@WebServlet("/ReportServler")
public class ReportServler extends HttpServlet {
	private EntityManager em;

	@Override
	public void init() throws ServletException {
		em = JpaUtils.getEntityManager(); // Khởi tạo EntityManager khi servlet được khởi tạo
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String jpql = "SELECT new Report(o.video.title, count(o), max(o.likeDate), min(o.likeDate))"
				+ " FROM Favorite o" + " GROUP BY o.video.title" + " ORDER BY count(o) DESC";

		TypedQuery<Report> query = em.createQuery(jpql, Report.class);
		List<Report> list = query.getResultList();
		req.setAttribute("videos", list);
		req.getRequestDispatcher("/views/Report.jsp").forward(req, resp);
	}

	@Override
	public void destroy() {
		if (em != null) {
			em.close();
		}
	}
}
