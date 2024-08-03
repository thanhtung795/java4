package lab3;

import java.io.File;
import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/lab3bai4")
@MultipartConfig(maxFileSize = 1024 * 1024 * 10, // 10 MB
		maxRequestSize = 1024 * 1024 * 20 // 20 MB
)
public class lab3bai4 extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/lab3bai4.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String to = req.getParameter("to");
		String subject = req.getParameter("subject");
		String messageContent = req.getParameter("message");

		if (to == null || to.isEmpty() || subject == null || subject.isEmpty()) {
			req.setAttribute("error", "Hãy nhập đầy đủ thông tin trước khi gửi.");
			req.getRequestDispatcher("/lab3bai4.jsp").forward(req, resp);
			return;
		}

		Properties p = new Properties();
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.ssl.protocols", "TLSv1.2");
		p.put("mail.smtp.host", "smtp.gmail.com");
		p.put("mail.smtp.port", 587);
		p.put("mail.debug", "true");

		Session session = Session.getDefaultInstance(p, new javax.mail.Authenticator() {
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				String username = "vothanhtung795@gmail.com";
				String password = "gqithfzdlqiaeikj"; // Sử dụng mật khẩu ứng dụng
				return new javax.mail.PasswordAuthentication(username, password);
			}
		});
		try {
			MimeMessage mimeMessage = new MimeMessage(session);
			mimeMessage.setFrom(new InternetAddress("vothanhtung795@gmail.com"));
			mimeMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
			mimeMessage.setSubject(subject, "utf-8");

			MimeBodyPart messageBodyPart = new MimeBodyPart();
			messageBodyPart.setText(messageContent, "utf-8", "html");

			MimeMultipart multipart = new MimeMultipart();
			multipart.addBodyPart(messageBodyPart);

			// Lưu file đính kèm lên server
			Part filePart = req.getPart("file");
			if (filePart != null && filePart.getSize() > 0) {
				File dir = new File(req.getServletContext().getRealPath("/files"));
				if (!dir.exists()) {
					dir.mkdirs();
				}
				File file = new File(dir, filePart.getSubmittedFileName());
				filePart.write(file.getAbsolutePath());

				// Đính kèm file vào email
				MimeBodyPart attachPart = new MimeBodyPart();
				attachPart.attachFile(file);
				multipart.addBodyPart(attachPart);
			}

			mimeMessage.setContent(multipart);
			Transport.send(mimeMessage);
			String success = "Đã gửi mail đến " + to + " thành công";
			req.setAttribute("message", success);
		} catch (Exception e) {
			e.printStackTrace();
			Throwable cause = e.getCause();
			if (cause != null) {
				cause.printStackTrace();
				req.setAttribute("error", "Failed to send email: " + cause.getMessage());
			} else {
				req.setAttribute("error", "Failed to send email: " + e.getMessage());
			}
		}
		req.getRequestDispatcher("/lab3bai4.jsp").forward(req, resp);
	}
}
