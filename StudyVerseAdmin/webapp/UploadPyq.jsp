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
    String msg = (String) session.getAttribute("msg");
    String message = (String) session.getAttribute("response1");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload PYQs</title>
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

h1 {
	text-align: center;
	color: #d32f2f; /* Cherry red */
	background-color: #ffccd2; /* Light pinkish cherry */
	padding: 15px 0;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 20px;
}

/* Form Container */
form {
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	max-width: 600px;
	margin: 0 auto;
}

label {
	display: block;
	margin: 10px 0 5px;
	color: #d32f2f; /* Cherry red */
	font-weight: bold;
}

input[type="text"], select, input[type="file"] {
	width: 100%;
	padding: 10px;
	margin: 8px 0;
	border: 1px solid #d32f2f; /* Cherry red border */
	border-radius: 5px;
	background-color: #ffe4e1; /* Light pink */
	font-size: 14px;
}

input[type="submit"] {
	background-color: #d32f2f; /* Cherry red */
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 5px;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

input[type="submit"]:hover {
	background-color: #b71c1c; /* Darker cherry red on hover */
}

/* Feedback Messages */
h3 {
	text-align: center;
	margin-top: 15px;
	font-weight: bold;
}

h3.success {
	color: green;
	text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.2);
}

h3.error {
	color: red;
	text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.3);
}

/* Responsive Design */
@media ( max-width : 768px) {
	form {
		padding: 15px;
		width: 90%;
	}
	input[type="text"], select, input[type="file"] {
		font-size: 16px;
	}
}
</style>
</head>
<body>

	<jsp:include page="AdminNav.jsp" />

	<h1>Upload PYQs</h1>

	<form method="post" action="UploadPyqs" enctype="multipart/form-data">
		<label>Select University</label> <select name="University" required>
			<option value="" disabled selected>Select University</option>
			<option value="Gndu">Guru Nanak Dev University</option>
			<option value="PTU">I.K. GUJRAL PUNJAB TECHNICAL UNIVERSITY</option>
			<option value="LPU">Lovely Professional University</option>
			<option value="PU">Punjab University</option>
			<option value="CU">Chandigarh University</option>
			<option value="TIET">Thapar Institute of Engineering &
				Technology</option>
			<option value="NITJ">Dr B R Ambedkar National Institute of
				Technology</option>

		</select> <label>Select Course</label> <select name="Course" required>
			<option value="" disabled selected>Select Course</option>
			<option value="Bcom">Bcom</option>
			<option value="BCA">BCA</option>
			<option value="BBA">BBA</option>
			<option value="BSC-IT">BSC-IT</option>
			<option value="B.Tech Electronics and Computer Engineering">B.Tech
				Electronics and Computer Engineering</option>
			<option value="B.Tech Biotechnology">B.Tech Biotechnology</option>

		</select> <label>Select Semester</label> <select name="Semester" required>
			<option value="" disabled selected>Select Semester</option>
			<option value="1stsem">1st Semester</option>
			<option value="2ndsem">2nd Semester</option>
			<option value="3rdsem">3rd Semester</option>
			<option value="4thsem">4th Semester</option>
			<option value="5thsem">5th Semester</option>
			<option value="6thsem">6th Semester</option>
			<option value="7thsem">7th Semester</option>
			<option value="8thsem">8th Semester</option>
		</select> <label>Subject</label> <input type="text" name="Sname" required>

		<label>Select Year</label> <select name="year" required>
			<option value="2025" selected>2025</option>
			<option value="2024">2024</option>
			<option value="2023">2023</option>
			<option value="2022">2022</option>
			<option value="2021">2021</option>
			<option value="2020">2020</option>
			<option value="2019">2019</option>
			<option value="2018">2018</option>
			<option value="2017">2017</option>
			<option value="2016">2016</option>
			<option value="2015">2015</option>
		</select> <label>Upload File</label> <input type="file" name="files"
			accept=".pdf" required /> <input type="submit" value="Upload" />
	</form>

	<%
    if (msg != null && msg.equals("up")) {
%>
	<h3 class="success">File uploaded successfully.</h3>
	<%
    }

    if (message != null && message.equals("False")) {
%>
	<h3 class="error">Please enter the File in PDF format.</h3>
	<%
    }
%>

	<%
    session.removeAttribute("msg");
    session.removeAttribute("response1");
%>

</body>
</html>
