package baithemlab4;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.item;

@WebServlet({ "/TrangChu", "/addCart", "/checkout" })
public class TrangChu extends HttpServlet {
	public static List<item> items = Arrays
			.asList(new item[] { new item("SamSungA", "samsung.jpg", 250, 0.1, new Date()),
					new item("SamSungB", "samsung.jpg", 350, 0.1, new Date()),
					new item("SamSungC", "samsung.jpg", 450, 0.1, new Date()), });

	static List<item> cartsItems = new ArrayList<>();

	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String name = req.getParameter("name");

		if (uri.contains("TrangChu")) {
			req.setAttribute("items", items);
			req.getRequestDispatcher("/TrangChu.jsp").forward(req, resp);
		} else if (uri.contains("addCart")) {
			for (item item : items) {
				if (item.getName().equalsIgnoreCase(name)) {
					cartsItems.add(item);
					break;
				}
			}
			req.setAttribute("items", items);
			req.setAttribute("cartsItems", cartsItems);
			req.getRequestDispatcher("/TrangChu.jsp").forward(req, resp);
		} else if (uri.contains("checkout")) {
			cartsItems.clear();
			req.getRequestDispatcher("/TrangChu.jsp").forward(req, resp);
		}
	}
}
