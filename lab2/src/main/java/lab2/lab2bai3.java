package lab2;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet("/lab2bai3")

public class lab2bai3 extends HttpServlet {
	int count = 0;
	Path path = Paths.get("D:\\FPT\\java 4\\MyProject\\lab2\\src\\main\\java\\lab2\\count.txt");

	public lab2bai3() {
		super();
	}

	@Override
	public void init() throws ServletException {
		try {
			count = Integer.parseInt("D:\\FPT\\java 4\\MyProject\\lab2\\src\\main\\java\\lab2\\count.txt");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void destroy() {
		try {

			Files.write(path, String.valueOf(count).getBytes());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		count++;
		req.setAttribute("count", count);
		req.getRequestDispatcher("/lab2bai3.jsp").forward(req, res);
	}
}
