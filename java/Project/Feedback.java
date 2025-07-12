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
import java.sql.ResultSet;

/**
 * Servlet implementation class Feedback
 */
@WebServlet("/Feedback")
public class Feedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Feedback() {
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
		
		String feedback = request.getParameter("feedback");
		HttpSession session = request.getSession();
	int uid =	(int)session.getAttribute("Uid");
		try {
			Connection con = DataCon.getCon();
			
    			PreparedStatement ps = con.prepareStatement("insert into feedback(uid,feedback)values(?,?)");
             ps.setInt(1,uid);
			ps.setString(2,feedback);
			
			ps.executeUpdate();
			response.sendRedirect("Feedback.jsp");
           
            	
            
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
