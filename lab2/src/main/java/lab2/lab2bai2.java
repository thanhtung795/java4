package lab2;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lab2bai2")
public class lab2bai2 extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.getRequestDispatcher("/lab2bai2.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (!Validate(req, resp)) {
			// Nếu validation thất bại, dừng lại và không tiếp tục xử lý
			return;
		}
		String tenDangNhap = req.getParameter("txtTenDangNhap");
		String tenMatKhau = req.getParameter("txtMatKhau");
		String gioiTinh = req.getParameter("gioiTinh");
		String TinhTrangHonNhan = req.getParameter("chkGD");
		String QuocGia = req.getParameter("QuocGia");
		String[] SoThich = req.getParameterValues("soThich");
		String ghiChu = req.getParameter("txtGhiChu");

		if ("true".equals(gioiTinh)) {
			gioiTinh = "Nam";
			System.out.println(gioiTinh);
		} else {
			gioiTinh = "Nữ";
			System.out.println(gioiTinh);
		}
		if ("true".equals(TinhTrangHonNhan)) {
			TinhTrangHonNhan = "Đã kết hôn";
		} else {
			TinhTrangHonNhan = "Chưa đã kết hôn";
		}
		String ST = "";
		StringBuilder sb = new StringBuilder();

		for (int i = 0; i < SoThich.length; i++) {
			sb.append(SoThich[i]);
			if (i < SoThich.length - 1) {
				sb.append(", ");
			} else {
				sb.append(". ");
			}
		}

		ST = sb.toString();
		req.setAttribute("tenDangNhap", tenDangNhap);
		req.setAttribute("MatKhau", tenMatKhau);
		req.setAttribute("gioiTinh", gioiTinh);
		req.setAttribute("TinhTrangHonNhan", TinhTrangHonNhan);
		req.setAttribute("QuocGia", QuocGia);
		req.setAttribute("ST", ST);
		req.setAttribute("ghiChu", ghiChu);
		req.getRequestDispatcher("/ViewLab2bai2/view.jsp").forward(req, resp);
	}

	protected boolean Validate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Lấy các tham số từ request
		String tenDangNhap = req.getParameter("txtTenDangNhap");
		String tenMatKhau = req.getParameter("txtMatKhau");
		String gioiTinh = req.getParameter("gioiTinh");
		String TinhTrangHonNhan = req.getParameter("chkGD");
		String QuocGia = req.getParameter("QuocGia");
		String[] SoThich = req.getParameterValues("soThich");
		String ghiChu = req.getParameter("txtGhiChu");

		// Kiểm tra các giá trị đầu vào
		boolean isValid = true;

		if (tenDangNhap == null || tenDangNhap.isEmpty()) {
			req.setAttribute("errorTDN", "Vui lòng nhập tên đăng nhập.");
			isValid = false;
		}

		if (tenMatKhau == null || tenMatKhau.isEmpty()) {
			req.setAttribute("errorMK", "Vui lòng nhập mật khẩu.");
			isValid = false;
		}

		if (gioiTinh == null || gioiTinh.isEmpty()) {
			req.setAttribute("errorGT", "Vui lòng chọn giới tính.");
			isValid = false;
		}

		if (QuocGia == null || QuocGia.isEmpty()) {
			req.setAttribute("errorQG", "Vui lòng chọn quốc gia.");
			isValid = false;
		}
		if (SoThich == null) {
			req.setAttribute("errorST", "Vui lòng chọn Sở thích.");
			isValid = false;
		}
		// Nếu có lỗi, forward lại về trang form và hiển thị thông báo lỗi
		if (!isValid) {
			req.setAttribute("tenDangNhap", tenDangNhap);
			req.setAttribute("MatKhau", tenMatKhau);
			req.setAttribute("gioiTinh", gioiTinh);
			req.setAttribute("TinhTrangHonNhan", TinhTrangHonNhan);
			req.setAttribute("QuocGia", QuocGia);
			req.setAttribute("ST", Arrays.toString(SoThich));
			req.setAttribute("ghiChu", ghiChu);
			req.getRequestDispatcher("/lab2bai2.jsp").forward(req, resp);
		}

		return isValid;
	}
}
