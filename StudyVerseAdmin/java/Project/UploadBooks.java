package Project;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class UploadBooks
 */
@WebServlet("/UploadBooks")
@MultipartConfig

public class UploadBooks extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadBooks() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		Part p = request.getPart("files");
		String filename = p.getSubmittedFileName();
		//images
		Part p1 = request.getPart("imgs");
		String filename1 = p1.getSubmittedFileName();
		String Subject = request.getParameter("Subject");
		String name = request.getParameter("Bname");
          String msg="False";
  		HttpSession session = request.getSession();

		if(filename.endsWith(".pdf")) {
		try {
			Connection con = DataCon.getCon();
			PreparedStatement ps = con.prepareStatement("insert into Books(subject,file_name,Name,img_name) value(?,?,?,?)");
			ps.setString(1,Subject);
			ps.setString(2,filename);
			ps.setString(3, name);
			ps.setString(4, filename1);
			
		int i =	ps.executeUpdate();
			
		if(i==1) {
			String path = "C:\\Users\\kanus\\eclipse-workspace\\ELibrary\\src\\main\\webapp\\Books";
			File file = new File(path);
			p.write(path+File.separator+filename);
			
			String path1 = "C:\\Users\\kanus\\eclipse-workspace\\ELibrary\\src\\main\\webapp\\Images";
			File file1 = new File(path1);
			p1.write(path1+File.separator+filename1);
			

			String mes = "up";
			session.setAttribute("msg", mes);	
			response.sendRedirect("UploadBooks.jsp");

		}else {
			System.out.println("error in server");
		}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(filename);

		}}else { session.setAttribute("response", msg);		
			response.sendRedirect("UploadBooks.jsp");

			
		}
	}

}
