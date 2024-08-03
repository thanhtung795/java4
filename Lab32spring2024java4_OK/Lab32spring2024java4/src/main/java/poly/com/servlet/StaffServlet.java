package poly.com.servlet;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.commons.beanutils.converters.DateTimeConverter;

import poly.com.model.Staff;

/**
 * Servlet implementation class StaffServlet
 */
@MultipartConfig
@WebServlet("/add")
public class StaffServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StaffServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/views/form.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try 
		{
			request.setCharacterEncoding("utf-8");
			
			DateTimeConverter dtc = new DateConverter(new Date());
			dtc.setPattern("dd/MM/yyyy");
			ConvertUtils.register(dtc, Date.class);
			
			
			Staff staff = new Staff();
			
			BeanUtils.populate(staff, request.getParameterMap()); // ánh xạ giữa lớp model và views
			
			File dir = new File(request.getServletContext().getRealPath("/files"));
			if(!dir.exists()) {
				dir.mkdir();
				//System.out.print(request.getServletContext() + "anhtu");
			}
			
			Part photo = request.getPart("photo_file");
			File photoFile = new File(dir, photo.getSubmittedFileName());
			photo.write(photoFile.getAbsolutePath());
			
			staff.setPhoto_file(photoFile.getName());
			
			request.setAttribute("bean", staff);
			// lấy sở thích cách 2
			String lay=Arrays.toString(staff.getHobbies());
			String catchuoi=lay.substring(1, lay.lastIndexOf("]")) +".";
			request.setAttribute("st", catchuoi);
			//
			 
		} 
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		request.getRequestDispatcher("/views/result.jsp").forward(request, response);
	}

}
