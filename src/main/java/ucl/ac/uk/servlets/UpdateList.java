package ucl.ac.uk.servlets;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Scanner;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//this is the code which updates the existing list
@WebServlet("/updatelist")
public class UpdateList extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        String title = request.getParameter("title");
        String index = request.getParameter("index");
        String[] existingitems = request.getParameterValues("items");
        String[] items = request.getParameterValues("item[]");
        String noteData = "";
        if (items != null){
            noteData = title + "," + index + "," + String.join(",", existingitems) + "," + String.join(",", items) + "\n";
        }
        else{
            noteData = title + "," + index + "," + String.join(",", existingitems) + "\n";

        }

        String path = getServletContext().getRealPath("/WEB-INF/myfile.txt");
        File file = new File(path);
        Scanner scanner = new Scanner(file);
        StringBuilder fileContentBuilder = new StringBuilder();

        boolean foundIndex = false;
        while (scanner.hasNextLine()) {
            String line = scanner.nextLine();
            String[] parts = line.split(",");
            if (parts.length >= 2 && parts[1].equals(index)) {
                fileContentBuilder.append(noteData);
                foundIndex = true;
            } else {
                fileContentBuilder.append(line).append("\n");
            }
        }
        scanner.close();

        if (!foundIndex) {
            fileContentBuilder.append(noteData);
        }

        FileWriter writer = new FileWriter(file);
        writer.write(fileContentBuilder.toString());
        writer.close();

        response.sendRedirect("/index.jsp");
    }
}
