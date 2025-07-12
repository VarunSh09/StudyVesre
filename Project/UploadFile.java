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
 * Servlet implementation class UploadFile
 */
@WebServlet("/UploadFile")
@MultipartConfig

public class UploadFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadFile() {
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
		Part p = request.getPart("files");
		String filename = p.getSubmittedFileName();
		if(filename!="") {
		HttpSession session = request.getSession();
         String UserImage = (String)session.getAttribute("Userimage");
		try {
			Connection con =DataCon.getCon();
			
	        File file1 = new File("C:\\Users\\kanus\\eclipse-workspace\\ELibrary\\src\\main\\webapp\\UserImages\\"+UserImage);
	        if (file1.delete()) {
	            System.out.println("File deleted successfully");
	        }else {
	            System.out.println("Failed to delete the file");
	        }
			PreparedStatement ps1 = con.prepareStatement("delete from images where Uid =?");
            ps1.setInt(1,(int) session.getAttribute("Uid")); 
        	ps1.executeUpdate();
			
			PreparedStatement ps = con.prepareStatement("insert into Images(img_name,uid) value(?,?)");
			ps.setString(1, filename);
			ps.setInt(2,(int) session.getAttribute("Uid"));
		int i =	ps.executeUpdate();
			
		if(i==1) {
			String path = "C:\\Users\\kanus\\eclipse-workspace\\ELibrary\\src\\main\\webapp\\UserImages";
			File file = new File(path);
			
			p.write(path+File.separator+filename);
			response.sendRedirect("Dashboard.jsp");

		}else {
			System.out.println("error in server");
		}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(filename);

		}}
		else {
			System.out.println("File not found!");
			response.sendRedirect("Dashboard.jsp");

		}
	}

}
