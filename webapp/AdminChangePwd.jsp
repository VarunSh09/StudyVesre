<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
  response.setHeader("Pragma", "no-cache");%>
      <% if(session.getAttribute("username") == null){
        response.sendRedirect("Home.jsp");
    }%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Change Password</title>
    <style>
        /* General body styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f9f4; /* Light green background */
            margin: 0;
            padding: 0;
        }

        /* Container for the form */
        .form-container {
            max-width: 450px;
            margin: 50px auto;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Header styling */
        h1 {
            text-align: center;
            color: #28a745; /* Green color for the header */
            margin-bottom: 20px;
        }

        /* Label styling */
        label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-size: 1rem;
        }

        /* Input field styling */
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
            box-sizing: border-box;
        }

        /* Focused input field styling */
        input[type="text"]:focus, input[type="password"]:focus {
            border-color: #28a745;
            outline: none;
            background-color: #f0fdf0;
        }

        /* Submit button styling */
        input[type="submit"] {
            width: 100%;
            background-color: #28a745; /* Green background */
            color: white;
            border: none;
            padding: 12px 20px;
            font-size: 1rem;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        /* Submit button hover effect */
        input[type="submit"]:hover {
            background-color: #218838;
        }

        /* Error message styling */
        .error-message {
            color: red;
            font-size: 1rem;
            text-align: center;
            margin-top: 15px;
        }

        /* Responsive Design */
        @media (max-width: 600px) {
            .form-container {
                padding: 20px;
                margin: 10px;
            }

            h1 {
                font-size: 1.5rem;
            }
        }
    </style>

   
</head>
<body>
    <jsp:include page="AHeader.jsp"/>

    <div class="form-container">
        <h1>Update Password</h1>
        <form method="post" action="./UpdateAdminPwd" >
            <label for="Email">Email</label>
            <input type="text" value="<%=session.getAttribute("Uemail") %>" name="Email" readonly>

            <label for="Password">Password</label>
            <input type="password" name="Pwd" id="Password" required>


            <input type="submit" value="Update">
        </form>
    </div>
</body>
</html>
