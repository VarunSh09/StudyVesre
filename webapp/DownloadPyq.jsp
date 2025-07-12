<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,Project.DataCon" %>
<%
String name = (String)session.getAttribute("username");
String dr = (String)session.getAttribute("dwd");
String path =request.getRequestURI();


%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Download Question Paper</title>

<!-- Add CSS for styling -->
<style>
    /* Body styling */
    body {
        font-family: Arial, sans-serif;
        background-color: #f7f7f7;
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
        font-size: 1.8rem;
        margin-bottom: 20px;
    }

    /* Flex container for iframe and button */
    .content-wrapper {
        display: flex;
        align-items: flex-start;
        justify-content: space-between;
        gap: 20px;
    }

    /* Styling for the iframe */
    iframe {
        width: 75%;
        height: 550px;
        border: none;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    /* Styling for the download button */
    .download-link {
        display: inline-block;
        text-decoration: none;
        background-color: #3498db;
        color: white;
        padding: 12px 25px;
        font-size: 1.1rem;
        border-radius: 5px;
        text-align: center;
        width: 20%;
        margin-top: 20px;
        transition: background-color 0.3s ease;
    }

    .download-link:hover {
        background-color: #2980b9;
    }

    /* Responsive design */
    @media screen and (max-width: 768px) {
        .container {
            width: 95%;
            padding: 15px;
        }

        h1 {
            font-size: 1.5rem;
        }

        .content-wrapper {
            flex-direction: column;
            align-items: center;
        }

        iframe {
            width: 100%;
            height: 400px;
        }

        .download-link {
            width: 100%;
            margin-top: 20px;
        }
    }
</style>

</head>
<body>

<div class="container">
    <% 
    int Id = Integer.parseInt(request.getParameter("id"));
    String file = null;
    Connection con = DataCon.getCon();
    PreparedStatement ps = con.prepareStatement("select * from QuestionPapers where Id=?");
    ps.setInt(1, Id);
    ResultSet rs = ps.executeQuery();
    if(rs.next()) { 
    %>
    
    <h1><%= rs.getString("University") %>: <%= rs.getString("Subject") %> Question Paper for <%= rs.getString("year") %></h1>
    
    <% 
        file = rs.getString("Pyq_file"); 
    } 
    %>

    <!-- Flex container for iframe and download button -->
    <div class="content-wrapper">
        <!-- Embed the question paper in an iframe -->
        <iframe src="PYQ/<%= file %>#toolbar=0"></iframe>
 <%if(name==null&& dr==null){ %>
        <!-- The download button aligned to the right of the iframe -->
                       <a href="DownloadDataSet.jsp?file=<%= file %>&page=<%=path %>&id=<%=Id %>" class="download-link">Download Question Paper</a>
               
       <% }else{%>
        <a href="PyqDownload.jsp?file=<%= file %>" class="download-link">Download Question Paper</a>
        
       <% }%>
        <!-- Download link -->
    </div>

</div>

</body>
</html>
