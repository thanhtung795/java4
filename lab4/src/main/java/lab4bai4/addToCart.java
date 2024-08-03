package lab4bai4;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.item;

@WebServlet({ "/lab4bai4/addCart", "/lab4bai4/deleteItem", "/lab4bai4/checkout" })
public class addToCart extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String uri = req.getRequestURI();
		if (uri.contains("addCart")) {
			this.addCart(req, resp);
		} else if (uri.contains("deleteItem")) {
			this.deleteCart(req, resp);
		} else if (uri.contains("checkout")) {
			session.invalidate();
			req.getRequestDispatcher("/lab4/detailSevlerbai4").forward(req, resp);
		}
	}

	protected void addCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		List<item> cart = (List<item>) session.getAttribute("cart");
		if (cart == null) {
			cart = new ArrayList<>();
		}

		String name = req.getParameter("name");
		item addItem = null;

		for (item item : detailSevlerbai4.items) {
			if (item.getName().equalsIgnoreCase(name)) {
				addItem = item;
				break;
			}
		}

		if (addItem != null) {
			cart.add(addItem);
			session.setAttribute("cart", cart);
		}

		// Tính tổng giá giỏ hàng
		double totalPrice = cart.stream().mapToDouble(i -> i.getPrice()).sum();
		session.setAttribute("totalPrice", totalPrice);

		resp.sendRedirect(req.getContextPath() + "/lab4bai4/cart.jsp");
	}

	protected void deleteCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		List<item> cart = (List<item>) session.getAttribute("cart");
		if (cart == null) {
			cart = new ArrayList<>();
		}

		String name = req.getParameter("name");

		for (int i = cart.size() - 1; i >= 0; i--) {
			if (cart.get(i).getName().equalsIgnoreCase(name)) {
				System.out.println("da xoa " + cart.get(i));
				cart.remove(i);
				break;
			}
		}

		session.setAttribute("cart", cart);

		// Tính tổng giá giỏ hàng
		double totalPrice = cart.stream().mapToDouble(i -> i.getPrice()).sum();
		session.setAttribute("totalPrice", totalPrice);

		resp.sendRedirect(req.getContextPath() + "/lab4bai4/cart.jsp");
	}

}
