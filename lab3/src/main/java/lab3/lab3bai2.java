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
		try {
			Staff staff = new Staff();

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

			// Lấy và định dạng ngày sinh
			String birthdayStr = req.getParameter("birthday"); // Đảm bảo rằng bạn có input với name="birthday" trong
																// form.jsp
			SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd"); // Định dạng đầu vào (giả sử từ input
																				// type="date")
			SimpleDateFormat outputFormat = new SimpleDateFormat("dd/MM/yyyy"); // Định dạng đầu ra
			Date birthday = inputFormat.parse(birthdayStr);
			String formattedBirthday = outputFormat.format(birthday);

			// Đặt ngày sinh đã định dạng vào staff
			staff.setBirthday(new java.sql.Date(birthday.getTime())); // Giả sử Staff có setter cho java.sql.Date
			req.setAttribute("formattedBirthday", formattedBirthday);

			// Chia sẻ với result.jsp
			req.setAttribute("staff", staff);
			req.getRequestDispatcher("/resultBai2.jsp").forward(req, resp);
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
