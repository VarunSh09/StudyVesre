package Project;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import Project.DataCon;
import Project.Mail;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class UpdatePwd
 */
@WebServlet("/UpdatePwd")
public class UpdatePwd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePwd() {
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
		String Password =  request.getParameter("Pwd");
		String email = (String)session.getAttribute("Email");
		String name = (String)session.getAttribute("name");
		Connection con = DataCon.getCon();
		String subject = "Password is Updated";
                String body = name+".Your Password is updated.Thanks";
		String EncPassword = PasswordEncryption.generatedENC_Password(Password);

        try {
	           PreparedStatement ps = con.prepareStatement("update users set Password=? where email=?");
	           ps.setString(1, EncPassword);
	           ps.setString(2,email);
	            ps.executeUpdate();
	        response.sendRedirect("login.jsp");
	           Mail.mail(email,subject,body);
            }catch(Exception e) {
            	e.printStackTrace();
            }
	}

}
