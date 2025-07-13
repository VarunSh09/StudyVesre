package Project;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class UpdateAdminPwd
 */
@WebServlet("/UpdateAdminPwd")
public class UpdateAdminPwd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAdminPwd() {
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
		String Password =  request.getParameter("Pwd");
		String email = request.getParameter("Email");
		Connection con = DataCon.getCon();
		String subject = "Password is Updated";
                String body = "Password is updated.Thanks";
       
		String EncPassword = PasswordEncryption.generatedENC_Password(Password);

        try {
	           PreparedStatement ps = con.prepareStatement("update users set Password=? where email=?");
	           ps.setString(1,EncPassword);
	           ps.setString(2,email);
	            ps.executeUpdate();
	        response.sendRedirect("AdminChangePwd.jsp");
	           Mail.mail(email,subject,body);
            }catch(Exception e) {
            	e.printStackTrace();
            }
	}

}
