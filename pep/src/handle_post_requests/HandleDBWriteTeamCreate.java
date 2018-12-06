package handle_post_requests;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data_management.Driver;

/**
 * Servlet implementation class HandleDBWriteTeamCreate
 */
@WebServlet("/handle_db_write_create_teams")
public class HandleDBWriteTeamCreate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HandleDBWriteTeamCreate() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HashMap<String, String> push_into_db = new HashMap<>();
		for (String key : request.getParameterMap().keySet())
		{
			push_into_db.put(key, request.getParameterMap().get(key)[0]);
		}
		
		Driver datenhaltung = new Driver();
		
		try 
		{
			ArrayList<HashMap<String, String>> lehrstuhl_tut_1 = datenhaltung.getSubCat("lehrstuhl", "accountname_ID", push_into_db.get("betreuer1"), "lehrstuhlname_ID");
			if (!lehrstuhl_tut_1.isEmpty())
			{
				datenhaltung.createTeam(lehrstuhl_tut_1.get(0).get("lehrstuhlname_ID"), push_into_db.get("projekttitel"), push_into_db.get("organisationseinheitname_ID"), push_into_db.get("betreuer1"), push_into_db.get("betreuer2"));
				
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("window.open(\"/pep/home/show_teams\", \"_self\")");
		out.println("</script>");
		out.close();
	}
}
