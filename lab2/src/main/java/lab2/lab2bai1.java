package lab2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({ "/lab2bai1", "/dientich", "/chuvi" })
public class lab2bai1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/lab2bai1.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI();

		if (url.contains("/dientich")) {
			this.DienTich(req, resp);
		} else if (url.contains("/chuvi")) {
			this.ChuVi(req, resp);
		}
	}

	protected void DienTich(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String canhAStr = req.getParameter("txtCanhA");
		String canhBStr = req.getParameter("txtCanhB");
		String canhCStr = req.getParameter("txtCanhC");

		if (canhAStr == null || canhAStr.isEmpty() || canhBStr == null || canhBStr.isEmpty() || canhCStr == null
				|| canhCStr.isEmpty()) {
			req.setAttribute("error", "Vui lòng nhập đầy đủ các cạnh.");
			req.getRequestDispatcher("/lab2bai1.jsp").forward(req, resp);
			return;
		}

		double a = Double.parseDouble(canhAStr);
		double b = Double.parseDouble(canhBStr);
		double c = Double.parseDouble(canhCStr);

		// Tính diện tích
		double chuVi = (a + b + c) / 2;
		double dientich = Math.sqrt(chuVi * (a + b - c) * (a + c - b) * (b + c - a)) / 4;

		// Truyền kết quả vào request và forward về trang kết quả
		req.setAttribute("dientich", dientich);
		req.setAttribute("canhA", canhAStr);
		req.setAttribute("canhB", canhBStr);
		req.setAttribute("canhC", canhCStr);

		req.getRequestDispatcher("/lab2bai1.jsp").forward(req, resp);
	}

	protected void ChuVi(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String canhAStr = req.getParameter("txtCanhA");
		String canhBStr = req.getParameter("txtCanhB");
		String canhCStr = req.getParameter("txtCanhC");

		if (canhAStr == null || canhAStr.isEmpty() || canhBStr == null || canhBStr.isEmpty() || canhCStr == null
				|| canhCStr.isEmpty()) {
			req.setAttribute("error", "Vui lòng nhập đầy đủ các cạnh.");
			req.getRequestDispatcher("/lab2bai1.jsp").forward(req, resp);
			return;
		}

		double canhA = Double.parseDouble(canhAStr);
		double canhB = Double.parseDouble(canhBStr);
		double canhC = Double.parseDouble(canhCStr);

		// Tính chu vi
		double chuvi = canhA + canhB + canhC;

		// Truyền kết quả vào request và forward về trang kết quả
		req.setAttribute("chuvi", chuvi);
		req.setAttribute("canhA", canhAStr);
		req.setAttribute("canhB", canhBStr);
		req.setAttribute("canhC", canhCStr);

		req.getRequestDispatcher("/lab2bai1.jsp").forward(req, resp);
	}
}
