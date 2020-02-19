package SpotMeTrojan;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UpdateNotification
 */
@WebServlet("/UpdateNotification")
public class UpdateNotification extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	// take in parameters sender, day, time, interest, and integer accept (1 for accept, 0 for decline)
	// adds connection into database if accept
	// removes request from database if decline
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String sender = request.getParameter("sender");
		String day = request.getParameter("day");
		String time = request.getParameter("time");
		String interest = request.getParameter("interest");
		String receiver = (String) session.getAttribute("username");
		int accept = Integer.parseInt(request.getParameter("accept"));
		try {
			PreparedStatement ps = null; 
			Connection c = DriverManager.getConnection("jdbc:mysql://google/FinalProject?cloudSqlInstance=bionic-torch-255423:us-central1:sql-db-1&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false","ZhiyuLiao","kaibsb51");
			if (accept == 1) {
	  			ps = c.prepareStatement("INSERT INTO connection (sender, receiver, day, time, interest) VALUES (?,?,?,?,?)");
	  			ps.setString(1, sender);
	  			ps.setString(2, receiver);
	  			ps.setString(3, day);
	  			ps.setString(4, time);
	  			ps.setString(5, interest);
			}
				ps = c.prepareStatement("DELETE FROM request WHERE sender=? AND receiver=? AND day=? AND time=? AND interest=?");
				ps.setString(1, sender);
	  			ps.setString(2, receiver);
	  			ps.setString(3, day);
	  			ps.setString(4, time);
	  			ps.setString(5, interest);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}

}
