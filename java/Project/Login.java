package Project;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		String email = request.getParameter("Uemail");
		String Password = request.getParameter("Upassword");
        Connection con = DataCon.getCon();
	    HttpSession session = request.getSession( );
         
		String EncPassword = PasswordEncryption.generatedENC_Password(Password);

        try {
			PreparedStatement ps = con.prepareStatement("select * from  Users where email=? && Password=?");
			ps.setString(1, email);
			ps.setString(2,EncPassword);
			
			ResultSet rs = ps.executeQuery();
		    if(rs.next()){
		    response.sendRedirect("Home.jsp");
		    session.setAttribute("username",rs.getString("name"));
		    session.setAttribute("Uid", rs.getInt("id"));
		    }else {
                 session.setAttribute("LStatus","False");
		    	response.sendRedirect("login.jsp");
		    }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
		
	}

}
