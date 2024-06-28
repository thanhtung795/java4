package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/bai3")
public class bai3 extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.getRequestDispatcher("bai3.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String layChieuDai = req.getParameter("txtChieuDai");
		String layChieuRong = req.getParameter("txtChieuRong");
		String layPT = req.getParameter("txtPT");

		double ChieuDai = Double.parseDouble(layChieuDai);
		double ChieuRong = Double.parseDouble(layChieuRong);
		double ketQua = 0;
		String ct;
		switch (layPT) {
		case "dienTich":
			ketQua = ChieuDai * ChieuRong;
			ct = ChieuDai + " x " + ChieuRong + " = " + ketQua;
			req.setAttribute("ct", ct);
			break;
		case "chuVi":
			ketQua = (ChieuDai + ChieuRong) * 2;
			ct = "(" + ChieuDai + " + " + ChieuRong + ")x2" + " = " + ketQua;
			req.setAttribute("ct", ct);
			break;
		default:
			req.setAttribute("error", "Phép tính không hợp lệ");
			req.getRequestDispatcher("bai3.jsp").forward(req, resp);
			return;
		}

		req.setAttribute("ChieuDai", ChieuDai);
		req.setAttribute("ChieuRong", ChieuRong);
		req.setAttribute("PT", layPT);
		req.setAttribute("ketQua", ketQua);

		req.getRequestDispatcher("bai3.jsp").forward(req, resp);
	}

}
