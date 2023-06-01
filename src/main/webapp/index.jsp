<%@page import="java.io.*"%>
<%@page import="java.util.Scanner"%>
<%@page import="java.util.Arrays"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<!--this jsp displays all the lists and allows you to click on them to edit-->
<head>
    <meta charset="UTF-8">
    <title>Lists</title>
    <jsp:include page="meta.jsp"/>
    <jsp:include page="sidebar.jsp"/>
</head>
<body>
<div class="container">
    <h1>Lists</h1>
    <%
        try {
            String path = getServletContext().getRealPath("/WEB-INF/myfile.txt");
            File file = new File(path);
            Scanner scanner = new Scanner(file);

            while (scanner.hasNextLine()) {
                String line = scanner.nextLine();
                String[] noteData = line.split(",");

                // Construct the comma-separated string of items
                String itemsStr = "";
                if (noteData.length > 2) {
                    itemsStr = String.join(",", Arrays.copyOfRange(noteData, 2, noteData.length));
                }

    %>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <a href="editlist.jsp?title=<%= noteData[0] %>&content=<%= noteData.length > 1 ? noteData[1] : "" %>&items=<%= itemsStr %>">
                            <%= noteData[0] %>
                        </a>
                    </div>
                    <div class="panel-body">
                        <%
                            if (noteData.length > 1) {
                        %>
                            <h4>Index:</h4>
                            <p><%= noteData[1] %></p>
                        <%
                            }
                            if (noteData.length > 2) {
                        %>
                            <h4>List:</h4>
                            <ul>
                                <% for (String item : Arrays.copyOfRange(noteData, 2, noteData.length)) { %>
                                <li><%= item %></li>
                                <% } %>
                            </ul>
                        <%
                            }
                        %>
                    </div>
                </div>
    <%
            }
            scanner.close();
        } catch (FileNotFoundException e) {
            out.println("Error: " + e.getMessage());
        }
    %>
</div>
</body>
</html>
