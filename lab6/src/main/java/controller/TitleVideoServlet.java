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

import entity.Video;
import utils.JpaUtils;

@WebServlet("/TitleVideoServlet")
public class TitleVideoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private EntityManager em;

	@Override
	public void init() throws ServletException {
		em = JpaUtils.getEntityManager(); // Khởi tạo EntityManager khi servlet được khởi tạo
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/TitleVideo.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String keyword = req.getParameter("title");
		if (keyword == null || keyword.trim().isEmpty()) {
			req.setAttribute("error", "Title không được để trống");
			req.getRequestDispatcher("/views/TitleVideo.jsp").forward(req, resp);
			return;
		}

		String jpql = "SELECT DISTINCT o.video FROM Favorite o WHERE o.video.title LIKE :keyword";
		TypedQuery<Video> query = em.createQuery(jpql, Video.class);
		query.setParameter("keyword", "%" + keyword + "%");
		List<Video> list = query.getResultList();

		req.setAttribute("videos", list);
		req.getRequestDispatcher("/views/TitleVideo.jsp").forward(req, resp);
	}

	@Override
	public void destroy() {
		if (em != null) {
			em.close();
		}
	}
}
