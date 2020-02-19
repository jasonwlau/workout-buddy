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
 * Servlet implementation class login
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	

    	String username = request.getParameter("username");
    	String password = request.getParameter("password");
   		String error = "";
   		String unEmpty = "";
   		String pwEmpty = "";
   		String next = "/signin.jsp";
   		boolean inputCorrect = true;
    	boolean pwCorrect = false;
   		boolean unCorrect = false;
   		HttpSession session = request.getSession(true);
    		
   		if (username == null || username.equals(""))
   		{
   			unEmpty+="Please enter the username.";
    		inputCorrect = false;
    	}
   		
   		if (password == null || password.equals(""))
   		{
   			pwEmpty+="Please enter the password.";
   			inputCorrect = false;
    	}
    	

   		if (inputCorrect) {
   			Connection cnnct = null;
   			PreparedStatement pStmnt = null;
    	       try
    	       {
    	            cnnct = DriverManager.getConnection("jdbc:mysql://google/FinalProject?cloudSqlInstance=bionic-torch-255423:us-central1:sql-db-1&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false","ZhiyuLiao","kaibsb51");
    	            
    	            String preQueryStatement
    	            = "SELECT * FROM user";
    	            
    	            pStmnt = cnnct.prepareStatement(preQueryStatement);
    	            
    	            ResultSet rs = pStmnt.executeQuery();
    	            while (rs.next())
    	            {
    	            	
    	            	if (username.equals(rs.getString("userName"))){
    	            		unCorrect = true;
    	            		
    	            		if (password.equals(rs.getString("passWord"))){
    	            			pwCorrect = true;
    	            			next = "/home.jsp";
    	            			session.setAttribute("login", "yes");
    	            			session.setAttribute("userName", username);
    	            		}
    	            		
    	            	}
    	
    	            }
    	            
    	            
    	            if (unCorrect)
    	            {
    	            	if (!pwCorrect)
    	            	{
    	            		error+="Incorrect password.";
    	            				
    	            	}
    	            }
    	            
    	            else
    	            {
    	            	error+="This user does not exist.";
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
            
            request.setAttribute("error", error);
            request.setAttribute("unEmpty", unEmpty);
            request.setAttribute("pwEmpty", pwEmpty);
            request.setAttribute("username", username);
            request.setAttribute("password", password);
            RequestDispatcher dispatch = getServletContext().getRequestDispatcher(next);
            dispatch.forward(request, response);
    	}

	
}
