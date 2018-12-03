package home;

import java.io.IOException;
import data_management.Driver;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class HomeServlet
 */
@WebServlet("/home")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Driver datenhaltung = new Driver();
		HttpSession session = request.getSession();
		String session_ID = (String)(session.getAttribute("session_id"));
		
		System.out.println(session_ID);
		
		try 
		{
			HashMap<String, String> rights = datenhaltung.getRights(Integer.valueOf(session_ID));
			System.out.println(rights);
			if (rights.get("accessMarks").equals("1") && rights.get("manageProject").equals("1") && rights.get("seeAllGroupInformation").equals("1") && rights.get("setupGroup").equals("1"))
			{
				RequestDispatcher rd = request.getRequestDispatcher("/home/index_startseite_admin.html");
				rd.forward(request,  response);
			}
			else
			{
				RequestDispatcher rd = request.getRequestDispatcher("/login");
				rd.forward(request,  response);
			}
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
