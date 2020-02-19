package SpotMeTrojan;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RemoveInterest
 */
@WebServlet("/RemoveInterest")
public class RemoveInterest extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	// take in parameters username and activity
	// updates the activity to be a 0
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		if(username.contentEquals("null") || username.contentEquals("")) {
			username = "A";
		}
		String next = "/myInfo.jsp";
		String activity = request.getParameter("interest");
		System.out.println(username);//test
		System.out.println(activity);//test
		try {
			PreparedStatement ps = null; 
			Connection c = DriverManager.getConnection("jdbc:mysql://google/FinalProject?cloudSqlInstance=bionic-torch-255423:us-central1:sql-db-1&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false","ZhiyuLiao","kaibsb51");
  			ps = c.prepareStatement("UPDATE interest SET " + activity + " = 0 WHERE username = ?");
			ps.setString(1, username);
			ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(next);
	    dispatch.forward(request, response);
	}
}
	
	
