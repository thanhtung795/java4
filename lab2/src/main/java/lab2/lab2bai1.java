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
		double chuVi = 0;
		double dientich = 0;

		if (canhAStr == null || canhAStr.isEmpty() || canhBStr == null || canhBStr.isEmpty() || canhCStr == null
				|| canhCStr.isEmpty()) {
			req.setAttribute("error", "Vui lòng nhập đầy đủ các cạnh.");
			req.getRequestDispatcher("/lab2bai1.jsp").forward(req, resp);
			return;
		}

		try {
			double a = Double.parseDouble(canhAStr);
			double b = Double.parseDouble(canhBStr);
			double c = Double.parseDouble(canhCStr);

			// Kiểm tra tính hợp lệ của tam giác
			if (a + b > c && a + c > b && b + c > a) {
				// Tính nửa chu vi
				double s = (a + b + c) / 2;

				// Tính diện tích sử dụng công thức Heron
				dientich = Math.sqrt(s * (s - a) * (s - b) * (s - c));
				chuVi = a + b + c;

			} else {
				req.setAttribute("error", "Các cạnh đã nhập không tạo thành một tam giác.");
				req.getRequestDispatcher("/lab2bai1.jsp").forward(req, resp);
				return;
			}
		} catch (NumberFormatException e) {
			req.setAttribute("error", "Không được nhập ký tự.");
			req.getRequestDispatcher("/lab2bai1.jsp").forward(req, resp);
			return;
		}

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
		double chuvi = 0;
		if (canhAStr == null || canhAStr.isEmpty() || canhBStr == null || canhBStr.isEmpty() || canhCStr == null
				|| canhCStr.isEmpty()) {
			req.setAttribute("error", "Vui lòng nhập đầy đủ các cạnh.");
			req.getRequestDispatcher("/lab2bai1.jsp").forward(req, resp);
			return;
		}

		try {
			double canhA = Double.parseDouble(canhAStr);
			double canhB = Double.parseDouble(canhBStr);
			double canhC = Double.parseDouble(canhCStr);
			// Tính chu vi
			chuvi = canhA + canhB + canhC;
		} catch (Exception e) {
			req.setAttribute("error", "Không được nhập ký tự.");
			req.getRequestDispatcher("/lab2bai1.jsp").forward(req, resp);
			return;
		}

		// Truyền kết quả vào request và forward về trang kết quả
		req.setAttribute("chuvi", chuvi);
		req.setAttribute("canhA", canhAStr);
		req.setAttribute("canhB", canhBStr);
		req.setAttribute("canhC", canhCStr);

		req.getRequestDispatcher("/lab2bai1.jsp").forward(req, resp);
	}
}
