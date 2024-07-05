package lab4;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.item;

@WebServlet("/detail")
public class DetailServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		item item = new item("SamSung", "SamSung.webp", 50, 0.1, null);
		item.setDate(new Date());
		req.setAttribute("item", item);
		req.getRequestDispatcher("/lab4bai3/detail.jsp").forward(req, resp);
	}
}
