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
 * Servlet implementation class HandleDBWrite
 */
@WebServlet("/handle_db_write")
public class HandleDBWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HandleDBWrite() {
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
		String mail = push_into_db.get("accountname_ID");
		push_into_db.remove("accountname_ID");
		Driver datenhaltung = new Driver();
		
		try 
		{
			datenhaltung.updateTable("account", mail, push_into_db);
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("window.open(\"/pep/home/show_accounts\", \"_self\")");
		out.println("</script>");
		out.close();
	}

}
