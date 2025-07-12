<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
// Define filename and filepath
String filename =  request.getParameter("file");
String filepath = "C:\\Users\\kanus\\eclipse-workspace\\ELibrary\\src\\main\\webapp\\Books\\"; 

// Set response to download file
response.setContentType("APPLICATION/OCTET-STREAM"); 
response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\""); 

// Input stream for file reading
java.io.FileInputStream fileInputStream = new java.io.FileInputStream(filepath + filename);
// Read file content and stream it to the response output stream

int i; 
while ((i=fileInputStream.read()) != -1) {
  out.write(i); 

}
fileInputStream.close(); 

// Close the FileInputStream to release resources
%>
</body>
</html>