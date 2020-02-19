package SpotMeTrojan;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Recommend
 */
@WebServlet("/RecommendServlet")
public class RecommendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecommendServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//System.out.println("hi");
		Vector<User> recommendation = new Vector<>();
		Set<String> similar = new HashSet<>();
		HttpSession session = request.getSession(false);
		Connection conn = null;
		if (session == null) {
			//request.setAttribute("recommendations", recommendation);
		}
		else {
			try {
				String username = (String)session.getAttribute("userName");
				//System.out.println(username);
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://google/FinalProject?cloudSqlInstance=bionic-torch-255423:us-central1:sql-db-1&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false","ZhiyuLiao","kaibsb51");			
				PreparedStatement ps = conn.prepareStatement("SELECT * FROM interest WHERE username = ?");
				ps.setString(1, username);
				ResultSet rs = ps.executeQuery();
				rs.next();
				if (rs.getInt("basketball") == 1) {
					PreparedStatement ps2 = conn.prepareStatement("SELECT * FROM interest WHERE username <> ? AND basketball = 1");
					ps2.setString(1, username);
					ResultSet rs2 = ps2.executeQuery();
					while (rs2.next()) {
						similar.add(rs2.getString("username"));
					}
				}
				if (rs.getInt("running") == 1) {
					PreparedStatement ps2 = conn.prepareStatement("SELECT * FROM interest WHERE username <> ? AND running = 1");
					ps2.setString(1, username);
					ResultSet rs2 = ps2.executeQuery();
					while (rs2.next()) {
						similar.add(rs2.getString("username"));
					}
				}
				if (rs.getInt("hiking") == 1) {
					PreparedStatement ps2 = conn.prepareStatement("SELECT * FROM interest WHERE username <> ? AND hiking = 1");
					ps2.setString(1, username);
					ResultSet rs2 = ps2.executeQuery();
					while (rs2.next()) {
						similar.add(rs2.getString("username"));
					}
				}
				if (rs.getInt("swimming") == 1) {
					PreparedStatement ps2 = conn.prepareStatement("SELECT * FROM interest WHERE username <> ? AND swimming = 1");
					ps2.setString(1, username);
					ResultSet rs2 = ps2.executeQuery();
					while (rs2.next()) {
						similar.add(rs2.getString("username"));
					}
				}
				if (rs.getInt("biking") == 1) {
					PreparedStatement ps2 = conn.prepareStatement("SELECT * FROM interest WHERE username <> ? AND biking = 1");
					ps2.setString(1, username);
					ResultSet rs2 = ps2.executeQuery();
					while (rs2.next()) {
						similar.add(rs2.getString("username"));
					}
				}
				if (rs.getInt("football") == 1) {
					PreparedStatement ps2 = conn.prepareStatement("SELECT * FROM interest WHERE username <> ? AND football = 1");
					ps2.setString(1, username);
					ResultSet rs2 = ps2.executeQuery();
					while (rs2.next()) {
						similar.add(rs2.getString("username"));
					}
				}
				if (rs.getInt("tennis") == 1) {
					PreparedStatement ps2 = conn.prepareStatement("SELECT * FROM interest WHERE username <> ? AND tennis = 1");
					ps2.setString(1, username);
					ResultSet rs2 = ps2.executeQuery();
					while (rs2.next()) {
						similar.add(rs2.getString("username"));
					}
				}
				for (String user : similar) {
					//System.out.println(user);
					Vector<String> interest = new Vector<>();
					Map<String, String> times = new HashMap<>();
					PreparedStatement ps2 = conn.prepareStatement("SELECT * FROM interest WHERE username = ?");
					ps2.setString(1, user);
					ResultSet rs2 = ps2.executeQuery();
					while (rs2.next()) {
						if (rs2.getInt("basketball") == 1) {
							interest.add("basketball");
						}
						if (rs2.getInt("running") == 1) {
							interest.add("running");
						}
						if (rs2.getInt("hiking") == 1) {
							interest.add("hiking");
						}
						if (rs2.getInt("swimming") == 1) {
							interest.add("swimming");
						}
						if (rs2.getInt("biking") == 1) {
							interest.add("biking");
						}
						if (rs2.getInt("football") == 1) {
							interest.add("football");
						}
						if (rs2.getInt("tennis") == 1) {
							interest.add("tennis");
						}
					}
					PreparedStatement ps3 = conn.prepareStatement("SELECT * FROM available WHERE username = ?");
					ps3.setString(1, user);
					ResultSet rs3 = ps3.executeQuery();
					while (rs3.next()) {
						String day = rs3.getString("day");
						String time = rs3.getString("time");
						//System.out.println(day + " " + time);
						times.put(day, time);
					}
					PreparedStatement ps4 = conn.prepareStatement("SELECT * FROM user WHERE username = ?");
					ps4.setString(1, user);
					ResultSet rs4 = ps4.executeQuery();
					rs4.next();
					int photoID = rs4.getInt("photoid");
					String email = rs4.getString("email");
					String location = rs4.getString("location");
					User u = new User(user, photoID, email, location, times, interest);
					//System.out.println(user);
					recommendation.add(u);
				}
				session.setAttribute("recommendations", recommendation);
			} catch(Exception e) {
				System.out.println("error");
				e.printStackTrace();
			}
			String next = "/connection.jsp";
			RequestDispatcher dispatch = getServletContext().getRequestDispatcher(next);
			dispatch.forward(request, response);
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
