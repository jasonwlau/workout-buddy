package SpotMeTrojan;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RequestServlet
 */
@WebServlet("/RequestServlet")
public class RequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("here");
		HttpSession session = request.getSession(false);
		Connection conn = null;
		if (session != null) {
			try {
				String username = (String)session.getAttribute("userName");
//				String receiver = (String)session.getAttribute("receiver");
//				String day = (String)session.getAttribute("day");
//				String time = (String)session.getAttribute("time");
//				String interest = (String)session.getAttribute("interest");
				String receiver = request.getParameter("receiver");
				String day = request.getParameter("day");
				String time = request.getParameter("time");
				String interest = request.getParameter("interest");
				System.out.println(day + " " + time + " " + receiver);
				//System.out.println(day2 + " " + time2 + " " + receiver2);
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://google/FinalProject?cloudSqlInstance=bionic-torch-255423:us-central1:sql-db-1&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false","ZhiyuLiao","kaibsb51");			
				PreparedStatement ps = conn.prepareStatement("INSERT IGNORE INTO request (sender, receiver, day, time, interest) VALUES (?, ?, ?, ?, ?)");
				ps.setString(1, username);
				ps.setString(2, receiver);
				ps.setString(3, day);
				ps.setString(4, time);
				ps.setString(5, interest);
				ps.executeUpdate();
			} catch(Exception e) {
				System.out.println("error");
				e.printStackTrace();
			}
			String next = "/RecommendServlet";
			RequestDispatcher dispatch = getServletContext().getRequestDispatcher(next);
			dispatch.forward(request, response);
		}
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
