<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Download Form</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f9;
        margin: 0;
        padding: 20px;
    }
    h1 {
        text-align: center;
        color: #333;
    }
    form {
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        max-width: 400px;
        margin: 0 auto;
    }
    label {
        display: block;
        margin: 10px 0 5px;
        font-weight: bold;
    }
    input[type="text"],
    input[type="email"],
    input[type="tel"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box; /* Includes padding in width */
    }
    input[type="submit"] {
        background-color: #007BFF;
        color: white;
        padding: 10px;
        width: 100%;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
    }
    input[type="submit"]:hover {
        background-color: #0056b3;
    }
    @media (max-width: 480px) {
        form {
            padding: 15px;
        }
    }
</style>
</head>
<body>

<h1>Download Form</h1>
<form action="./DownloadData" method="get">
    <input type="hidden" name="file" value="<%=request.getParameter("file") %>">
    <input type="hidden" name="page" value="<%=request.getParameter("page")%>">
    <input type="hidden" name="id" value="<%=request.getParameter("id")%>">

    <label for="DName">Name</label>
    <input type="text" id="DName" name="DName" required>

    <label for="Demail">Email</label>
    <input type="email" id="Demail" name="Demail" required>

    <label for="DCno">Contact No.</label>
    <input type="tel" id="DCno" name="DCno" pattern="[0-9]{3}[0-9]{2}[0-9]{5}" required>

    <input type="submit" value="Submit">
</form>
<p>or click here to<a href="login.jsp">Login</a></p>
</body>
</html>
