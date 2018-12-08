package handle_post_requests;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data_management.Driver;

/**
 * Servlet implementation class HandleDBWritePersonalInfo
 */
@WebServlet("/handle_db_write_personal_info")
public class HandleDBWritePersonalInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HandleDBWritePersonalInfo() {
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
//		HashMap<String, String> push_into_db = new HashMap<>();
//		for (String key : request.getParameterMap().keySet()) {
//			if (request.getParameterMap().get(key)[0].equals("") || request.getParameterMap().get(key)[0].equals(null))
//				push_into_db.put(key, request.getParameterMap().get(key)[0]);
//			else
//				push_into_db.remove(key);
//		}
//
//		Driver datenhaltung = new Driver();
//		String pw = "password";
//		String acc = "account";
//
//		try {
//			String s=push_into_db.get("accountname_ID");
//			if (push_into_db.containsKey(pw)) {
//				String newPw = Driver.getHash(push_into_db.get(pw).getBytes(StandardCharsets.UTF_8));
//				String oldPw = datenhaltung.getSubCat(acc, s).get(0).get(pw).toString();
//				if (!oldPw.equals(newPw))
//					push_into_db.remove(pw);
//			}
//			push_into_db.remove(s);
//			datenhaltung.insertHashMap(acc, push_into_db);
//		} catch (NoSuchAlgorithmException | SQLException e) {
//			e.printStackTrace();
//		}
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("window.open(\"/pep/home/view_personal_info\", \"_self\")");
		out.println("</script>");
		out.close();
	}
}
