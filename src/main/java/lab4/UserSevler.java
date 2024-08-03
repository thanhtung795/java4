package lab4;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.User;

@WebServlet("/lab4bai2/index")
public class UserSevler extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
// chia sẻ dữ liệu cho jsp

		List<User> users = Arrays.asList(new User[] { new User("Username 1", "Password 1", true),
				new User("Username 2", "Password 2", false), new User("Username 3", "Password 3", true) });
		req.setAttribute("message", "Quản lý người sử dụng!");
		req.setAttribute("form", users.get(0));
		req.setAttribute("items", users);
		req.getRequestDispatcher("/lab4bai2/index.jsp").forward(req, resp);
	}
}