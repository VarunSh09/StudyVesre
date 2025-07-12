<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <style>
        /* General body styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        /* Centering the form and styling */
        form {
            max-width: 400px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }

        /* Header styling */
        h1 {
            text-align: center;
            color: #007BFF; /* Blue color for the header */
            margin-bottom: 20px;
        }

        /* Label styling */
        label {
            display: block;
            margin-top: 10px;
            color: #333;
            font-size: 1rem;
        }

        /* Input fields styling */
        input[type="email"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
            box-sizing: border-box;
        }

        /* Focused input fields styling */
        input[type="email"]:focus, input[type="password"]:focus {
            border-color: #007BFF;
            outline: none;
            background-color: #f0f8ff;
        }

        /* Submit button styling */
        input[type="submit"] {
            width: 100%;
            background-color: #007BFF; /* Blue background */
            color: white;
            border: none;
            padding: 10px;
            font-size: 1rem;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-top: 15px;
        }

        /* Change button color on hover */
        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        /* Styling for the links */
        span {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #333;
        }

        span a {
            color: #007BFF; /* Blue color for the links */
            text-decoration: none;
        }

        span a:hover {
            text-decoration: underline; /* Underline on hover */
        }

        /* Responsive Design */
        @media (max-width: 600px) {
            form {
                padding: 15px;
                margin: 20px;
            }
        }

        /* Error message styling */
        .error-message {
            color: red;
            font-size: 1rem;
            text-align: center;
            margin-top: 15px;
        }
    </style>
</head>
<body>
 
<h1>Login</h1>
<form method="post" action="./Login" onsubmit="return validatePasswords()">
<input type="hidden" value="<%=session.getAttribute("LStatus") %>" id="Msg">
    <label for="Uemail">Email</label>
    <input id="Uemail" name="Uemail" type="email" required>
    <br>
    <label for="Upassword">Password</label>
    <input id="Upassword" name="Upassword" type="password" required>
    <br>
    <input type="submit" value="Login">
</form>

<span>Forgot Password?<a href="ForgetPassword.jsp">Click Here</a></span><br>
<span>Don't have an account? <a href="SignUp.jsp">Sign Up</a></span>

<!-- Display error message if present -->

 <script>
    var status = document.getElementById("Msg").value;
    if(status == "False") {
        alert("User not Exists.");
    }
    </script>
</body>
</html>
<%session.removeAttribute("LStatus"); %>
