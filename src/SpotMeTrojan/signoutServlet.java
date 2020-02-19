package SpotMeTrojan;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class signoutServlet
 */
@WebServlet("/signoutServlet")
public class signoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public signoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
				HttpSession session = request.getSession();
				session.setAttribute("userName", "");
				session.setAttribute("login", "no");
				String next = "/home.jsp";
				RequestDispatcher dispatch = getServletContext().getRequestDispatcher(next);
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
