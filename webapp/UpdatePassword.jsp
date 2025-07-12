<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Password</title>
    <style>
        /* General body styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fa;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* Container for the form */
        .form-container {
            width: 100%;
            max-width: 400px;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        /* Header styling */
        h1 {
            color: #007BFF;
            font-size: 1.8rem;
            margin-bottom: 20px;
        }

        /* Label styling */
        label {
            display: block;
            margin-bottom: 10px;
            color: #333;
            font-size: 1rem;
        }

        /* Input field styling */
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
        }

        /* Submit button styling */
        input[type="submit"] {
            background-color: #007BFF;
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
            background-color: #0056b3;
        }

        /* Styling for the link to back to login */
        .back-link {
            display: block;
            margin-top: 20px;
            color: #007BFF;
            text-decoration: none;
        }

        .back-link:hover {
            text-decoration: underline;
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
    <script>
        // JavaScript function to check if passwords match
        function validatePasswords() {
            var password = document.getElementById("myInput").value;
            var confirmPassword = document.getElementById("repeatPassword").value;

            if (password !== confirmPassword) {
                alert("Passwords do not match!");
                return false; // Prevent form submission
            }

            return true; // Allow form submission if passwords match
        }
    </script>
</head>
<body>
    <div class="form-container">
        <h1>Update Password</h1>
        <form method="post" action="./UpdatePwd" onsubmit="return validatePasswords()">
            <label for="myInput">Password</label>
            <input type="password" name="Pwd" id="myInput" required>

            <label for="repeatPassword">Confirm Password</label>
            <input type="password" name="RePwd" id="repeatPassword" required>

            <input type="submit" value="Submit">
        </form>
        <a href="login.jsp" class="back-link">Back to Login</a>
    </div>
</body>
</html>
