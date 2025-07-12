<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
   response.setHeader("Pragma", "no-cache");
   response.setHeader("Expires", "0");

   if (session.getAttribute("AdminCreds") == null) {
       response.sendRedirect("AdminLogin.jsp");
   }
%>
<%
    String message = (String) session.getAttribute("response");
    String msg = null;
    String Fmsg = (String) session.getAttribute("msg");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload Books</title>
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

/* Form Container */
form {
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	max-width: 500px;
	margin: 0 auto;
}

/* Heading Style */
h1 {
	text-align: center;
	color: #d32f2f; /* Cherry red */
	background-color: #ffccd2; /* Light pinkish cherry background */
	padding: 15px 0;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 20px;
}

label {
	display: block;
	margin-bottom: 8px;
	font-weight: bold;
	color: #d32f2f; /* Cherry red text */
}

select, input[type="text"], input[type="file"] {
	width: 100%;
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #d32f2f; /* Cherry red border */
	border-radius: 4px;
	background-color: #ffe4e1; /* Light pink background */
}

input[type="submit"] {
	background-color: #d32f2f; /* Cherry red */
	color: white;
	border: none;
	padding: 10px 20px;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

input[type="submit"]:hover {
	background-color: #b71c1c; /* Darker cherry red on hover */
}

/* Error Message Styling */
h3 {
	color: red;
	text-align: center;
	margin-top: 10px;
	text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.3);
}

/* Success Message Styling */
h3.success {
	color: green;
	text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.2);
}

/* Responsive Design */
@media ( max-width : 600px) {
	form {
		padding: 15px;
	}
	label, select, input[type="text"], input[type="file"] {
		font-size: 14px;
	}
}
</style>
</head>
<body>

	<jsp:include page="AdminNav.jsp" />

	<h1>Upload Books</h1>

	<form method="post" action="UploadBooks" enctype="multipart/form-data">
		<label>Select Subject</label> <select name="Subject" required>
			<option value="" disabled selected>Select Subject</option>
			<option value="Java">Java</option>
			<option value="C">C</option>
			<option value="CPP">C++</option>
			<option value="Math">Math</option>
		</select> <label>Name</label> <input type="text" name="Bname" required>

		<label>Upload Book (PDF)</label> <input type="file" name="files"
			accept=".pdf" required /> <label>Upload Book Image</label> <input
			type="file" name="imgs" accept="image/*" required /> <input
			type="submit" value="Upload" />
	</form>

	<%
    if ("False".equals(message)) {
        msg = "Please enter the book in PDF format";
%>
	<h3><%= msg %></h3>
	<%
    } 
    if ("up".equals(Fmsg)) {
%>
	<h3 class="success">File uploaded successfully.</h3>
	<%
    }
%>

	<%
    session.removeAttribute("response");
    session.removeAttribute("msg");
%>

</body>
</html>
