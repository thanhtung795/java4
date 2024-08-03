package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import dao.UserDAO;
import entity.User;

@WebServlet({ "/user/UserCRUD", "/user/create", "/user/update", "/user/delete", "/user/reset", "/user/edit/*",
		"/user/delete/*" })
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = request.getRequestURL().toString();
		request.setCharacterEncoding("utf-8");

		User user = null;
		UserDAO dao = new UserDAO();

		if (url.contains("delete")) {
			if (request.getParameter("id") != null) {
				dao.remove(request.getParameter("id"));
				request.setAttribute("message", "Delete success!");
			}
			user = new User();
			request.setAttribute("user", user);
		} else if (url.contains("edit")) {
			if (request.getParameter("id") != null) {
				user = dao.findById(request.getParameter("id"));
				request.setAttribute("user", user);
			}
		} else {
			user = (User) request.getSession().getAttribute("user");
			request.setAttribute("user", user);
		}

		findPage(request, response);
		request.getRequestDispatcher("/view/UserCRUD.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = request.getRequestURL().toString();
		request.setCharacterEncoding("utf-8");
		User user = new User();

		if (url.contains("create")) {
			create(request, response);
		} else if (url.contains("update")) {
			update(request, response);
		} else if (url.contains("delete")) {
			delete(request, response);
		} else if (url.contains("reset")) {
			request.setAttribute("user", new User());
		}
		findPage(request, response);
		request.getRequestDispatcher("/view/UserCRUD.jsp").forward(request, response);
	}

	private void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			User user = new User();
			BeanUtils.populate(user, request.getParameterMap());
			UserDAO dao = new UserDAO();
			dao.create(user);
			request.setAttribute("message", "Create success!");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
	}

	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			User user = new User();
			BeanUtils.populate(user, request.getParameterMap());
			UserDAO dao = new UserDAO();
			dao.update(user);
			request.setAttribute("message", "Update success!");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			User user = new User();
			BeanUtils.populate(user, request.getParameterMap());
			UserDAO dao = new UserDAO();
			if (user.getId() != null) {
				dao.remove(user.getId());
			}
			request.setAttribute("message", "Delete success!");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
	}

	private void findPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pageStr = request.getParameter("page");
		int pageInt = (pageStr != null && !pageStr.isEmpty()) ? Integer.parseInt(pageStr) : 1;

		try {
			UserDAO dao = new UserDAO();
			int pageSize = 7;
			List<User> list = dao.findPage(pageInt - 1, pageSize);
			int totalRecords = dao.countAll();
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
