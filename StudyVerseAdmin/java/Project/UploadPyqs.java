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
import java.sql.PreparedStatement;

/**
 * Servlet implementation class UploadPyqs
 */
@WebServlet("/UploadPyqs")
@MultipartConfig

public class UploadPyqs extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadPyqs() {
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
		
		String University = request.getParameter("University");
		String Course = request.getParameter("Course");
		String Semester = request.getParameter("Semester");
		String Subject = request.getParameter("Sname");
		String year = request.getParameter("year");
          String msg="False";
  		HttpSession session = request.getSession();

		if(filename.endsWith(".pdf")||filename.endsWith(".PDF")) {
		try {
			Connection con = DataCon.getCon();
			PreparedStatement ps = con.prepareStatement("insert into QuestionPapers(University,Course,Semester,Pyq_file,year,subject) value(?,?,?,?,?,?)");
			ps.setString(1,University);
			ps.setString(2,Course);
			ps.setString(3,Semester);
			ps.setString(4, filename);
			ps.setString(5, year);
			ps.setString(6,Subject);
		
		int i =	ps.executeUpdate();
		if(i==1) {
			String path = "C:\\Users\\kanus\\eclipse-workspace\\ELibrary\\src\\main\\webapp\\PYQ";
			File file = new File(path);
			p.write(path+File.separator+filename);
			
			String mes = "up";
			session.setAttribute("msg", mes);	
			response.sendRedirect("UploadPyq.jsp");

		}else {
			response.sendRedirect("UploadPyq.jsp");

			System.out.println("error in server");
		}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(filename);

		}}else {		session.setAttribute("response1", msg);	
			response.sendRedirect("UploadPyq.jsp");

			
		}
	}

}
