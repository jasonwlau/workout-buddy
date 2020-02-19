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
 * Servlet implementation class AcceptRequest
 */
@WebServlet("/AcceptRequest")
public class AcceptRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	// take in parameters sender, day, time, and interest
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String sender = request.getParameter("sender");
		String day = request.getParameter("day");
		String time = request.getParameter("time");
		String interest = request.getParameter("interest");
		String receiver = (String) session.getAttribute("userName");
		System.out.println(sender + "\n" + day + "\n" + time + "\n" + interest + "\n" + receiver);
		try {
			PreparedStatement ps = null;
			Connection c = DriverManager.getConnection("jdbc:mysql://google/FinalProject?cloudSqlInstance=bionic-torch-255423:us-central1:sql-db-1&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false","ZhiyuLiao","kaibsb51");
  			ps = c.prepareStatement("INSERT INTO connection (sender, receiver, day, time, interest) VALUES (?,?,?,?,?)");
  			ps.setString(1, sender);
  			ps.setString(2, receiver);
  			ps.setString(3, day);
  			ps.setString(4, time);
  			ps.setString(5, interest);
  			ps.executeUpdate();
  			PreparedStatement ps2 = c.prepareStatement("INSERT INTO connection (sender, receiver, day, time, interest) VALUES (?,?,?,?,?)");
  			ps2.setString(1, receiver);
  			ps2.setString(2, sender);
  			ps2.setString(3, day);
  			ps2.setString(4, time);
  			ps2.setString(5, interest);
  			ps2.executeUpdate();
			PreparedStatement ps3 = c.prepareStatement("DELETE FROM request WHERE sender=? AND receiver=? AND day=? AND time=? AND interest=?");
			ps3.setString(1, sender);
  			ps3.setString(2, receiver);
  			ps3.setString(3, day);
  			ps3.setString(4, time);
  			ps3.setString(5, interest);
  			ps3.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		String next = "/notify.jsp";
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(next);
		dispatch.forward(request, response);
	}

}
