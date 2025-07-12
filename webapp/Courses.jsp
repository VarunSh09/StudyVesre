<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,Project.DataCon" %>
<% response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Courses</title>
<style>
/* Basic body styling */
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
    color: #333;
}

/* Container for courses list */
.container {
    width: 80%;
    margin: 30px auto;
    padding: 20px;
    background-color: white;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

/* Heading styling */
h1 {
    text-align: center;
    color: #2c3e50;
    margin-bottom: 30px;
}

/* Flexbox styling to display courses in two boxes per row */
.course-row {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    justify-content: center;
}

/* Styling for individual course boxes */
.course-box {
    width: calc(50% - 10px); /* Take 50% width minus the gap */
    background-color: #ffffff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease;
    box-sizing: border-box; /* Include padding in the width calculation */
}

/* Hover effect for course boxes */
.course-box:hover {
    transform: translateY(-5px);
}

/* Button style */
button {
    display: inline-block;
    background-color: #3498db;
    color: white;
    text-decoration: none;
    padding: 12px 25px;
    font-size: 16px;
    border-radius: 5px;
    text-align: center;
    cursor: pointer;
    transition: background-color 0.3s ease;
    border: none;
    width: 100%;
}

button:hover {
    background-color: #2980b9;
}
</style>
</head>
<body>
    <jsp:include page="Header.jsp"/>

<div class="container">
    <h1>Available Courses</h1>
    
    <div class="course-row">
        <%
        String University = request.getParameter("University");
        Connection con = DataCon.getCon();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM University_course WHERE University=?");
        ps.setString(1, University);
        ResultSet rs = ps.executeQuery();
        
        while(rs.next()) {
        %>
        
        <div class="course-box">
            <p>
                <a href="Semester.jsp?course=<%= rs.getString("Course") %>&University=<%= University %>">
                    <button><%= rs.getString("Course") %></button>
                </a>
            </p>
        </div>

        <% } %>
    </div>
</div>

</body>
</html>
