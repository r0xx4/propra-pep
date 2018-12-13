package download;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data_management.Driver;
import pdf_creator.*;

/**
 * Servlet implementation class HandleBestRanked
 */
@WebServlet("/best_ranked_pdf")
public class HandleBestRanked extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HandleBestRanked() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Driver datenhaltung = new Driver();
		
		Path path = Paths.get("c:/data/Abschlusspraesentation");
		if(!Files.exists(path)) {
			new File("c:/data/Abschlusspraesentation").mkdirs();
		}
		
		try {
			int anzahl = datenhaltung.getSubCat("organisationseinheit").size();
			ArrayList<HashMap<String, String>> units = datenhaltung.getSubCat("organisationseinheit");
			HashMap<String, ArrayList<HashMap<String, String>>> teams = new HashMap<String, ArrayList<HashMap<String, String>>>();
			for(HashMap<String, String> u : units) {
				teams.put(u.get("organisationseinheitname_ID"), new ArrayList<HashMap<String, String>>());
				//System.out.println(teams);
				for(HashMap<String, String> t : datenhaltung.getSubCat("team")) {
					if(u.get("organisationseinheitname_ID").equals(t.get("organisationseinheitname_ID"))) {

						teams.get(u.get("organisationseinheitname_ID")).add(new HashMap<String, String>(){
							{
								put(t.get("teamname_ID"), t.get("note"));
							}
						});
					}
				}
			}

			
			System.out.println(teams);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
//		Pdfcreator pdf = new Pdfcreator();
//		//pdf.creategewinnerliste(2, list, list2, path);
//		
//		response.setContentType("text/html");
//		PrintWriter out = response.getWriter();
//		String file = "Gewinnerliste.pdf";
//		response.setContentType("APPLICATION/OCTET-STREAM");
//		response.setHeader("Content-Disposition", "attachment; filename=\""+file+"\"");
//		
//		FileInputStream fileInputStream = new FileInputStream(path+File.separator+file);
//		
//		int i;
//		while((i = fileInputStream.read()) != -1) {
//			out.write(i);
//		}
//		fileInputStream.close();
//		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
