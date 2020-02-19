package SpotMeTrojan;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RegistServlet
 */
@WebServlet("/RegistServlet")
public class RegistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    	
    	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		String username = request.getParameter("username");
    		System.out.println(username);
    		String password = request.getParameter("password");
    		String email = request.getParameter("email");
    		
    		String confirmPassword = request.getParameter("passwordConfirm");
    		String unEmpty = "";
    		String pwEmpty = "";
    		String emEmpty = "";
    		String unTaken = "";
    		String pwNotMatch = "";
    		String next = "/register.jsp";
    		boolean inputCorrect = true;
    		boolean unDuplicate = false;
    		HttpSession session = request.getSession(true);
    		
    		if (username == null || username.equals(""))
    		{
    			unEmpty+="Please enter the username.";
    			inputCorrect = false;
    		}

    		
    		if (email == null || email.equals(""))
    		{
    			emEmpty+="Please enter the email.";
    			inputCorrect = false;
    		}
    		

    		
    		if (password == null || password.equals(""))
    		{
    			pwEmpty+="Please enter the password.";
    			inputCorrect = false;

    		}else{
    			
    			if (!password.equals(confirmPassword)) {
    				inputCorrect = false;
    				pwNotMatch +="The passwords do not match.";		

    			}
    		}
    		

    		if (inputCorrect)
    		{
    			
    			Connection cnnct = null;
    	        PreparedStatement pStmnt = null;
    	        try
    	        {
    	            cnnct = DriverManager.getConnection("jdbc:mysql://google/FinalProject?cloudSqlInstance=bionic-torch-255423:us-central1:sql-db-1&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false&user=ZhiyuLiao&password=kaibsb51");
    	            
    	            String preQueryStatement
    	            = "SELECT * FROM user";
    	            
    	            pStmnt = cnnct.prepareStatement(preQueryStatement);
    	            
    	            ResultSet rs = pStmnt.executeQuery();
    	            while (rs.next())
    	            {
    	            	if (username.equals(rs.getString("userName"))) {
    	            		unTaken += "This username is already taken.";
    	            		unDuplicate = true;
    	            	}
    	            }
    	            
    	            pStmnt.close();
    	            
    	            if (!unDuplicate)
    	            {
    	            	session.setAttribute("login", "yes");
    	            	session.setAttribute("userName", username);
    	            	next = "/information.jsp";
    	            	
    	            	String insertStatement
    	                = "INSERT INTO user(userName, passWord, email) VALUES (?, ?, ?)";
    	                pStmnt = cnnct.prepareStatement(insertStatement);
    	                pStmnt.setString(1, username);
    	                pStmnt.setString(2, password);
    	                pStmnt.setString(3, email);
    	                pStmnt.executeUpdate();
    	                pStmnt.close();
    	                
    	                
    	                insertStatement = "INSERT INTO interest (username) VALUES (?)";
    	                pStmnt = cnnct.prepareStatement(insertStatement);    	                
    	                pStmnt.setString(1, username);
    	                pStmnt.executeUpdate();
    	                pStmnt.close();
    	                
    	                
//    	                insertStatement = "INSERT INTO available (username) VALUES (?)";
//    	                pStmnt = cnnct.prepareStatement(insertStatement);   	                
//    	                pStmnt.setString(1, username);
//    	                pStmnt.executeUpdate();
//    	                pStmnt.close();
    	            }
    	            
    	               

    	        } 

    	        catch (SQLException ex) 
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
    		}
    		
    		
    		request.setAttribute("username", username);
    		request.setAttribute("password", password);
    		
    		request.setAttribute("email", email);
    		
    		
    		request.setAttribute("unEmpty", unEmpty);
    		request.setAttribute("pwEmpty", pwEmpty);
    		request.setAttribute("emEmpty", emEmpty);
    		request.setAttribute("pwNotMatch", pwNotMatch);
    		request.setAttribute("unTaken", unTaken);
    		
    		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(next);
            dispatch.forward(request, response);
    	}

}
