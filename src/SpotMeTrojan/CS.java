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

import SpotMeTrojan.ConnectDetail;

/**
 * Servlet implementation class connnectionServlet
 */
@WebServlet("/CS")
public class CS extends HttpServlet {
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
	
	public static ArrayList<ConnectDetailPro> getRequests(String user) {
		ArrayList<ConnectDetail> res = new ArrayList<ConnectDetail>();
		ArrayList<ConnectDetailPro> resPro = new ArrayList<ConnectDetailPro>();
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
			
			ps.close();
			
			for (int i = 0; i < res.size(); i++) {
				
				ConnectDetail curr = res.get(i);
				
				ps = c.prepareStatement("SELECT * FROM user WHERE username=?");
				ps.setString(1, curr.getSender());
				ResultSet rs2 = ps.executeQuery();
				rs2.next();
				
				String email = rs2.getString("email");
				int photoID = rs2.getInt("photoid");
				
				ConnectDetailPro cdPro = new ConnectDetailPro(curr, email, photoID);
				resPro.add(cdPro);
				ps.close();
			}
 		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return resPro;
	}
	
	public static Queue<ConnectDetailPro> getConnections(String user) {
		Queue<ConnectDetail> res = new ArrayDeque<ConnectDetail>();
		Queue<ConnectDetailPro> resPro = new ArrayDeque<ConnectDetailPro>();
		
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
			
			ps.close();
			
			for(ConnectDetail con:res ){
				String sender = con.getSender();
				ps = c.prepareStatement("SELECT * FROM user WHERE username=?");
				ps.setString(1, sender);
				
				ResultSet rs2 = ps.executeQuery();
				if(rs2.next()) {
					String email = rs2.getString("email");
					int photoID = rs2.getInt("photoid");
					
					ConnectDetailPro cdPro = new ConnectDetailPro(con, email, photoID);
					
					resPro.add(cdPro);
				}
				
			}
 		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		
		return resPro;
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = (String) request.getSession().getAttribute("userName");

		Queue<ConnectDetailPro> connection = (Queue<ConnectDetailPro>)getConnections(username);
		System.out.println(connection.size());//test now good
		HttpSession session = request.getSession();
		String next = "/schedule.jsp";
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(next);
		session.setAttribute("connection", connection);
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


}
