package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import entity.User;

@WebServlet({ "/login", "/Sign-In", "/logout", "/login/*" })
public class Bai3_LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().setAttribute("user", null);
		request.getRequestDispatcher("view/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		String uri = request.getRequestURI();
		if (uri.contains("Sign-In")) {

			signIn(request, response);
		} else if (uri.contains("logout")) {
			request.getRequestDispatcher("/view/login.jsp").forward(request, response);
		}
	}

	private void signIn(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String email = request.getParameter("email");
			String pw = request.getParameter("password");

			if (email == null || email.isEmpty() || !email.matches("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
				request.setAttribute("message", "Email không hợp lệ!");
				request.getRequestDispatcher("/view/login.jsp").forward(request, response);
				return;
			}
			if (pw == null || pw.isEmpty()) {
				request.setAttribute("message", "Mật khẩu không được để trống!");
				request.getRequestDispatcher("/view/login.jsp").forward(request, response);
				return;
			}

			UserDAO dao = new UserDAO();
			User user = dao.findByEmail(email);

			if (user != null) {
				if (!user.getPassword().equals(pw)) {
					request.setAttribute("message", "Sai mật khẩu!");
					request.getRequestDispatcher("/view/login.jsp").forward(request, response);
				} else {
					request.getSession().setAttribute("user", user);
					request.getRequestDispatcher("/HomePage.jsp").forward(request, response);
				}
			} else {
				request.setAttribute("message", "Email không tồn tại!");
				request.getRequestDispatcher("/view/login.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
