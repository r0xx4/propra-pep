package download;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.log.SysoCounter;

import data_management.Driver;

/**
 * Servlet implementation class ProvideProjectFileDownload
 */
@WebServlet("/provide_project_file_download")
public class ProvideProjectFileDownload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProvideProjectFileDownload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Driver datenhaltung = new Driver();
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String file = "";
        String path;
		
		String query = request.getQueryString();
		String split1 = query.split("&")[0];
		String split2 = query.split("&")[1];
		String filetype = split1.split("=")[1];
		String team = split2.split("=")[1];
		String teamPath = "";
		System.out.println(filetype);
		System.out.println(team);
		
		if(filetype.equals("documentation")){
			file = "Bericht.pdf";
		}
		else if(filetype.equals("presentation")){
			file = "Praesentation.pdf";
		}
		else if(filetype.equals("poster")){
			file = "Poster.pdf";
		}
		else if(filetype.equals("summary")){
			file = "Zusammenfassung.pdf";
		}
		
		
		
		try {
			teamPath = datenhaltung.getSubCat("team", "teamname_ID", team, "projektpfad").get(0).get("projektpfad");
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.println(teamPath);
        path = "C:/data"+ teamPath +"/";
        System.out.println(path);
        response.setContentType("APPLICATION/OCTET-STREAM");
        response.setHeader("Content-Disposition", "attachment; filename=\""+file+"\"");

        try {
        	FileInputStream fileInputStream;
        	fileInputStream = new FileInputStream(path+file);
        	
        	int i;
            while((i = fileInputStream.read()) != -1) {
                out.write(i);
            }
            
            
            fileInputStream.close();
            out.close();
        }catch(FileNotFoundException e) {
        	
        }
        
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}