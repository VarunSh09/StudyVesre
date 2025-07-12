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
import java.sql.SQLException;

/**
 * Servlet implementation class DownloadData
 */
@WebServlet("/DownloadData")
public class DownloadData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownloadData() {
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
		String name = request.getParameter("DName");
		String Email = request.getParameter("Demail");
		String ContactNo =(String) request.getParameter("DCno");
		String path = request.getParameter("file");
		String page = request.getParameter("page");
		int id =0;
		try {
		 id =Integer.parseInt(request.getParameter("id"));}
		catch(Exception e) {
			e.printStackTrace();
		}
		Connection con = DataCon.getCon();
		try {
			PreparedStatement ps = con.prepareStatement("insert into DownloadFile(Name,Email,ContactNo) value(?,?,?)");
			ps.setString(1, name);
			ps.setString(2, Email);
			ps.setString(3, ContactNo);
			int i = ps.executeUpdate();
			
			if(i==1) {
                session.setAttribute("dwd","True");

				response.sendRedirect(page+"?id="+id);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
