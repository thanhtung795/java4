package lab3;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet("/lab3bai1")

public class Lab3bai1 extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.getRequestDispatcher("/lab3bai1.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Mã xử lý file upload ở đây
		// đường dẫn thư mục tính từ gốc của website
		File dir = new File(req.getServletContext().getRealPath("/files"));
		if (!dir.exists()) { // tạo nếu chưa tồn tại
			dir.mkdirs();
		}
		// lưu các file upload vào thư mục files
		Part photo = req.getPart("photo_file"); // file hình
		File photoFile = new File(dir, photo.getSubmittedFileName());
		photo.write(photoFile.getAbsolutePath());
		Part doc = req.getPart("doc_file"); // file tài liệu
		File docFile = new File(dir, doc.getSubmittedFileName());
		doc.write(docFile.getAbsolutePath());
		// chia sẻ cho result.jsp để hiển thị
		req.setAttribute("img", photoFile);
		req.setAttribute("doc", docFile);

		req.getRequestDispatcher("/resultBai1.jsp").forward(req, resp);
	}
}
