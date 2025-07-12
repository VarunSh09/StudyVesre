<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.sql.Connection,java.sql.PreparedStatement,java.sql.ResultSet,java.sql.DriverManager"  %>
<%@page import="Project.DataCon"  %>
<% response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");

String name = (String)session.getAttribute("username");
String dr = (String)session.getAttribute("dwd");
String path =request.getRequestURI();

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Books List</title>
    <style>
        #viewbutton {
            background-color: #007bff; /* Blue color */
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            margin: 5px;
            display: inline-block;
            font-size: 16px;
        }
        #viewbutton:hover {
            background-color: #0056b3; /* Darker blue on hover */
        } #downloadbutton {
            background-color: #008000; /* Blue color */
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            margin: 5px;
            display: inline-block;
            font-size: 16px;
        }
        #downloadbutton:hover {
            background-color: #006400; /* Darker blue on hover */
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {            
        
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        img {
            border-radius: 5px;
        }
        #book{
        
        }
    </style>
</head>
<body>
<jsp:include page="LibraryBook.jsp"/>
<% 
String sub = request.getParameter("Subject"); 
if(sub!=null){
%>

<h1><%=sub %></h1>

<table >
  <%}
  Connection con = DataCon.getCon();
  PreparedStatement ps = con.prepareStatement("select * from Books where subject=?");
  ps.setString(1, sub);
  ResultSet rs = ps.executeQuery();

  while (rs.next()) {
  %>
  <tr >
    <th><img alt="Images" src="Images/<%=rs.getString("img_name") %>" width="200px" height="200px"></th>
    <td><%=rs.getString("name") %></td>
    <td>
        <a href="Books.jsp?id=<%=rs.getInt("id") %>" id="viewbutton">View</a>
    </td>
    <%if(name==null && dr==null){%>
    	  <td>
        <a href="DownloadDataSet.jsp?file=<%=rs.getString("file_name") %>&page=<%=path %>" id="downloadbutton">Download</a>
    </td>
    	
    <%}else{
    
    %>
    <td>
        <a href="Download.jsp?file=<%=rs.getString("file_name") %>" id="downloadbutton">Download</a>
    </td>
  </tr>
  <%
  }}
  %>
</table>

</body>
 <jsp:include page="Footer.jsp"/>
</html>
