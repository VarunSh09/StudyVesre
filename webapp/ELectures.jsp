<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lectures</title>
</head>
<%
String Lecture = request.getParameter("Lecture");
%>
<body>

<%
if(Lecture==null){%>
	
<% }
else if(Lecture.endsWith(".mp4")){%>
	<video src="Lectures_File/<%=Lecture%>" controls height="400px" width="600" controls="controls" controlList="nodownload"></video>
	
<% }

else{%>
	<iframe src="Lectures_File/<%=Lecture%>" width="600" height="400"></iframe>
<% }

%>

</body>
</html>