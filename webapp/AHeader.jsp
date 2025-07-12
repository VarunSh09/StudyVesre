<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import= "Project.DataCon" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Panel</title>
    <style>
        /* General body styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            color: #333;
        }

        /* Navbar styles for h1 */
        h1 {
            background-color: #4CAF50;
            color: white;
            padding: 20px;
            text-align: center;
            margin: 0;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 999;
        }

        /* Tab menu styling */
        ul {
            list-style-type: none;
            padding: 0;
            margin: 70px 0 0 0; /* Adjusted for the height of the navbar */
            display: flex;
            justify-content: center; /* Center align the menu items */
            background-color: #333;
            width: 100%;
        }

        ul li {
            display: inline-block;
        }

        ul li a {
            color: white;
            text-decoration: none;
            font-size: 18px;
            padding: 15px 30px;
            display: block;
            background-color: #555;
            border-right: 1px solid #444;
            transition: background-color 0.3s ease;
        }

        ul li a:hover {
            background-color: #4CAF50;
        }

        /* Active tab styling */
       

        /* Content area */
        .content {
            margin-top: 120px; /* Adjust for the fixed navbar and tab menu */
            padding: 20px;
        }

        /* Profile image styling */
        .img-container {
            text-align: center;
            margin-top: 50px;
        }

        .img-container img {
            border-radius: 50%;
            border: 2px solid #4CAF50;
            height: 100px;
            width: 100px;
        }

    </style>
</head>
<body>
    <h1>User Panel</h1>

    <% 
    String img = "pro.png";
    Connection con = DataCon.getCon();
    PreparedStatement ps = con.prepareStatement("select * from Images where Uid=?");
   try{  ps.setInt(1, (int) session.getAttribute("Uid"));
   
    ResultSet rs = ps.executeQuery();
    if(rs.next()) {
        img = rs.getString("img_name");
        session.setAttribute("Userimage",img);
    }}
   catch(Exception e)
   {System.out.println(e);}
    %>

    <!-- Tab menu -->
    <ul>
        <li><a href="Dashboard.jsp" class="active">Profile</a></li>
        <li><a href="MyCourses.jsp">My Courses</a></li>
        <li><a href="Feedback.jsp">Feedback</a></li>
        <li><a href="AdminChangePwd.jsp">Change Password</a></li>
        <li><a href="Logout">Logout</a></li>
    </ul>

    <!-- Main content area -->
    <div class="content">
        <div class="img-container">
            <img src="UserImages/<%= img %>" alt="Profile Image">
        </div>
    </div>
</body>
</html>
