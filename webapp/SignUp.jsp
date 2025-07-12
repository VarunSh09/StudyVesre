<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <style>
        /* General body styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* Centering the form and styling */
        form {
            width: 100%;
            max-width: 400px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            font-size: 1rem;
        }

        /* Header styling */
        h1 {
            text-align: center;
            color: #007BFF; /* Blue color for the header */
        }

        /* Label styling */
        label {
            display: block;
            margin-bottom: 10px;
            color: #333;
            font-size: 1rem;
        }

        /* Input fields styling */
        input[type="text"], input[type="email"], input[type="password"], select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
        }

        /* Submit button styling */
        input[type="submit"] {
            background-color: #007BFF; /* Blue background */
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 1rem;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        /* Change button color on hover */
        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        /* Styling for the link to Login */
        span {
            display: block;
            text-align: center;
            margin-top: 20px;
        }

        span a {
            color: #007BFF; /* Blue color for the link */
            text-decoration: none;
        }

        span a:hover {
            text-decoration: underline; /* Underline on hover */
        }

        /* Responsive styling */
        @media (max-width: 600px) {
            form {
                padding: 15px;
                margin: 20px;
            }
        }
    </style>
   
</head>
<body>
<input type="hidden" value="<%=session.getAttribute("SStatus") %>" id="Msg">
    <form method="post" action="./SignUp">
        <h1>Sign Up</h1>
        <label for="Uname">Name</label>
        <input type="text" id="Uname" name="Uname" required>

        <label for="Uroles">Role Id</label>
        <select id="Uroles" name="Uroles" required>
            <option value="" disabled selected>Select role id</option>
            <option value="Student">Student</option>
            <option value="Teacher">Teacher</option>
        </select>

        <label for="UInstitute">College/University/Institute</label>
        <select id="UInstitute" name="UInstitute" required>
            <option value="" disabled selected>Select College/University/Institute</option>
            <option value="Guru Nanak Dev University">Guru Nanak Dev University, Amritsar</option>
            <option value="Lovely Professional University">Lovely Professional University, Phagwara</option>
            <option value="Thapar Institute of Engineering & Technology">Thapar Institute of Engineering & Technology, Patiala</option>
            <option value="IK Gujral Punjab Technical University">IK Gujral Punjab Technical University, Kapurthala</option>
            <option value="Dr B R Ambedkar National Institute of Technology">Dr B R Ambedkar National Institute of Technology, Jalandhar</option>
        </select>

        <label for="Uemail">Email</label>
        <input type="email" id="Uemail" name="Uemail" required>

        <label for="Upassword">Password</label>
        <input type="password" id="Upassword" name="Upassword" required>

        <input type="submit" value="Sign up" name="submit">
        
        <span>Already have an account? <a href="login.jsp">Login</a></span>
    </form>
    
    
     <script>
    var status = document.getElementById("Msg").value;
    if(status == "False") {
        alert("User already Exists.");
    }
    </script>
</body>
</html>
<%session.invalidate(); %>
