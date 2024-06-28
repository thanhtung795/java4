package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/bai2")
public class bai2 extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("bai2.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String laySoTN = req.getParameter("txtSoThuNhat");
		String laySoTH = req.getParameter("txtSoThuHai");
		String layPhepTinh = req.getParameter("txtPhepTinh");
		if (laySoTN.equals("")) {
			req.setAttribute("error", "Hãy nhập số thứ nhất");
			req.getRequestDispatcher("bai2.jsp").forward(req, resp);
			return;
		}
		if (laySoTH.equals("")) {
			req.setAttribute("error", "Hãy nhập số thứ hai");
			req.getRequestDispatcher("bai2.jsp").forward(req, resp);
			return;
		}
		try {
			double soThuNhat = Double.parseDouble(laySoTN);
			double soThuHai = Double.parseDouble(laySoTH);
			double ketQua = 0;

			switch (layPhepTinh) {
			case "+":
				ketQua = soThuNhat + soThuHai;
				break;
			case "-":
				ketQua = soThuNhat - soThuHai;
				break;
			case "*":
				ketQua = soThuNhat * soThuHai;
				break;
			case "/":
				if (soThuHai != 0) {
					ketQua = soThuNhat / soThuHai;
				} else {
					req.setAttribute("error", "Không thể chia cho 0");
					req.getRequestDispatcher("bai2.jsp").forward(req, resp);
					return;
				}
				break;
			default:
				req.setAttribute("error", "Phép tính không hợp lệ");
				req.getRequestDispatcher("bai2.jsp").forward(req, resp);
				return;
			}

			req.setAttribute("SoTN", soThuNhat);
			req.setAttribute("SoTH", soThuHai);
			req.setAttribute("PhepTinh", layPhepTinh);
			req.setAttribute("ketQua", ketQua);

			req.getRequestDispatcher("bai2.jsp").forward(req, resp);
		} catch (Exception e) {
			req.setAttribute("error", "Số nhập không hợp lệ");
			req.getRequestDispatcher("bai2.jsp").forward(req, resp);
		}

	}

}
