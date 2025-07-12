<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String name = (String)session.getAttribute("username");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        @import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap');
     * {
  padding: 0;
  margin: 0;
  text-decoration: none;
  list-style: none;
  box-sizing: border-box;
}
body {
  font-family: "Montserrat", sans-serif;
}
nav {
  background: #0082e6;
  height: 80px;
  width: 100%;
}
label.logo {
  color: white;
  font-size: 25px;
  line-height: 80px;
  padding: 0 100px;
  font-weight: bold;
}
nav ul {
  float: right;
  margin-right: 20px;
}
nav ul li {
  display: inline-block;
  line-height: 80px;
  margin: 0 5px;
}
nav ul li a {
  color: white;
  font-size: 17px;
  padding: 7px 13px;
  border-radius: 3px;
  text-transform: uppercase;
}
a.active,
a:hover {
  background: #1b9bff;
  transition: .5s;
}
.checkbtn {
  font-size: 22px;
  color: white;
  float: right;
  line-height: 80px;
  margin-right: 30px;
  cursor: pointer;
  display: none;
}
#check {
  display: none;
}
@media (max-width: 1050px) {
  label.logo {
    padding-left: 30px;
  }
  nav ul li a {
    font-size: 16px;
  }
}
/* Responsive media query code for small screen */
@media (max-width: 890px) {
  .checkbtn {
    display: block;
  }
  label.logo {
    font-size: 22px;
  }
  ul {
    position: fixed;
    width: 100%;
    height: 100vh;
    background: #2c3e50;
    top: 80px;
    left: -100%;
    text-align: center;
    transition: all .5s;
  }
  nav ul li {
    display: block;
    margin: 50px 0;
    line-height: 30px;
  }
  nav ul li a {
    font-size: 20px;
  }
  a:hover,
  a.active {
    background: none;
    color: #0082e6;
  }
  #check:checked~ul {
    left: 0;
  }
}
section {
  background: url("bg.jpg") no-repeat;
  background-size: cover;
  height: calc(100vh - 80px);
}


    </style>
</head>
<body>

<nav >
<label class="logo">
    StudyVerse
</label>
<ul>
 <li><a href="Home.jsp">Home</a></li>
    <li><a href="Pyq.jsp">PYQ</a></li>
    <li><a href="LibraryBook.jsp">Books</a></li>
    <li><a href="ECourses.jsp">Courses</a></li>
    <li><a href="aboutUs.jsp">About us</a></li>
<%if(name !=null){%>
 <li><a href="Dashboard.jsp">My Profile</a></li>
	<li><a href="Logout">Logout</a></li>
<%}else{%>
	<li><a href="login.jsp">Login</a></li>
<% }
%>

</ul>
</nav>

</body>
</html>