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

@WebServlet("/FavoriteServlet")
public class FavoriteServlet extends HttpServlet {

	private EntityManager em;

	@Override
	public void init() throws ServletException {
		em = JpaUtils.getEntityManager(); // Khởi tạo EntityManager khi servlet được khởi tạo
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/Favorite.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		boolean favorite = Boolean.parseBoolean(req.getParameter("favorite"));
		String jpql = "SELECT o FROM Video o WHERE o.favorites IS EMPTY";
		if (favorite) {
			jpql = "SELECT o FROM Video o WHERE o.favorites IS NOT EMPTY";
		}
		TypedQuery<Video> query = em.createQuery(jpql, Video.class);
		List<Video> list = query.getResultList();
		req.setAttribute("favorite", favorite);
		req.setAttribute("videos", list); // Sửa dấu ngoặc kép và thêm dấu chấm phẩy
		req.getRequestDispatcher("/views/Favorite.jsp").forward(req, resp); // Chuyển tiếp đến trang JSP
	}

	@Override
	public void destroy() {
		if (em != null) {
			em.close();
		}
	}
}
