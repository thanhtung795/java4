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
		req.getRequestDispatcher("/lab3bai1.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		File dir = new File(req.getServletContext().getRealPath("/files"));
		if (!dir.exists()) {
			dir.mkdirs();
		}

		Part photo = req.getPart("photo_file");
		Part doc = req.getPart("doc_file");

		// Kiểm tra và xử lý file ảnh
		if (photo != null && photo.getSize() > 0 && photo.getSubmittedFileName() != null
				&& !photo.getSubmittedFileName().isEmpty()) {
			File photoFile = new File(dir, photo.getSubmittedFileName());
			photo.write(photoFile.getAbsolutePath());
			req.setAttribute("img", photoFile);
		} else {
			req.setAttribute("imgError", "Không thể upload hình ảnh.");
			req.setAttribute("img", photo); // Giữ lại phần thông tin file
			req.getRequestDispatcher("/lab3bai1.jsp").forward(req, resp);

		}

		// Kiểm tra và xử lý file tài liệu
		if (doc != null && doc.getSize() > 0 && doc.getSubmittedFileName() != null
				&& !doc.getSubmittedFileName().isEmpty()) {
			File docFile = new File(dir, doc.getSubmittedFileName());
			doc.write(docFile.getAbsolutePath());
			req.setAttribute("doc", docFile);
		} else {
			req.setAttribute("docError", "Không thể upload tài liệu.");
			req.setAttribute("doc", doc); // Giữ lại phần thông tin file
			req.getRequestDispatcher("/lab3bai1.jsp").forward(req, resp);
			return;
		}

		req.getRequestDispatcher("/resultBai1.jsp").forward(req, resp);
	}
}
