package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.UserDAO;
import entity.Favorite;
import entity.User;

@WebServlet("/UserIdServlet")
public class UserIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDAO userDAO = new UserDAO();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/UserId.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String idStr = req.getParameter("id");
		int idInt = Integer.parseInt(idStr);
		User user = userDAO.findById(idInt);
		if (user != null) {
			List<Favorite> favorites = user.getFavorites();
			req.setAttribute("user", user);
			req.setAttribute("favorites", favorites);
		} else {
			req.setAttribute("error", "User không tồn tại.");
		}

		req.getRequestDispatcher("/views/UserId.jsp").forward(req, resp);
	}
}
