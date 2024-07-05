package lab3;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lab3bai4")
public class lab3bai4 extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/lab3bai4.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String to = req.getParameter("to");
		String subject = req.getParameter("subject");
		String messageContent = req.getParameter("message"); // Đổi tên biến để tránh trùng với đối tượng message

		// In ra giá trị các tham số để debug
		System.out.println("To: " + to);
		System.out.println("Subject: " + subject);
		System.out.println("Message: " + messageContent);

		// Kiểm tra các tham số không bị null hoặc trống
		if (to == null || to.isEmpty() || subject == null || subject.isEmpty() || messageContent == null
				|| messageContent.isEmpty()) {
			req.setAttribute("error", "All fields are required.");
			req.getRequestDispatcher("/lab3bai4.jsp").forward(req, resp);
			return;
		}
		Properties props = new Properties();
		props.put("mail.smtp.auth", true);
		props.put("mail.smtp.starttls.enable", true);
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props, new Authenticator() {
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				String username = "vothanhtung795@gmail.com";
				String password = "gqithfzdlqiaeikj";
				return new javax.mail.PasswordAuthentication(username, password);
			}
		});
		try {
			// Tạo message
			MimeMessage mimeMessage = new MimeMessage(session);
			mimeMessage.setFrom(new InternetAddress("vothanhtung795@gmail.com"));
			mimeMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to)); // Sửa chỗ này
			mimeMessage.setSubject(subject, "utf-8");
			mimeMessage.setText(messageContent, "utf-8", "html");
			mimeMessage.setReplyTo(mimeMessage.getFrom());

			// Gửi message
			Transport.send(mimeMessage);
			String success = "Đã gửi mail đến " + to + " thành công";
			req.setAttribute("message", success);
		} catch (Exception e) {
			e.printStackTrace(); // Bắt và in ra lỗi nếu có
			req.setAttribute("error", "Failed to send email: " + e.getMessage());
		}
		req.getRequestDispatcher("/lab3bai4.jsp").forward(req, resp); // Chuyển tiếp lại trang JSP với thông báo
	}
}
