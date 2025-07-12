<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, Project.DataCon" %>
<% response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");


if(session.getAttribute("username") == null){
    response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Section</title>

    <!-- CSS Styles -->
    <style>
        /* Global Styles */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f7fc;
            color: #333;
        }

        .container {
            display: flex;
            flex-wrap: wrap;
            margin: 20px auto;
            max-width: 1200px;
        }

        /* Sidebar Styling */
        .sidebar {
            flex: 1;
            background-color: #2e3b4e;
            padding: 20px;
            color: white;
            min-width: 250px;
            max-width: 300px;
            margin-right: 20px;
        }

        .sidebar h2 {
            font-size: 22px;
            margin-bottom: 20px;
        }

        .section-item {
            background-color: #3b4c5a;
            padding: 12px;
            border-radius: 5px;
            margin-bottom: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .section-item:hover {
            background-color: #4b5c70;
        }

        .sidebar ul {
            list-style-type: none;
            padding-left: 0;
        }

        .sidebar ul li a {
            color: white;
            text-decoration: none;
            font-size: 16px;
        }

        /* Main Content Styling */
        .main-content {
            flex: 3;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            font-size: 28px;
            color: #2e3b4e;
            margin-bottom: 20px;
        }

        h4 {
            font-size: 24px;
            color: #4e5d6c;
            margin-bottom: 20px;
        }

        ul {
            padding-left: 20px;
        }

        li {
            margin-bottom: 10px;
        }

        li a {
            color: #007bff;
            text-decoration: none;
            font-size: 18px;
        }

        li a:hover {
            text-decoration: underline;
        }

        /* Video/iframe Styling */
        .media-container {
            margin-top: 30px;
        }

        video, iframe,img {
            width: 100%;
            max-width: 800px;
            height: 550px;
            border-radius: 8px;
            border: 1px solid #ddd;
            margin-bottom: 20px;
        }

        /* Make the page responsive */
        @media (max-width: 768px) {
            .container {
                flex-direction: column;
                align-items: center;
            }

            .sidebar {
                width: 100%;
                margin-right: 0;
                margin-bottom: 20px;
            }

            .main-content {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="Header.jsp"/>

<div class="container">
    <!-- Sidebar with Sections -->
    <div class="sidebar">
        <h2>Course: <%= request.getParameter("Course") %></h2>
        <h3>Contents</h3>
        <%
        int CourseId = Integer.parseInt(request.getParameter("Course_Id"));
        Connection con = DataCon.getCon();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM ec_Section WHERE c_id=?");
        PreparedStatement ps1 = con.prepareStatement("SELECT * FROM ec_lecture WHERE s_id=?");
        ps.setInt(1, CourseId);
        ResultSet rs = ps.executeQuery();
        ResultSet rs1 = null;
        
        while (rs.next()) {
            ps1.setInt(1, rs.getInt("s_id"));
            rs1 = ps1.executeQuery();
        %>
        
        <h4><%= rs.getString("Section") %></h4>
        <ul>
            <% while (rs1.next()) { %>
            <li>
                <a href="ESection.jsp?Lecture=<%= rs1.getString("lectures_files") %>&Course_Id=<%= request.getParameter("Course_Id") %>&Course=<%= request.getParameter("Course") %>">
                    <%= rs1.getString("Lecture") %>
                </a>
            </li>
            <% } %>
        </ul>
        <% } %>
    </div>

    <!-- Main Content Area -->
    <div class="main-content">
        <%
        String Lecture = request.getParameter("Lecture");
        if (Lecture != null && !Lecture.trim().isEmpty()) {
        %>
        <div class="media-container">
            <% if (Lecture.endsWith(".mp4")) { %>
                <video src="Lectures_File/<%= Lecture %>" controls controlsList="nodownload"></video>
            <% } else { %>
                <iframe src="Lectures_File/<%= Lecture %>#toolbar=0" frameborder="0" allowfullscreen></iframe>
            <% } %>
        </div>
        <%}else{String image =  request.getParameter("Images");%>
		 <img src="EImages/<%=image%>" alt="Image" width="600" height="400">

		<%} %>
    </div>
</div>
 <jsp:include page="Footer.jsp"/>

</body>
</html>
