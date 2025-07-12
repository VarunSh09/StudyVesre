<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Navigation</title>
<style>
/* Resetting default styles */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: Arial, sans-serif;
}

/* Navigation Bar Styling */
ul {
	list-style-type: none;
	display: flex;
	background-color: #d32f2f; /* Cherry red background */
	justify-content: center;
	padding: 0;
	margin: 20px 0;
	border-radius: 10px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}

li {
	flex: 1; /* Equal width for all tabs */
}

a {
	display: block;
	padding: 15px;
	text-align: center;
	text-decoration: none;
	color: white;
	font-weight: bold;
	transition: background-color 0.3s ease, color 0.3s ease;
}

/* Hover Effect */
a:hover {
	background-color: #f8bbd0; /* Light pink hover effect */
	color: #d32f2f; /* Cherry red text on hover */
}

/* Responsive Design */
@media ( max-width : 768px) {
	li {
		flex: none;
		width: 100%;
	}
}
</style>
</head>
<body>

	<ul>
		<li><a href="AdminHome.jsp" class="active">Home</a></li>
		<li><a href="UploadBooks.jsp">Books</a></li>
		<li><a href="UploadPyq.jsp">PYQs</a></li>
		<li><a href="AdminFeedback.jsp">FeedBack</a></li>
		<li><a href="AdminLogout">Logout</a></li>
	</ul>

</body>
</html>
