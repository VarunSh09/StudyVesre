<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <% response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Semester</title>

<!-- Add CSS here -->
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
        margin-top: 20px;
    }
    .container {
        width: 80%;
        margin: 30px auto;
        padding: 20px;
        background-color: white;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .semester-row {
        display: flex;
        flex-wrap: wrap;
        gap: 20px;
        justify-content: center;
    }
    .semester-box {
        width: calc(50% - 10px);
        background-color: #ffffff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        text-align: center;
        transition: transform 0.3s ease;
        box-sizing: border-box; /* Include padding in the width calculation */
    }
    .semester-box:hover {
        transform: translateY(-5px);
    }
    a {
        display: block;
        color: #007BFF;
        text-decoration: none;
        font-weight: bold;
        padding: 10px;
        border-radius: 5px;
        transition: background-color 0.3s;
    }
    a:hover {
        background-color: #007BFF;
        color: white;
    }
</style>
 
</head>
<body>
    <jsp:include page="Header.jsp"/>

<div class="container">
    <h1>Select Semester</h1>

    <div class="semester-row">
        <% 
        // Retrieve parameters for university and course
        String University = request.getParameter("University");
        String Course = request.getParameter("course");
        		
        
        %>

        <!-- Display semester links in boxes, two per row -->
        <div class="semester-box">
            <p><a href="Subject_pyq.jsp?Semester=1stsem&University=<%= University %>&Course=<%= Course %>">1st Semester</a></p>
        </div>
        
        <div class="semester-box">
            <p><a href="Subject_pyq.jsp?Semester=2ndsem&University=<%= University %>&Course=<%= Course %>">2nd Semester</a></p>
        </div>

        <div class="semester-box">
            <p><a href="Subject_pyq.jsp?Semester=3rdsem&University=<%= University %>&Course=<%= Course %>">3rd Semester</a></p>
        </div>
        
        <div class="semester-box">
            <p><a href="Subject_pyq.jsp?Semester=4thsem&University=<%= University %>&Course=<%= Course %>">4th Semester</a></p>
        </div>
                 <% if(!"MBA".equals(Course)) { %>
         
        <div class="semester-box">
            <p><a href="Subject_pyq.jsp?Semester=5thsem&University=<%= University %>&Course=<%= Course %>">5th Semester</a></p>
        </div>

        <div class="semester-box">
            <p><a href="Subject_pyq.jsp?Semester=6thsem&University=<%= University %>&Course=<%= Course %>">6th Semester</a></p>
        </div>

        <% if(Course.startsWith("B.Tech")) { %>
            <div class="semester-box">
                <p><a href="Subject_pyq.jsp?Semester=7thsem&University=<%= University %>&Course=<%= Course %>">7th Semester</a></p>
            </div>
            
            <div class="semester-box">
                <p><a href="Subject_pyq.jsp?Semester=8thsem&University=<%= University %>&Course=<%= Course %>">8th Semester</a></p>
            </div>
        <% } %>        <% } %>
        

    </div> <!-- End semester-row -->
</div> <!-- End container -->

</body>
</html>
