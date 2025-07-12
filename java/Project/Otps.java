package Project;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class Otps
 */
@WebServlet("/Otps")
public class Otps extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Otps() {
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
		  HttpSession session=request.getSession();  
		  PrintWriter pw = response.getWriter();
		  		String otp = request.getParameter("uOtp");
		  		String otpv = (String)session.getAttribute("OTPs");
		  		if(otp.equals(otpv)) {
		  			pw.print("OTP match");
		  			response.sendRedirect("UpdatePassword.jsp");
		  			
		  		}else {
		  			pw.print("OTP not  match");
		  			response.sendRedirect("OTP.jsp");


		  		}
	}

}
