package SpotMeTrojan;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RegistInfoServlet
 */
@WebServlet("/RegistInfoServlet")
public class RegistInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String location = request.getParameter("location");
    	System.out.println(location);

    	int photoid = Integer.parseInt(request.getParameter("photoid"));

    	String[] interests = request.getParameterValues("interests");

    	String[] days = request.getParameterValues("day");
    	
    	Vector<String> times = new Vector<String>();
    	
    	for (int i = 0; i < 7; i++) {
    		String name = "time";
    		name = name + Integer.toString(i+1);
    		System.out.println(name);
    		String time = request.getParameter(name);
    		times.add(time);
    		System.out.println(time);
    	}
    	
    	
    	String next = "/home.jsp";	
     	
    	HttpSession session = request.getSession(true);
    	String username = (String)session.getAttribute("userName");
    	Connection cnnct = null;
        PreparedStatement pStmnt = null;
        
        try {
        	cnnct = DriverManager.getConnection("jdbc:mysql://google/FinalProject?cloudSqlInstance=bionic-torch-255423:us-central1:sql-db-1&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false&user=ZhiyuLiao&password=kaibsb51");
        	 
        	String updateStatement
	            = "UPDATE user SET photoid = ? WHERE username = ?";  	 
        	 pStmnt = cnnct.prepareStatement(updateStatement);
        	 pStmnt.setInt(1, photoid);
        	 pStmnt.setString(2, username);        	 
        	 pStmnt.executeUpdate();        	 
        	 pStmnt.close();
        	 
        	 if (location != null) {
	        	 updateStatement = "UPDATE user SET location = ? WHERE username = ?";
	        	 pStmnt = cnnct.prepareStatement(updateStatement);
	        	 pStmnt.setString(1, location);
	        	 pStmnt.setString(2, username);
	        	 pStmnt.executeUpdate();
	        	 pStmnt.close();
        	 }
        	 
        	 if (interests != null) {
	        	 for (int i = 0; i < interests.length; i++) {
	        		 updateStatement = "UPDATE interest SET " + interests[i] + " = ? WHERE username = ?";
	        		 pStmnt = cnnct.prepareStatement(updateStatement);
	        		 pStmnt.setInt(1, 1);
	            	 pStmnt.setString(2, username);
	            	 pStmnt.executeUpdate();
	            	 pStmnt.close();         	 
	        	 }
        	 }
        	 
        	 if (days != null) {
	        	 for (int i = 0; i< days.length; i++) {
	        		 String currDay = days[i];
	        		 String currTime = "Allday";
	        		 
	        		 if (currDay.contentEquals("monday")) {
	        			 currTime = times.get(0);
	        		 }
	        		 
	        		 if (currDay.contentEquals("tuesday")) {
	        			 currTime = times.get(1);
	        		 }
	        		 
	        		 if (currDay.contentEquals("wednesday")) {
	        			 currTime = times.get(2);
	        		 }
	        		 
	        		 if (currDay.contentEquals("thursday")) {
	        			 currTime = times.get(3);
	        		 }
	        		 
	        		 if (currDay.contentEquals("friday")) {
	        			 currTime = times.get(4);
	        		 }
	        			 
	        		 if (currDay.contentEquals("saturday")) {
	        			 currTime = times.get(5);
	        		 }
	        		 
	        		 
	        		 if (currDay.contentEquals("sunday")) {
	        			 currTime = times.get(6);
	        		 }
	        			
					 updateStatement = "INSERT into available (username, day, time) VALUES (?, ?, ?)";
	        		 pStmnt = cnnct.prepareStatement(updateStatement);
	        		 pStmnt.setString(1, username);
	        		 pStmnt.setString(2, currDay);
	            	 pStmnt.setString(3, currTime);
	            	 pStmnt.executeUpdate();
	            	 pStmnt.close();    
	            	 
	        		 
	        	 }
        	 }
        	 
        	 
        	 
        	 
        	 
        }catch (SQLException ex) 
        {
            while (ex != null) 
            {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        }

        finally
        {
            if (pStmnt != null) 
            {
                try 
                {

                    pStmnt.close();
                } 
                catch (SQLException e)
                {

                }
            }

            if (cnnct!= null) 
            {

                try 
                {
                    cnnct.close();

                } 
                catch (SQLException sqlEx) 
                {

                }
            }
        }
		
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(next);
        dispatch.forward(request, response);
    }

}
