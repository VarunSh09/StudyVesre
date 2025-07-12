<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection,java.sql.PreparedStatement,java.sql.ResultSet,java.sql.DriverManager"%>
<%@page import="Project.DataCon"%>
<% response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");

String name = (String)session.getAttribute("username");
String dr = (String)session.getAttribute("dwd");
String path =request.getRequestURI();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Books's Library</title>

<!-- CSS for styling the page -->
<style>
    /* General body styling */
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
    }
#Book{        background-color:#adaaaa;


}
    /* Header and navigation styling */
    header {
        background-color: #333;
        color: white;
        padding: 15px;
        text-align: center;
    }

    header h1 {
        font-size: 2.5rem;
        margin: 0;
    }

    /* Navigation Links styling */
    
    #tab{
   	 margin-top:20px;
   	 list-style-type: none; /* Remove the default bullet points */
		padding: 0;
    	text-align: center; /* Center the navigation items */
    	background-color: #007BFF; /* Set the background color for the navigation bar */
    }
    

/* Styling for each list item (li) */
#tab li {
    display: inline-block; /* Display list items inline */
    padding: 10px 20px; /* Add padding to each item */
}

/* Styling for links inside the list items (a) */
#tab li a {
    color: white; /* Set text color to white */
    text-decoration: none; /* Remove underline from the links */
    font-size: 1.1rem; /* Set font size */
}

/* Hover effect for the links */
#tab li a:hover {
    text-decoration: underline; /* Underline the text on hover */
    color: #e0e0e0; /* Slightly change text color on hover */
}
    /* Table styling */
    table {
        width: 80%;
        margin: 20px auto;
        border-collapse: collapse;
    }

    table th, table td {
        padding: 10px;
        text-align: left;
        border: 1px solid #ddd;
        font-size: 1.1rem;
    }

    table th {
        background-color: #f4f4f4;
        color: #333;
    }

    table td {
        background-color: #fff;
    }

    table tr:hover {
        background-color: #f1f1f1;
    }

    /* Book image styling */
    table img {
        border-radius: 8px;
        transition: transform 0.3s ease;
    }

    table img:hover {
        transform: scale(1.1);
    }

    /* Links as buttons */
    a.button {
        display: inline-block;
        padding: 10px 20px;
        background-color: #007BFF;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        text-align: center;
        font-weight: bold;
        transition: background-color 0.3s ease;
        cursor: pointer;
    }

    a.button:hover {
        background-color: #0056b3;
    }
 a.Dbutton {
        display: inline-block;
        padding: 10px 20px;
        background-color: #008000;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        text-align: center;
        font-weight: bold;
        transition: background-color 0.3s ease;
        cursor: pointer;
    }

    a.Dbutton:hover {
        background-color: #006400;
    }

    /* Responsive Design */
    @media screen and (max-width: 768px) {
        ul {
            padding: 0;
        }

        ul li {
            display: block;
            padding: 10px;
        }

        table {
            width: 90%;
            margin: 20px auto;
        }

        table th, table td {
            font-size: 0.9rem;
        }
    }
</style>

</head>
<body>

 <jsp:include page="Header.jsp"/>
 
<!-- Navigation links for subjects -->
<ul id="tab">
    <li><a href="Subject.jsp?Subject=Java">Java</a></li>
    <li><a href="Subject.jsp?Subject=C">C</a></li>
    <li><a href="Subject.jsp?Subject=CPP">C++</a></li>
    <li><a href="Subject.jsp?Subject=Math">Math</a></li>
</ul>

<% String sub = request.getParameter("Subject");
   if(sub == null) { %>
   
   <!-- Table to display the books -->
   <table>
       <thead>
           <tr>
               <th>Book Image</th>
               <th>Book Name</th>
               <th>View</th>
               <th>Download</th>
           </tr>
       </thead>
       <tbody>
           <%
           Connection con = DataCon.getCon();
           PreparedStatement ps = con.prepareStatement("select * from Books");
           ResultSet rs = ps.executeQuery();
           
           // Loop through the results and display them in table rows
           while(rs.next()) {
           %>
           <tr>
               <td id="Book"><img src="Images/<%=rs.getString("img_name")%>" alt="Book Image" width="150px" height="200px"></td>
               <td><%=rs.getString("name")%></td>
               <td><a href="Books.jsp?id=<%=rs.getInt("id") %>" class="button">View</a></td>
               <%if(name==null && dr==null){%>
            <td><a href="DownloadDataSet.jsp?file=<%=rs.getString("file_name")%>&page=<%=path %>" class="Dbutton">Download</a></td>
            	   
            	   
               <% } else{%>
               <td><a href="Download.jsp?file=<%=rs.getString("file_name")%>" class="Dbutton">Download</a></td>
           </tr>
           <%} } %>
       </tbody>
   </table>

<% } %>

</body>
        <%-- <jsp:include page="Footer.jsp"/> --%>

</html>
