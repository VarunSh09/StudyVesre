package Project;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
/**
 * Servlet implementation class SignUp
 */
@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUp() {
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
		HttpSession session = request.getSession();
		String name = request.getParameter("Uname");
		String RoleId = request.getParameter("Uroles");
		String Institute = request.getParameter("UInstitute");
		String email = request.getParameter("Uemail");
		String Password = request.getParameter("Upassword");
		String Subject = "Welcome to StudyVerse! Your Learning Journey Begins Here";
		String Msg = "Hello "+name+ ",\r\n"
				+ "\r\n"
				+ "Thank you for signing up with StudyVerse!\r\n"
				+ "\r\n"
				+ "We’re excited to have you as part of our academic community. StudyVerse is your go-to platform for university past year questions (PYQs), textbooks, online courses, and much more. Our mission is to support you in your academic journey, helping you learn, grow, and succeed.\r\n"
				+ "\r\n"
				+ "Here’s what you can explore right away:\r\n"
				+ "- Browse through past year questions (PYQs) for various universities\r\n"
				+ "- Access textbooks and study materials\r\n"
				+ "- Enroll in online courses to enhance your knowledge\r\n";
		
		 String EncPassword = PasswordEncryption.generatedENC_Password(Password); //Password is encrypted 
		
		try {
			Connection con = DataCon.getCon();
			PreparedStatement ps1 = con.prepareStatement("select * from users where email=?");
			ps1.setString(1,email);
            ResultSet rs = ps1.executeQuery();
            if(!rs.next()) {
    			PreparedStatement ps = con.prepareStatement("insert into Users(name,RoleId,Institute,email,Password)values(?,?,?,?,?)");
             ps.setString(1, name);
			ps.setString(2, RoleId);
			ps.setString(3, Institute);
			ps.setString(4, email);
			ps.setString(5, EncPassword);
			ps.executeUpdate();
			response.sendRedirect("login.jsp");
			Mail.mail(email,Subject,Msg);
            }else {
                session.setAttribute("SStatus","False");

            	response.sendRedirect("SignUp.jsp");
            	
            }
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
