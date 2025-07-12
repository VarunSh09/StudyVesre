<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
   response.setHeader("Pragma", "no-cache");
   response.setHeader("Expires", "0");

   if ((String) session.getAttribute("AdminCreds") == null) {
       response.sendRedirect("AdminLogin.jsp");
   }
%>
<%@ page import="java.sql.*, Project.DataCon"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Panel</title>
<style>
/* Resetting default styles */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: Arial, sans-serif;
	padding: 20px;
}

/* Admin Panel Header */
h1 {
	text-align: center;
	color: #d32f2f; /* Cherry red */
	margin-bottom: 20px;
}

/* Colored Box for h2 Elements */
h2 {
	background-color: #d32f2f; /* Cherry red */
	color: white;
	padding: 15px;
	border-radius: 8px;
	text-align: center;
	margin: 15px 0;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

/* Table Styling */
table {
	width: 100%;
	border-collapse: collapse;
	margin: 20px 0;
	background-color: white;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

th, td {
	padding: 12px 15px;
	text-align: center;
	border: 1px solid #ddd;
}

th {
	background-color: #d32f2f; /* Cherry red */
	color: white;
}

tr:nth-child(even) {
	background-color: #ffe4e1; /* Light pink */
}

tr:hover {
	background-color: #f8bbd0; /* Soft pink hover */
}

/* Responsive Design */
@media ( max-width : 768px) {
	table, h2 {
		font-size: 14px;
	}
}
</style>
</head>
<body>

	<jsp:include page="AdminNav.jsp" />

	<%
    int Student = 0, course = 0;
    Connection con = DataCon.getCon();
    PreparedStatement ps = con.prepareStatement("SELECT count(*) AS stud FROM users");
    ResultSet rs = ps.executeQuery();
    PreparedStatement ps1 = con.prepareStatement("SELECT count(*) AS Course FROM ecourses");
    ResultSet rs1 = ps1.executeQuery();
    if (rs.next() && rs1.next()) {
        Student = rs.getInt("stud");
        course = rs1.getInt("Course");
    }
%>

	<h1>Admin Panel</h1>

	<!-- Colored Boxes for Student and Course Counts -->
	<h2>
		Total Users:
		<%= Student %></h2>
	<h2>
		Total Courses:
		<%= course %></h2>

	<%
    PreparedStatement ps2 = con.prepareStatement("SELECT * FROM users");
    ResultSet rs2 = ps2.executeQuery();
%>

	<!-- User Table -->
	<table>
		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Role</th>
			<th>Institute</th>
			<th>Email</th>
		</tr>
		<% while (rs2.next()) { %>
		<tr>
			<td><%= rs2.getInt("id") %></td>
			<td><%= rs2.getString("name") %></td>
			<td><%= rs2.getString("RoleId") %></td>
			<td><%= rs2.getString("Institute") %></td>
			<td><%= rs2.getString("email") %></td>
		</tr>
		<% } %>
	</table>

</body>
</html>
<%
%>
