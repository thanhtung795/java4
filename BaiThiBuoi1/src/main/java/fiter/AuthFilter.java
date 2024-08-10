package fiter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.User;

@WebFilter(filterName = "AuthFilter", urlPatterns = { "/user/UserCRUD", "/user/create", "/user/update", "/user/delete",
		"/user/reset", "/user/edit/*", "/user/delete/*" })
public class AuthFilter implements HttpFilter {

	@Override
	public void doFilter(HttpServletRequest req, HttpServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		String uri = req.getRequestURI();
		User user = (User) req.getSession().getAttribute("user");// dang nhap
		String error = "";
		System.out.println("AuthFilter running");
		if (user == null) {
			error = resp.encodeURL("Please login to use this function!");
			System.out.println("Vui lòng đăng nhập!");
		} else if (!user.isAdmin() && uri.contains("UserCRUD")) {
			System.out.println("Vui lòng đăng nhập với vai trò admin");
			error = resp.encodeURL("Please login with admin role");

		}
		if (!error.isEmpty()) {
			req.getSession().setAttribute("securi", error);
			System.out.println("Error!");
			resp.sendRedirect(req.getContextPath() + "/view/login.jsp?error=" + resp.encodeURL(error));
		} else {
			System.out.println("No Error!");
			chain.doFilter(req, resp);
			req.getSession().setMaxInactiveInterval(15);
		}

	}

}
