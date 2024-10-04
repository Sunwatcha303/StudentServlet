<%-- 
    Document   : result
    Created on : Oct 4, 2024, 4:00:41 PM
    Author     : sun watcha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:useBean id="student" scope="page" class="model.Student" />
        <jsp:setProperty name="student" property="id" param="id-input"/>
        <jsp:setProperty name="student" property="name" param="name-input"/>
        <jsp:setProperty name="student" property="gpa" param="gpa-input"/>

    </head>
    <body>
        <h1>Id: <jsp:getProperty name="student" property="id" /> </h1>        
        <h1>Name: <jsp:getProperty name="student" property="name" /></h1>
        <h1>Gpa: <jsp:getProperty name="student" property="gpa" /></h1>
        <h1>is added</h1>
        <%@include file="student-list.jsp" %>
    </body>
</html>
