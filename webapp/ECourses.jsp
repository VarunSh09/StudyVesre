<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,Project.DataCon" %>
<% response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Courses</title>
    <style>
        /* General body and page styling */
        body {
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            font-family: Arial, sans-serif;
        }

        h1 {
            text-align: center;
            margin-top: 20px;
            color: #333;
            font-size: 2.5em;
        }

        /* Container for the courses */
        .course-container {
            width: 90%;
            margin: 30px auto;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            gap: 20px;
        }

        /* Styling for each course item (similar to a product in a shopping cart) */
        .course-item {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin: 20px;
            padding: 20px;
            width: 30%;
            text-align: center;
            transition: transform 0.3s ease;
            overflow: hidden;
            border: 1px solid #ddd;
        }

        /* Hover effect for course items */
        .course-item:hover {
            transform: scale(1.05);
        }

        /* Styling for course images */
        .course-item img {
            max-width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 8px;
        }

        /* Styling for the course title */
        .course-item h3 {
            color: #333;
            font-size: 1.5em;
            margin: 10px 0;
        }

        /* Styling for the course description */
        .course-item p {
            color: #666;
            font-size: 1em;
            margin-bottom: 10px;
        }

        /* Styling for the "Enroll" button */
        .course-item a.enroll-btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 10px;
            transition: background-color 0.3s ease;
        }

        /* Enroll button hover effect */
        .course-item a.enroll-btn:hover {
            background-color: #0056b3;
        }

        /* Styling for the course details */
        .course-details {
            font-size: 0.9em;
            color: #777;
            margin-top: 10px;
        }
    </style>
</head>
<body>

    <jsp:include page="Header.jsp"/>

    <h1>All Courses</h1>

    <div class="course-container">
        <%
        Connection con = DataCon.getCon();
        PreparedStatement ps = con.prepareStatement("select * from Ecourses");
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
        %>
            <div class="course-item">
                <!-- Course Image -->
                <a href="Enroll?cid=<%= rs.getInt("c_id") %>&Course=<%= rs.getString("Course") %>&Images=<%=rs.getString("Img_file")%>">
                    <img src="EImages/<%= rs.getString("Img_file") %>" alt="<%= rs.getString("Course") %>">
                </a>
                <!-- Course Title -->
                <h3><%= rs.getString("Course") %></h3>
                <!-- Course Description -->
                <p><%= rs.getString("Description") %></p>
                <!-- Author Information -->
                <div class="course-details">
                    <p>By: <%= rs.getString("Author") %></p>
                </div>
                <!-- Enroll Button -->
                <a href="Enroll?cid=<%= rs.getInt("c_id") %>&Course=<%= rs.getString("Course") %>&Images=<%=rs.getString("Img_file")%>" class="enroll-btn">Enroll</a>
            </div>
        <% } %>
    </div>
 <jsp:include page="Footer.jsp"/>

</body>
</html>
