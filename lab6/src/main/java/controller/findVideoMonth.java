package controller;

import java.io.IOException;
import java.util.ArrayList;
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

@WebServlet("/findVideoMonth")
public class findVideoMonth extends HttpServlet {
	private EntityManager em;

	@Override
	public void init() throws ServletException {
		em = JpaUtils.getEntityManager(); // Khởi tạo EntityManager khi servlet được khởi tạo
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.getRequestDispatcher("/views/findVideoMonth.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String[] values = req.getParameterValues("month");
		List<Integer> months = new ArrayList<>();

		// Kiểm tra nếu mảng values là null
		if (values == null) {
			req.setAttribute("error", "Please select at least one month.");
			req.getRequestDispatcher("/views/findVideoMonth.jsp").forward(req, resp);
			return; // Dừng xử lý thêm
		}

		// Tiếp tục xử lý khi mảng values không null
		for (String m : values) {
			months.add(Integer.valueOf(m));
		}

		TypedQuery<Video> query = em.createNamedQuery("Video.findInMonths", Video.class);
		query.setParameter("months", months);
		List<Video> list = query.getResultList();

		req.setAttribute("videos", list);
		req.setAttribute("selectedMonths", months);
		req.getRequestDispatcher("/views/findVideoMonth.jsp").forward(req, resp);
	}

	@Override
	public void destroy() {
		if (em != null) {
			em.close();
		}
	}
}
