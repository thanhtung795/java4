package controller;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Video;
import utils.JpaUtils;

@WebServlet("/RandomVideoServlet")
public class RandomVideoServlet extends HttpServlet {
	private EntityManager em;

	@Override
	public void init() throws ServletException {
		em = JpaUtils.getEntityManager(); // Khởi tạo EntityManager khi servlet được khởi tạo
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Query query = em.createNamedQuery("Report.random10");
		List<Video> list = query.getResultList();
		req.setAttribute("videos", list);
		req.getRequestDispatcher("/views/RandomVideo.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String SoLuong = req.getParameter("limit");
		int limit = SoLuong != null ? Integer.parseInt(SoLuong) : 10; // Mặc định lấy 10 nếu không có tham số

		String sql = "SELECT TOP " + limit + " * FROM Videos ORDER BY NEWID()";
		Query query = em.createNativeQuery(sql, Video.class);
		List<Video> list = query.getResultList();

		req.setAttribute("videos", list);
		req.getRequestDispatcher("/views/RandomVideo.jsp").forward(req, resp);
	}

	@Override
	public void destroy() {
		if (em != null) {
			em.close();
		}
	}
}
