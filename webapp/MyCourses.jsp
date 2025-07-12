<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,Project.DataCon,java.util.ArrayList" %>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");

    // Session Validation
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("Home.jsp");
        return; // Prevent further execution
    }

    int id = 0;
    try {
        id = (int) session.getAttribute("Uid");
    } catch (Exception e) {
        e.printStackTrace();
    }

    Connection con = DataCon.getCon();
    PreparedStatement ps1 = con.prepareStatement("SELECT * FROM mycourse WHERE uid = ?");
    ps1.setInt(1, id);
    ResultSet rs1 = ps1.executeQuery();

    ArrayList<Integer> courseIds = new ArrayList<Integer>();
    while (rs1.next()) {
        courseIds.add(rs1.getInt("cid"));
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Courses</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .course-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 20px;
        }
        .course-item {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 250px;
            padding: 15px;
            text-align: center;
            transition: transform 0.3s ease;
        }
        .course-item:hover {
            transform: scale(1.05);
        }
        .course-item img {
            width: 100%;
            height: auto;
            border-radius: 8px;
        }
        .course-item h3 {
            color: #333;
            font-size: 18px;
            margin-top: 10px;
        }
        .course-item p {
            color: #777;
            font-size: 14px;
            margin: 10px 0;
        }
        .start-button {
            background-color: #28a745;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            font-size: 16px;
        }
        .start-button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <jsp:include page="AHeader.jsp" />

    <%
        if (courseIds.isEmpty()) {
    %>
        <h2 style="text-align: center; color:Pink;">You are not enrolled in any courses.</h2>
    <%
        } else {
            for (int courseId : courseIds) {
                PreparedStatement ps = con.prepareStatement("SELECT * FROM Ecourses WHERE c_id = ?");
                ps.setInt(1, courseId);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
    %>
                    <div class="course-container">
                        <div class="course-item">
                            <a href="ESection.jsp?Course_Id=<%= rs.getInt("c_id") %>&Course=<%= rs.getString("Course") %>&Images=<%= rs.getString("Img_file") %>">
                                <img src="EImages/<%= rs.getString("Img_file") %>" alt="<%= rs.getString("Course") %>">
                            </a>
                            <h3><%= rs.getString("Course") %></h3>
                            <p><%= rs.getString("Description") %></p>
                            <p><strong>Author:</strong> <%= rs.getString("Author") %></p>
                            <a href="ESection.jsp?Course_Id=<%= rs.getInt("c_id") %>&Course=<%= rs.getString("Course") %>&Images=<%= rs.getString("Img_file") %>" class="start-button">Start</a>
                        </div>
                    </div>
    <%
                }
                rs.close();
                ps.close();
            }
        }
        con.close();
    %>
</body>
</html>
