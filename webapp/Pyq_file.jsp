<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,Project.DataCon" %>
<% response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Pyq</title>

<!-- Add CSS for animation and styling -->
<style>
    /* Body styling */
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f4f8;
        margin: 0;
        padding: 0;
        color: #333;
    }
    
    /* Container for the content */
    .container {
        width: 80%;
        margin: 40px auto;
        padding: 30px;
        background-color: white;
        border-radius: 10px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    }
    
    /* Heading styling */
    h1 {
        text-align: center;
        color: #333;
        font-size: 2rem;
        margin-bottom: 20px;
    }
    
    /* Styling for each paper link container */
    .pyq-item {
        padding: 15px;
        background-color: #fff;
        border-radius: 8px;
        margin-bottom: 20px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .pyq-item:hover {
        transform: translateY(-5px);
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
    }
    
    /* Styling for the links */
    .download-link {
        text-decoration: none;
        color: #007BFF;
        font-weight: bold;
        font-size: 1.2rem;
        padding: 10px;
        border-radius: 5px;
        transition: background-color 0.3s ease, color 0.3s ease;
    }

    .download-link:hover {
        background-color: #007BFF;
        color: white;
    }
    
    /* Styling for the year label */
    .year {
        font-size: 1.5rem;
        color: #2c3e50;
    }
</style>

</head>
<body>
    <jsp:include page="Header.jsp"/>

<div class="container">
    <h1>Previous Year Question Papers</h1>

    <% 
    String University = request.getParameter("University");
    String Course = request.getParameter("Course");
    String Semester = request.getParameter("Semester");
    String Subject = request.getParameter("Subject");

    // Database connection and query execution
    Connection con = DataCon.getCon();
    PreparedStatement ps = con.prepareStatement("select * from QuestionPapers where University=? AND Course=? AND Semester=? AND Subject=?");
    ps.setString(1, University);
    ps.setString(2, Course);
    ps.setString(3, Semester);
    ps.setString(4, Subject);

    ResultSet rs = ps.executeQuery();

    // Loop through the results and display them
    while(rs.next()) { 
    %>

    <div class="pyq-item">
        <p class="year">Year: <%= rs.getString("Year") %></p>
        <a href="DownloadPyq.jsp?id=<%= rs.getInt("id") %>" class="download-link">Click here to download</a>
    </div>

    <% } %>

</div>

</body>
</html>
