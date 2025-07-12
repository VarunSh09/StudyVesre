<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Project.DataCon"%>
<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
   response.setHeader("Pragma", "no-cache");
   response.setHeader("Expires", "0");

   if (session.getAttribute("AdminCreds") == null) {
       response.sendRedirect("AdminLogin.jsp");
   }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Feedback</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 20px;
}

h1 {
	color: #d32f2f; /* Cherry red */
	text-align: center;
	margin-bottom: 20px;
	background-color: #ffccd2; /* Light pinkish cherry */
	padding: 15px;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

table {
	width: 90%;
	margin: 0 auto;
	border-collapse: collapse;
	background-color: #fff;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
	overflow: hidden;
}

th, td {
	padding: 12px 15px;
	text-align: center;
	border: 1px solid #d32f2f; /* Cherry red border */
}

th {
	background-color: #d32f2f; /* Cherry red */
	color: white;
}

tr:nth-child(even) {
	background-color: #ffe4e1; /* Light pink */
}

tr:nth-child(odd) {
	background-color: #fff; /* White */
}

tr:hover {
	background-color: #ffccd2; /* Light pinkish cherry on hover */
}

/* Responsive Design */
@media ( max-width : 600px) {
	table {
		width: 100%;
	}
}
</style>
</head>
<body>
	<jsp:include page="AdminNav.jsp" />

	<h1>User Feedback</h1>

	<%
        Connection con = DataCon.getCon();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM feedback");
        ResultSet rs = ps.executeQuery();
    %>

	<table>
		<tr>
			<th>Feedback ID</th>
			<th>User ID</th>
			<th>Feedback</th>
		</tr>
		<% while (rs.next()) { %>
		<tr>
			<td><%= rs.getInt("id") %></td>
			<td><%= rs.getInt("uid") %></td>
			<td><%= rs.getString("feedback") %></td>
		</tr>
		<% } %>
	</table>
</body>
</html>
