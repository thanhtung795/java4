package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import entity.User;

@WebServlet({ "/home", "/about", "/contact", "/managent" })
public class ViewMain extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String viewPage = "";
		String uri = req.getRequestURI();
		if (uri.endsWith("home")) {
			viewPage = "/views/home.jsp";
		} else if (uri.contains("about")) {
			viewPage = "/views/about.jsp";
		} else if (uri.contains("contact")) {
			viewPage = "/views/contact.jsp";
		} else if (uri.contains("managent")) {
			viewPage = "/views/managent.jsp";
		} else {
			viewPage = "/views/home.jsp"; // Trang mặc định nếu URI không khớp
		}
		findPage(req, resp);
		req.setAttribute("view", viewPage);
		req.getRequestDispatcher("/index.jsp").forward(req, resp);

	}

	protected void findPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pageStr = request.getParameter("page");
		int pageInt = (pageStr != null && !pageStr.isEmpty()) ? Integer.parseInt(pageStr) : 1;

		try {
			UserDAO dao = new UserDAO();
			int pageSize = 7; // Kích thước mỗi trang
			List<User> list = dao.findPage(pageInt - 1, pageSize);

			// Tính tổng số trang
			int totalRecords = dao.countAll(); // Thêm phương thức countAll vào UserDAO
			int totalPages = (int) Math.ceil((double) totalRecords / pageSize);

			request.setAttribute("users", list);
			request.setAttribute("page", pageInt);
			request.setAttribute("totalPages", totalPages);

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
	}
}
