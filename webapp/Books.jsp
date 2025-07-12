<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection,java.sql.PreparedStatement,java.sql.ResultSet,java.sql.DriverManager"%>
<%@page import="Project.DataCon"%>
<%
String name = (String)session.getAttribute("username");
String dr = (String)session.getAttribute("dwd");
String path =request.getRequestURI();

%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Book Details</title>

<!-- CSS for styling the page -->
<style>
    /* General body styling */
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }

    /* Container for the content */
    .container {
        width: 80%;
        margin: 30px auto;
        background-color: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        text-align: center;
    }

    /* Heading styling */
    h1 {
        color: #333;
        font-size: 2rem;
        margin-bottom: 20px;
    }

    /* Styling for the iframe */
    iframe {
        width: 75%; /* Changed width to 75% so the button can sit on the right */
        height: 600px;
        border: none;
        display: inline-block;
        margin: 20px 10px 20px 0; /* Margin to allow space for the button */
    }

    /* Styling for the download button */
    .download-btn {
        display: inline-block;
        padding: 12px 20px;
        background-color: #007BFF;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        font-size: 1.2rem;
        transition: background-color 0.3s ease;
        text-align: center;
        align-self: center;
    }

    .download-btn:hover {
        background-color: #0056b3;
    }

    /* Flexbox container to align iframe and download button side by side */
    .iframe-container {
        display: flex;
        justify-content: space-between; /* Align items in space between layout */
        align-items: center;
        max-width: 1000px;
        margin: 20px auto;
    }

    /* Responsive design */
    @media (max-width: 768px) {
        .container {
            width: 95%;
        }

        iframe {
            width: 100%; /* Make iframe take full width on smaller screens */
            height: 400px;
        }

        h1 {
            font-size: 1.5rem;
        }
    }
</style>

</head>
<body>

<% 
    Connection con = DataCon.getCon();
    PreparedStatement ps = con.prepareStatement("select * from Books where id=?");
    int book_id = Integer.parseInt(request.getParameter("id"));
    ps.setInt(1, book_id);
    ResultSet rs = ps.executeQuery();
    if(rs.next()) {
%>

<!-- Container for the book details -->
<div class="container">
    <h1>Subject: <%= rs.getString("subject") %></h1>
    <h1><%= rs.getString("name") %></h1>

    <!-- Flexbox container for iframe and download button -->
    <div class="iframe-container">
        <!-- The iframe for displaying the book content -->
        <iframe src="Books/<%= rs.getString("file_name") %>#toolbar=0"></iframe> 
           <%if(name==null&& dr==null){ %>
        <!-- The download button aligned to the right of the iframe -->
                <a href="DownloadDataSet.jsp?file=<%= rs.getString("file_name") %>&page=<%=path %>&id=<%=book_id %>" class="download-btn">Download</a>
        
       <% }else{ %>
        <a href="Download.jsp?file=<%= rs.getString("file_name") %>" class="download-btn">Download</a>
        
    </div>
</div>

<% 
    }}
%>

</body>
</html>
