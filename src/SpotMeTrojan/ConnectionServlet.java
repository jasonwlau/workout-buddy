package SpotMeTrojan;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class ConnectionServlet
 */
@WebServlet("/ConnectionServlet")
public class ConnectionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConnectionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession(true);
    	String next = "/sr.jsp";
    	String interest = request.getParameter("interest");
    	String location = request.getParameter("location");
    	String day = request.getParameter("day");
    	System.out.println(interest + " " + location + " " + day);
    	Vector<String> userNames = new Vector<String>();
    	Vector<Integer> photoIDs = new Vector<Integer>();
    	Vector<String> emails = new Vector<String>();
    	Vector<User> Users = new Vector<User>();

    		Connection cnnct = null;
   			PreparedStatement pStmnt = null;
   			
   			try{
   				cnnct = DriverManager.getConnection("jdbc:mysql://google/FinalProject?cloudSqlInstance=bionic-torch-255423:us-central1:sql-db-1&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false","ZhiyuLiao","kaibsb51");
   				
   				String preQueryStatement = "SELECT * FROM user u, interest i, available a WHERE u.username = i.username and u.username = a.username and u.location = ? and a.day = ? and i." + interest + " = ?";
   				
   				pStmnt = cnnct.prepareStatement(preQueryStatement);
   				pStmnt.setString(1, location);
   				pStmnt.setString(2, day);
   				pStmnt.setInt(3, 1);

                
                
                ResultSet rs = pStmnt.executeQuery();
                int num = 1;
                
                while (rs.next())
	            {
	            	String currUserName = rs.getString("username");
	            	userNames.add(currUserName);
	            	
	            	int currID = rs.getInt("photoid");
	            	photoIDs.add(currID);
	            	
	            	String curremail = rs.getString("email");
	            	emails.add(curremail);
	            	
	            	System.out.println("num is: " + num);//test
	            	num++;
	            }
                
                System.out.println("name length: " + userNames.size());//test
                System.out.println("photo length: " + photoIDs.size());//test
                System.out.println("email length: " + emails.size());//test
                
                pStmnt.close();
                
                for (int i = 0; i < userNames.size(); i++) {
                	String currUserName = userNames.get(i);
                	int currUserID = photoIDs.get(i);
                	
                	String preStatementInterests = "SELECT * FROM interest WHERE username = ?";
                	pStmnt = cnnct.prepareStatement(preStatementInterests);
                	
                	pStmnt.setString(1, currUserName);
                	
                	ResultSet rs2 = pStmnt.executeQuery();
                	Vector<String> currInterests = new Vector<String>();
                	
                	while (rs2.next()) {
                		if(rs2.getInt("basketball") == 1) {
                			currInterests.add("basketball");
                		}
                		
                		if(rs2.getInt("running") == 1) {
                			currInterests.add("running");
                		}
                		
                		if(rs2.getInt("hiking") == 1) {
                			currInterests.add("hiking");
                		}
                		
                		if(rs2.getInt("swimming") == 1) {
                			currInterests.add("swimming");
                		}
                		
                		if(rs2.getInt("biking") == 1) {
                			currInterests.add("biking");
                		}
                		
                		if(rs2.getInt("football") == 1) {
                			currInterests.add("football");
                		}
                		
                		if(rs2.getInt("tennis") == 1) {
                			currInterests.add("tennis");
                		}
                		
                		               		
                	}
                	
                	
                	pStmnt.close();
                	
                	String preStatementTimes = "SELECT * FROM available WHERE username = ?";
                	pStmnt = cnnct.prepareStatement(preStatementTimes);
                	
                	pStmnt.setString(1, currUserName);
                	
                	ResultSet rs3 = pStmnt.executeQuery();
                	Map<String, String>currTimes = new HashMap<String,String>();
                	
                	
                	while (rs3.next()) {
                		String currDay = rs3.getString("day");
                		String currTime = rs3.getString("time");
                		

                		currTimes.put(currDay, currTime);
                	}
                	
                	String username = (String)session.getAttribute("userName");
                	System.out.println("login user: " + username);//test
                	if (!currUserName.equals(username)) {
	                	User currUser = new User(currUserName, currUserID, emails.get(i), location
	                			, currTimes, currInterests);
	                	Users.add(currUser);
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
   			System.out.println(Users.size()+"here");
   			session.setAttribute("Users", Users);
   			
   			RequestDispatcher dispatch = getServletContext().getRequestDispatcher(next);
   	        dispatch.forward(request, response);
    }

}
