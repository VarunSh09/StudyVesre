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
import java.sql.SQLException;

/**
 * Servlet implementation class Enroll
 */
@WebServlet("/Enroll")
public class Enroll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Enroll() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	    HttpSession session = request.getSession();
	    String course = request.getParameter("Course");
	    String Image = request.getParameter("Images");
        if(session.getAttribute("Uid")==null) {
			response.sendRedirect("login.jsp");
		}
        else { Connection con = DataCon.getCon();
	    int uid =(int) session.getAttribute("Uid");
	    int cid = Integer.parseInt(request.getParameter("cid"));
	 try {
		 PreparedStatement ps1 = con.prepareStatement("select * from mycourse where uid=? && cid=?");
		 ps1.setInt(1, uid);
		 ps1.setInt(2, cid);
		 ResultSet rs = ps1.executeQuery();
           if(!rs.next()) {
		 PreparedStatement ps = con.prepareStatement("insert into mycourse(uid,cid)values(?,?)");
			ps.setInt(1, uid);
			ps.setInt(2, cid);
		    ps.executeUpdate();
		   response.sendRedirect("ESection.jsp?Course_Id="+cid+"&Course="+course+"&Images="+Image);}
           else {
        	   String MessMyCourse="T";
    		   response.sendRedirect("MyCourses.jsp?Message="+MessMyCourse);}
           
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
