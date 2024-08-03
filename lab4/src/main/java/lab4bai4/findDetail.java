package lab4bai4;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.item;

@WebServlet("/lab4/lab4bai4/ctsp") // Đảm bảo URL khớp với URL bạn đang sử dụng trong thẻ <a>
public class findDetail extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		item selectedItem = null;
		for (item item : detailSevlerbai4.items) {
			if (item.getName().equalsIgnoreCase(name)) {
				selectedItem = item;
				break;
			}
		}
		req.setAttribute("selectedItem", selectedItem);
		req.getRequestDispatcher("/lab4bai4/ctsp.jsp").forward(req, resp);

	}
}
