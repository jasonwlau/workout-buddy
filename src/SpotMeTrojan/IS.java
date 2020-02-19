package SpotMeTrojan;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Queue;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class IS
 */
@WebServlet("/IS")
public class IS extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static ArrayList<String> getInterests(String user){
		String[] a = new String[]{"basketball", "running", "hiking", "swimming", "biking", "football", "tennis"};
		ArrayList<String> res = new ArrayList<String>();
		try {
			Connection c = DriverManager.getConnection("jdbc:mysql://google/FinalProject?cloudSqlInstance=bionic-torch-255423:us-central1:sql-db-1&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false","ZhiyuLiao","kaibsb51");
			PreparedStatement ps = c.prepareStatement("SELECT * FROM interest WHERE username=?");
			ps.setString(1, user);
			ResultSet rs = ps.executeQuery();
			for (int i = 0; i < 7; i++) {
				int result = Integer.parseInt(rs.getString(a[i]));
				if (result == 1) {
					res.add(a[i]);
				}
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return res;
	}
	
	public static Map<String, String> getTimes(String user){
		Map<String, String> res = new HashMap<String, String>();
		try {
			Connection c = DriverManager.getConnection("jdbc:mysql://google/FinalProject?cloudSqlInstance=bionic-torch-255423:us-central1:sql-db-1&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false","ZhiyuLiao","kaibsb51");
			PreparedStatement ps = c.prepareStatement("SELECT * FROM available WHERE username=?");
			ps.setString(1, user);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String day = rs.getString("day");
				String time = rs.getString("time");
				res.put(day, time);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return res;
	}
	
	public static ArrayList<ConnectDetail> getRequests(String user) {
		ArrayList<ConnectDetail> res = new ArrayList<ConnectDetail>();
		try {
			Connection c = DriverManager.getConnection("jdbc:mysql://google/FinalProject?cloudSqlInstance=bionic-torch-255423:us-central1:sql-db-1&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false","ZhiyuLiao","kaibsb51");
			PreparedStatement ps = c.prepareStatement("SELECT * FROM request WHERE receiver=?");
			ps.setString(1, user);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String sender = rs.getString("sender");
				String day = rs.getString("day");
				String time = rs.getString("time");
				String interest = rs.getString("interest");
				ConnectDetail cd = new ConnectDetail(sender, day, time, interest);
				res.add(cd);
			}
 		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		

		return res;
	}
	
	public static Queue<ConnectDetail> getConnections(String user) {
		Queue<ConnectDetail> res = new ArrayDeque<ConnectDetail>();
		try {
			Connection c = DriverManager.getConnection("jdbc:mysql://google/FinalProject?cloudSqlInstance=bionic-torch-255423:us-central1:sql-db-1&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false","ZhiyuLiao","kaibsb51");
			PreparedStatement ps = c.prepareStatement("SELECT * FROM connection WHERE receiver=?");
			ps.setString(1, user);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String sender = rs.getString("sender");
				String day = rs.getString("day");
				String time = rs.getString("time");
				String interest = rs.getString("interest");
				ConnectDetail cd = new ConnectDetail(sender, day, time, interest);
				res.add(cd);
			}
 		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return res;
	}


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = (String) request.getSession().getAttribute("userName");

		ArrayList<ConnectDetail> invite = getRequests(username);
		
		HttpSession session = request.getSession();
		String next = "/notify.jsp";
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(next);
		session.setAttribute("invite", invite);
		
		try {
	   dispatch.forward(request, response);
	  }catch(IOException e) {
	   e.printStackTrace();
	  }catch (ServletException e) {
	   e.printStackTrace();
	  }catch (NullPointerException e) {
	   e.printStackTrace();
	  }
	} 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IS() {
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
	}

}
