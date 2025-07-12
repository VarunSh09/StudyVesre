<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
  response.setHeader("Pragma", "no-cache");%>
      <% if(session.getAttribute("username") == null){
        response.sendRedirect("Home.jsp");
    }%>
<%
int id=0;
try{ 
    id = (int)session.getAttribute("Uid");
} catch(Exception e){
    e.printStackTrace();
} 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Feedback</title>
<style>
    /* General body styling */
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
        color: #333;
    }

    /* Header styles */
    h1 {
        background-color: #4CAF50;
        color: white;
        padding: 20px;
        text-align: center;
        margin: 0;
    }

    /* Form container styling */
    .form-container {
        width: 60%;
        margin: 50px auto;
        padding: 30px;
        background-color: white;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    /* Form label styling */
    label {
        font-size: 18px;
        margin: 10px 0;
        display: block;
        font-weight: bold;
    }

    /* Form input field styling */
    input[type="text"], textarea {
        width: 100%;
        padding: 10px;
        margin: 10px 0 20px 0;
        border: 1px solid #ddd;
        border-radius: 4px;
        font-size: 16px;
    }

    /* Submit button styling */
    input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        font-size: 18px;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover {
        background-color: #45a049;
    }

    /* Textarea resizing and appearance */
    textarea {
        font-size: 16px;
        height: 200px;
        resize: vertical; /* Allows vertical resizing */
    }

    /* Responsive design for smaller screens */
    @media (max-width: 768px) {
        .form-container {
            width: 90%;
            padding: 20px;
        }

        input[type="text"], textarea {
            font-size: 14px;
        }

        input[type="submit"] {
            font-size: 16px;
            padding: 8px 16px;
        }
    }
</style>
</head>
<body>

<jsp:include page="AHeader.jsp"/>

<!-- Form container -->
<div class="form-container">
    <form action="./Feedback" method="post">
        <label>Student Id</label>
        <input type="text" value="<%= id %>" readonly>

        <label>Write Feedback:</label>
        <textarea rows="20" cols="100" name="feedback" required></textarea><br>

        <input type="submit" value="Submit" name="update">
    </form>
</div>

</body>
</html>
