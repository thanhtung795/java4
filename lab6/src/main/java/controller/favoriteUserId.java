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
import entity.Video;
import utils.JpaUtils;

@WebServlet("/favoriteUserId")
public class favoriteUserId extends HttpServlet {

	private EntityManager em;

	@Override
	public void init() throws ServletException {
		em = JpaUtils.getEntityManager(); // Khởi tạo EntityManager khi servlet được khởi tạo
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/favoriteUserId.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String idStr = req.getParameter("id");
		try {
			int id = Integer.parseInt(idStr);
			User user = em.find(User.class, id);
			if (user == null) {
				req.setAttribute("error", "User not found");
				req.getRequestDispatcher("/views/favoriteUserId.jsp").forward(req, resp);
				return;
			}
			TypedQuery<Video> query = em.createNamedQuery("Video.findByUser", Video.class);
			query.setParameter("id", id);
			List<Video> list = query.getResultList();
			req.setAttribute("user", user);
			req.setAttribute("videos", list);
			req.getRequestDispatcher("/views/favoriteUserId.jsp").forward(req, resp);
		} catch (NumberFormatException e) {
			req.setAttribute("error", "Invalid User ID");
			req.getRequestDispatcher("/views/favoriteUserId.jsp").forward(req, resp);
		}
	}

	@Override
	public void destroy() {
		if (em != null) {
			em.close();
		}
	}
}
