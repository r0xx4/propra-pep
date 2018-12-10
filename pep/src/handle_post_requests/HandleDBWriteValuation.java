package handle_post_requests;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data_management.Driver;

/**
 * Servlet implementation class HandleDBWriteValuation
 */
@WebServlet("/set_grades")
public class HandleDBWriteValuation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HandleDBWriteValuation() {
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
		System.out.println(push_into_db);
		Driver datenhaltung = new Driver();
		
		String teamname_ID = push_into_db.get("teamname_ID");
		push_into_db.remove("teamname_ID");
		
		for (String attr : push_into_db.keySet())
		{
			if (!push_into_db.get(attr).equals("-"))
			{
				HashMap<String, String> bewertung = new HashMap<>();
				bewertung.put("teamname_ID", teamname_ID);
				bewertung.put("teilkriteriumname_ID", attr);
				bewertung.put("punkte", push_into_db.get(attr));
				try 
				{
					datenhaltung.insertHashMap("kriteriumsmap", bewertung);
				} 
				catch (SQLException e) 
				{
					e.printStackTrace();
				}
			}
		}
		
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("window.open(\"/pep/home/show_teams\", \"_self\")");
		out.println("</script>");
		out.close();
	}

}