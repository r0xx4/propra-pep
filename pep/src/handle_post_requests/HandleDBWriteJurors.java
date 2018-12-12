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
 * Servlet implementation class HandleDBWrite
 */
@WebServlet("/handle_db_write_jurors")
public class HandleDBWriteJurors extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HandleDBWriteJurors() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HashMap<String, String> push_into_db = new HashMap<>();
		for (String key : request.getParameterMap().keySet()) {
			String val = request.getParameter(key);
			if (val != null && !val.equals("") && !val.equals("-"))
				push_into_db.put(key, val);
		}

		Driver datenhaltung = new Driver();

		try {
			if (push_into_db.containsKey("organisationseinheitname_ID")) {
				String group = push_into_db.get("organisationseinheitname_ID");
				push_into_db.remove("organisationseinheitname_ID");
				datenhaltung.deleteRow("jurormap", "organisationseinheitname_ID", group);//

				for (String juror : push_into_db.values()) {
					String email[] = juror.split(":");
					HashMap<String, String> jurormap = new HashMap<>();
					jurormap.put("organisationseinheitname_ID", group);
					jurormap.put("accountname_ID", email[1]);
					datenhaltung.insertHashMap("jurormap", jurormap);
				}
			} else {
				ArrayList<HashMap<String, String>> juroren = new ArrayList<>();
				for (String juror : push_into_db.values()) {
					String email[] = juror.split(":");
					HashMap<String, String> juro = new HashMap<>();
					juro.put("accountname_ID", email[1]);
					juroren.add(juro);
				}
				datenhaltung.insertNewGroup(juroren);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("window.open(\"/pep/home/show_groups\", \"_self\")");
		out.println("</script>");
		out.close();
	}

}
