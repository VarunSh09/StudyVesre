<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
<style>
/* Reset styles */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: Arial, sans-serif;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	padding: 20px;
	overflow: hidden;
	position: relative;
	background: linear-gradient(135deg, #a8e063, #56ab2f);
	animation: backgroundMove 6s infinite alternate, bodyFadeIn 1s ease-in-out forwards;
	opacity: 0;
}

/* Background gradient animation */
@keyframes backgroundMove {
	0% {
		background: linear-gradient(135deg, #a8e063, #56ab2f);
	}
	100% {
		background: linear-gradient(135deg, #56ab2f, #a8e063);
	}
}

/* Body fade-in */
@keyframes bodyFadeIn {
	to {
		opacity: 1;
	}
}

/* Floating bubbles */
.bubble {
	position: absolute;
	border-radius: 50%;
	background: rgba(255, 255, 255, 0.6);
	animation: floatBubble 8s infinite ease-in-out;
}

@keyframes floatBubble {
	0% {
		transform: translateY(0) scale(1);
		opacity: 0.8;
	}
	50% {
		opacity: 0.4;
		transform: translateY(-150px) scale(1.5);
	}
	100% {
		transform: translateY(0) scale(1);
		opacity: 0.8;
	}
}

/* Moving boxes */
.box {
	position: absolute;
	background: rgba(255, 255, 255, 0.3);
	border: 2px solid #4CAF50;
	animation: moveBox 10s infinite alternate;
}

@keyframes moveBox {
	0% {
		transform: translate(0, 0) rotate(0deg);
	}
	50% {
		transform: translate(200px, 150px) rotate(180deg);
	}
	100% {
		transform: translate(0, 0) rotate(360deg);
	}
}

/* Login form container */
.login-container {
	background-color: white;
	padding: 30px 40px;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	max-width: 400px;
	width: 100%;
	text-align: center;
	z-index: 1;
	position: relative;
	overflow: hidden;
	animation: fadeInSlide 1s ease-out forwards;
	opacity: 0;
	transform: translateY(-30px);
}

/* Slide-in animation */
@keyframes fadeInSlide {
	to {
		opacity: 1;
		transform: translateY(0);
	}
}

h1 {
	color: #333;
	margin-bottom: 20px;
}

/* Form styling */
label {
	display: block;
	text-align: left;
	margin: 10px 0 5px;
	color: #555;
	font-weight: bold;
}

input[type="text"],
input[type="password"] {
	width: 100%;
	padding: 12px;
	margin-bottom: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 14px;
	transition: all 0.3s ease;
}

/* Input focus animation */
input[type="text"]:focus,
input[type="password"]:focus {
	border-color: #4CAF50;
	box-shadow: 0 0 8px rgba(76, 175, 80, 0.4);
	outline: none;
}

/* Submit button */
input[type="submit"] {
	width: 100%;
	background-color: #4CAF50;
	color: white;
	border: none;
	padding: 12px;
	border-radius: 5px;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

input[type="submit"]:hover {
	background-color: #45a049;
}

/* Responsive design */
@media (max-width: 500px) {
	.login-container {
		padding: 20px;
	}
	input[type="text"],
	input[type="password"] {
		font-size: 16px;
	}
}
</style>
</head>
<body>

	<!-- Floating Bubbles -->
	<div class="bubble" style="width: 50px; height: 50px; top: 20px; left: 30px; animation-duration: 7s;"></div>
	<div class="bubble" style="width: 70px; height: 70px; top: 150px; left: 120px; animation-duration: 10s;"></div>
	<div class="bubble" style="width: 40px; height: 40px; top: 300px; left: 250px; animation-duration: 5s;"></div>

	<!-- Moving Boxes -->
	<div class="box" style="width: 100px; height: 100px; top: 50px; left: 200px; animation-duration: 8s;"></div>
	<div class="box" style="width: 80px; height: 80px; top: 300px; left: 50px; animation-duration: 12s;"></div>

	<!-- Login Form -->
	<div class="login-container">
		<h1>Admin Login</h1>
		<form method="post" action="./Admin_login">
			<label>Enter Email</label>
			<input type="text" name="uemail" required>

			<label>Enter Password</label>
			<input type="password" name="upassword" required>

			<input type="submit" name="Submit" value="Login">
		</form>
	</div>

</body>
</html>
