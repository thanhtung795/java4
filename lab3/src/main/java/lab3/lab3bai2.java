package lab3;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

@MultipartConfig
@WebServlet("/lab3bai2")
public class lab3bai2 extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/lab3bai2.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Staff staff = new Staff();
		req.setAttribute("staff", staff);

		try {
			// Validate họ và tên
			String fullname = req.getParameter("fullname");
			if (fullname == null || fullname.isEmpty()) {
				req.setAttribute("errorMessage", "Họ và tên không được để trống.");
				req.getRequestDispatcher("/lab3bai2.jsp").forward(req, resp);
				return;
			}
			staff.setFullname(fullname);

			// Tạo thư mục lưu trữ file nếu chưa tồn tại
			File dir = new File(req.getServletContext().getRealPath("/files"));
			if (!dir.exists()) {
				dir.mkdirs();
			}

			// Lấy phần tử file từ yêu cầu
			Part photo = req.getPart("photo");
			if (photo != null && photo.getSize() > 0) {
				File photoFile = new File(dir, photo.getSubmittedFileName());
				photo.write(photoFile.getAbsolutePath());
				staff.setPhoto(photoFile.getName());
			}

			// Đọc tham số vào các thuộc tính của bean staff
			BeanUtils.populate(staff, req.getParameterMap());

			// Validate ngày sinh
			String birthdayStr = req.getParameter("birthday");
			if (birthdayStr == null || birthdayStr.isEmpty()) {
				req.setAttribute("errorMessage", "Ngày sinh không được để trống.");
				req.getRequestDispatcher("/lab3bai2.jsp").forward(req, resp);
				return;
			}
			SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date birthday;
			try {
				birthday = inputFormat.parse(birthdayStr);
			} catch (ParseException e) {
				req.setAttribute("errorMessage", "Định dạng ngày sinh không hợp lệ.");
				req.getRequestDispatcher("/lab3bai2.jsp").forward(req, resp);
				return;
			}
			staff.setBirthday(new java.sql.Date(birthday.getTime()));

			// Validate quốc tịch
			String country = req.getParameter("country");
			if (country == null || country.isEmpty()) {
				req.setAttribute("errorMessage", "Quốc tịch không được để trống.");
				req.getRequestDispatcher("/lab3bai2.jsp").forward(req, resp);
				return;
			}

			// Validate giới tính
			String gender = req.getParameter("gender");
			if (gender == null || gender.isEmpty()) {
				req.setAttribute("errorMessage", "Giới tính không được để trống.");
				req.getRequestDispatcher("/lab3bai2.jsp").forward(req, resp);
				return;
			}

			// Chia sẻ với result.jsp
			req.setAttribute("staff", staff);
			req.getRequestDispatcher("/resultBai2.jsp").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("errorMessage", "Có lỗi xảy ra trong quá trình xử lý.");
			req.getRequestDispatcher("/lab3bai2.jsp").forward(req, resp);
		}
	}
}
