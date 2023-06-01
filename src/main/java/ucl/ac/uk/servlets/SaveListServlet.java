package ucl.ac.uk.servlets;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//this is the code which saves the list to a text file
@WebServlet("/savelist")
public class SaveListServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();


        String title = request.getParameter("title");
        String index = request.getParameter("index");

        String[] items = request.getParameterValues("item[]");
        String noteData = "";

        if (items != null){
            noteData = title + "," + index + "," + String.join(",", items) + "\n";
        }
        else{
            noteData = title + "," + index + "\n";
        }

        String path = getServletContext().getRealPath("/WEB-INF/myfile.txt");
        File file = new File(path);

        FileWriter writer = new FileWriter(file, true);
        writer.write(noteData);
        writer.close();

        response.sendRedirect("/index.jsp");


    }
}
