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

/**
 * Servlet implementation class UserServlet
 */
@WebServlet({ "/index", "/create", "/update", "/delete", "/reset", "/edit/*", "/delete/*", })
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String url = request.getRequestURL().toString();

		request.setCharacterEncoding("utf-8");

		User user = null;

		if (url.contains("delete")) {
			UserDAO dao = new UserDAO();
			if (request.getParameter("id") != null) {
				dao.remove(request.getParameter("id"));
				request.setAttribute("message", "Delete success!");
			}
			// xóa rỗng các ô texbox
			user = new User();
			request.setAttribute("user", user);
		}

		else if (url.contains("edit")) {
			UserDAO dao = new UserDAO();
			if (request.getParameter("id") != null)
				user = dao.findById(request.getParameter("id"));
			request.setAttribute("user", user);
		}

		findPage(request, response);
		request.setAttribute("view", "/views/managent.jsp");
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
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
		request.setAttribute("view", "/views/managent.jsp");
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}

	protected void create(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			User user = new User();
			BeanUtils.populate(user, request.getParameterMap());
			UserDAO dao = new UserDAO();
			dao.create(user);
			request.setAttribute("message", "Create success!");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
	}

	protected void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			User user = new User();
			BeanUtils.populate(user, request.getParameterMap());
			UserDAO dao = new UserDAO();
			dao.update(user);
			request.setAttribute("message", "Update success!");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
	}

	protected void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			User user = new User();
			BeanUtils.populate(user, request.getParameterMap());
			UserDAO dao = new UserDAO();
			if (user.getId() != null)
				dao.remove(user.getId());
			request.setAttribute("message", "Delete success!");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
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
