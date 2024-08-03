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

import entity.User;
import utils.JpaUtils;

@WebServlet("/VideoIdSServler")
public class VideoIdSServler extends HttpServlet {
	private EntityManager em;

	@Override
	public void init() throws ServletException {
		em = JpaUtils.getEntityManager(); // Khởi tạo EntityManager khi servlet được khởi tạo
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/VideoId.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		int videoId = Integer.parseInt(id);
		String jpql = "SELECT o.user FROM Favorite o WHERE o.video.id=:vid";
		TypedQuery<User> query = em.createQuery(jpql, User.class);
		query.setParameter("vid", videoId);
		List<User> list = query.getResultList();
		for (User user : list) {
			System.out.println(user.getFullname());
		}
		req.setAttribute("users", list);
		req.getRequestDispatcher("/views/VideoId.jsp").forward(req, resp);

	}

	@Override
	public void destroy() {
		if (em != null) {
			em.close();
		}
	}
}
