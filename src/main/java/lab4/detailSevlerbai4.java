package lab4;

import java.io.IOException;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.item;

@WebServlet("/lab4/detailSevlerbai4")
public class detailSevlerbai4 extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<item> items = Arrays.asList(new item[] {

				new item("SamSung", "SamSung.webp", 50, 0.1, new Date()),
				new item("SamSung", "SamSung.webp", 50, 0.1, new Date()),
				new item("SamSung", "SamSung.webp", 50, 0.1, new Date()),
				new item("SamSung", "SamSung.webp", 50, 0.1, new Date()),
				new item("SamSung", "SamSung.webp", 50, 0.1, new Date()),

		});
		req.setAttribute("items", items);
		req.getRequestDispatcher("/lab4bai4/detail.jsp").forward(req, resp);

	}
}