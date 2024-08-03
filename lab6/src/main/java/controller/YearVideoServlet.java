package controller;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.StoredProcedureQuery;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.JpaUtils;

@WebServlet("/YearVideoServlet")
public class YearVideoServlet extends HttpServlet {
	private EntityManager em;

	@Override
	public void init() throws ServletException {
		em = JpaUtils.getEntityManager();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String query = "SELECT DISTINCT YEAR(LikeDate) AS Year FROM Favorites ORDER BY Year DESC";
		List<Integer> years = em.createNativeQuery(query).getResultList();
		req.setAttribute("years", years);

		// Lấy giá trị năm đã chọn từ request nếu có
		String selectedYear = req.getParameter("selectedYear");
		req.setAttribute("selectedYear", selectedYear);

		req.getRequestDispatcher("/views/YearVideo.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Integer year = Integer.valueOf(req.getParameter("selectedYear"));
		StoredProcedureQuery query = em.createNamedStoredProcedureQuery("Report.favoriteByYear");
		query.setParameter("Year", year);
		List<Object[]> reports = query.getResultList();
		req.setAttribute("favorite", reports);

		// Gọi doGet để xử lý việc hiển thị lại trang JSP với dữ liệu cần thiết
		req.setAttribute("selectedYear", year.toString()); // Truyền giá trị năm đã chọn
		doGet(req, resp);
	}

	@Override
	public void destroy() {
		if (em != null) {
			em.close();
		}
	}
}
