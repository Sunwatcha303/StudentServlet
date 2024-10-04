<%@page import="java.util.List"%>
<%@page import="model.Student"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : student-list
    Created on : Oct 4, 2024, 4:16:14 PM
    Author     : sun watcha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Student List</h2>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>GPA</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Student> list = (List<Student>) request.getAttribute("list");
                    for (Student std : list) {
                        out.println("<tr>");
                        out.println("   <td>" + std.getId() + "</td>");
                        out.println("   <td>" + std.getName() + "</td>");
                        out.println("   <td>" + std.getGpa() + "</td>");
                        out.println("</tr>");
                    }
                %>
            </tbody>
        </table>
        <a href="index.html">Back to add student.</a>
    </body>
</html>
