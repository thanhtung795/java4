package lab4bai4;

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
	public static List<item> items = Arrays.asList(new item[] {

			new item("SamSungA", "samsung.jpg", 250, 0.1, new Date()),
			new item("SamSungB", "samsung.jpg", 350, 0.1, new Date()),
			new item("SamSungC", "samsung.jpg", 450, 0.1, new Date()),
			new item("SamSungD", "samsung.jpg", 550, 0.1, new Date()),
			new item("SamSungF", "samsung.jpg", 650, 0.1, new Date()),

	});

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setAttribute("items", items);
		req.getRequestDispatcher("/lab4bai4/detail.jsp").forward(req, resp);

	}
}