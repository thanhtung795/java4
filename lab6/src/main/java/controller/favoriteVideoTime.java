package controller;

import java.io.IOException;
import java.sql.Date;
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

@WebServlet("/favoriteVideoTime")
public class favoriteVideoTime extends HttpServlet {
	private EntityManager em;

	@Override
	public void init() throws ServletException {
		em = JpaUtils.getEntityManager(); // Khởi tạo EntityManager khi servlet được khởi tạo
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/favoriteVideoTime.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// Lấy tham số từ request
			String fromDateStr = req.getParameter("fromDate");
			String toDateStr = req.getParameter("toDate");

			// Chuyển đổi thành java.sql.Date
			Date fromDate = Date.valueOf(fromDateStr);
			Date toDate = Date.valueOf(toDateStr);

			// Tạo truy vấn JPQL với tham số
			TypedQuery<Video> query = em.createNamedQuery("Video.findInRange", Video.class);
			query.setParameter("min", fromDate);
			query.setParameter("max", toDate);

			// Lấy kết quả và đặt vào request attribute
			List<Video> list = query.getResultList();
			req.setAttribute("fromDate", fromDate);
			req.setAttribute("toDate", toDate);
			req.setAttribute("videos", list);
			req.getRequestDispatcher("/views/favoriteVideoTime.jsp").forward(req, resp);
		} catch (Exception e) {
			req.setAttribute("error", "Invalid date range");
			req.getRequestDispatcher("/views/favoriteVideoTime.jsp").forward(req, resp);
		}
	}

	@Override
	public void destroy() {
		if (em != null) {
			em.close();
		}
	}
}
