package lab3;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lab3bai3")
public class lab3bai3 extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// đọc giá trị của cookie
		String username = CookieUtils.get("username", req);
		String password = CookieUtils.get("password", req);
		String remember = CookieUtils.get("remember", req); // get remember as string

		// chuyển sang login.jsp để hiển thị lên form
		req.setAttribute("username", username);
		req.setAttribute("password", password);
		req.setAttribute("remember", "on".equals(remember)); // convert to boolean
		req.getRequestDispatcher("/lab3bai3.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// mã đăng nhập và ghi nhớ bằng cookie ở đây
		// đọc tham số form đăng nhập
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String remember = req.getParameter("remember");

		// Kiểm tra checkbox "Remember me?"
		boolean isRememberChecked = "on".equals(remember);

		// kiểm tra tài khoản đăng nhập
		if (!username.equalsIgnoreCase("tung")) {
			req.setAttribute("message", "Sai tên đăng nhập!");
		} else if (password.length() < 6) {
			req.setAttribute("message", "Sai mật khẩu!");
		} else {
			req.setAttribute("message", "Đăng nhập thành công!");

			// Thêm logic xử lý đăng nhập tại đây
			int hours = isRememberChecked ? 30 * 24 : 0; // 0 = xóa
			CookieUtils.add("username", username, hours, resp);
			CookieUtils.add("password", password, hours, resp);
			CookieUtils.add("remember", isRememberChecked ? "on" : null, hours, resp);

			System.out.println("Remember me is " + (isRememberChecked ? "checked" : "not checked"));
		}

		req.getRequestDispatcher("/lab3bai3.jsp").forward(req, resp);
	}
}
