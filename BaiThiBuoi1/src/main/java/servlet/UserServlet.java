package servlet;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import dao.UserDAO;
import entity.User;
import utils.JpaUtils;

@WebServlet({ "/user/UserCRUD", "/user/search", "/user/filter", "/user/create", "/user/update", "/user/delete",
		"/user/reset", "/user/edit/*", "/user/delete/*" })

public class UserServlet extends HttpServlet {

	private EntityManager em;

	@Override
	public void init() throws ServletException {
		em = JpaUtils.getEntityManager(); // Khởi tạo EntityManager khi servlet được khởi tạo
	}

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = request.getRequestURL().toString();
		request.setCharacterEncoding("utf-8");

		User user = null;
		UserDAO dao = new UserDAO();

		if (url.contains("delete")) {
			if (request.getParameter("id") != null) {
				String idStr = request.getParameter("id");
				int id = Integer.parseInt(idStr);
				dao.remove(id);
				request.setAttribute("message", "Delete success!");
			}
			user = new User();
			request.setAttribute("user", user);
		} else if (url.contains("edit")) {
			if (request.getParameter("id") != null) {
				user = dao.findById(Integer.parseInt(request.getParameter("id")));
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
		} else if (url.contains("search")) {
			search(request, response);
			request.getRequestDispatcher("/view/UserCRUD.jsp").forward(request, response);
			return;
		} else if (url.contains("filter")) {
			filter(request, response);
			return;
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

	private void filter(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String roleFilter = request.getParameter("roleFilter");
		String jpql = "SELECT u FROM User u";

		// Xử lý bộ lọc vai trò
		if ("admin".equals(roleFilter)) {
			jpql += " WHERE u.admin = true";
		} else if ("user".equals(roleFilter)) {
			jpql += " WHERE u.admin = false";
		} else {
			// Nếu không có bộ lọc, gọi phương thức findPage để hiển thị trang hiện tại
			findPage(request, response);
			request.getRequestDispatcher("/view/UserCRUD.jsp").forward(request, response);
			return; // Ngăn không cho tiếp tục thực hiện phần còn lại của phương thức
		}

		// Tạo và thiết lập query
		TypedQuery<User> query = em.createQuery(jpql, User.class);

		// Thực hiện truy vấn và lấy kết quả
		List<User> list = query.getResultList();
		request.setAttribute("users", list);
		request.getRequestDispatcher("/view/UserCRUD.jsp").forward(request, response);
	}

	private void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyword = request.getParameter("keyword");
		if (keyword == null || keyword.trim().isEmpty()) {
			request.setAttribute("error", "Keyword không được để trống");
			request.getRequestDispatcher("/view/UserCRUD.jsp").forward(request, response);
			return;
		}

		String jpql;
		TypedQuery<User> query;

		// Kiểm tra xem keyword có phải là số hay không
		boolean isNumeric = keyword.chars().allMatch(Character::isDigit);
		if (isNumeric) {
			jpql = "SELECT u FROM User u WHERE u.id = :keywordInt";
			query = em.createQuery(jpql, User.class);
			query.setParameter("keywordInt", Integer.parseInt(keyword));
		} else {
			jpql = "SELECT u FROM User u WHERE u.email LIKE :keyword OR u.fullname LIKE :keyword";
			query = em.createQuery(jpql, User.class);
			query.setParameter("keyword", "%" + keyword + "%");
		}

		List<User> list = query.getResultList();
		request.setAttribute("users", list);
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
			String idStr = request.getParameter("id");
			if (idStr != null) {
				int id = Integer.parseInt(idStr);
				UserDAO dao = new UserDAO();
				dao.remove(id);
				request.setAttribute("message", "Delete success!");
			} else {
				request.setAttribute("error", "ID is required for deletion.");
			}
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

	@Override
	public void destroy() {
		if (em != null) {
			em.close();
		}
	}
}
