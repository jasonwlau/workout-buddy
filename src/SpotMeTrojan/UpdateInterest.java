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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UpdateInterest
 */
@WebServlet("/UpdateInterest")
public class UpdateInterest extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	// take in parameters username and activity
	// updates the activity to be a 1
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
    	String username = (String)session.getAttribute("userName");
		String activity = request.getParameter("interest");
		String next = "/myInfo.jsp";
		
		//if(username.equals("null") || username.contentEquals("")) {
			username = "A";
	//	}
		
		System.out.println(username);//test
		System.out.println(activity);//test
		try {
			PreparedStatement ps = null;
			Connection c = DriverManager.getConnection("jdbc:mysql://google/FinalProject?cloudSqlInstance=bionic-torch-255423:us-central1:sql-db-1&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false","ZhiyuLiao","kaibsb51");
  			ps = c.prepareStatement("UPDATE interest SET " + activity + " = 1 WHERE username = ?");
			ps.setString(1, username);
			ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(next);
        dispatch.forward(request, response);
	}

}
