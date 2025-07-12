<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");%>
<%@ page import="java.sql.*,Project.DataCon" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<style>
#HomePage{
height:100vh;
  width: 100%;

}

#bd{

  height: 100vh;
  width: 100vw;
  background-image: url('UserImages/Admin.png');
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
  
}
/* General body and page styling */
body {    overflow-x:hidden;

    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
    font-family: Arial, sans-serif;
}

#heading {
    font-style: Roboto, sans-serif;
    text-align: center;
    margin-top: 20px;
    color: #333;
}
#courses{	
	margin-top:30vh;
	text-align:center;
	background-color:#0082e6;
	color:white;
}

.container {
	margin-top:5vh;
	margin-left:auto;
	margin-right:auto;
    width: 80%;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
}

.course-item {
    background-color: white;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    margin: 20px;
    padding: 20px;
    width: 30%;
    text-align: center;
    transition: transform 0.3s ease;
}

.course-item:hover {
    transform: scale(1.05);
}

.course-item img {
    max-width: 100%;
    border-radius: 8px;
}

.course-item h3 {
    color: #333;
    font-size: 1.5em;
    margin: 10px 0;
}

.course-item p {
    color: #666;
    font-size: 1em;
    margin-bottom: 10px;
}

.course-item a {
    display: inline-block;
    padding: 10px 20px;
    background-color: #007BFF;
    color: white;
    text-decoration: none;
    border-radius: 5px;
    margin-top: 10px;
    transition: background-color 0.3s ease;
    
}

.course-item a:hover {
    background-color: #0056b3;
}
.hero {
    color: white;
    padding: 80px 20px;
    text-align: center;
}

.hero h2 {
    font-size: 3rem;
    margin-bottom: 20px;
}

.hero p {
    font-size: 1.2rem;
    margin-bottom: 20px;
    max-width: 800px;
    margin-left: auto;
    margin-right: auto;
}

.cta-btn {
    background-color: #ff9900;
    color: white;
    padding: 10px 20px;
    text-decoration: none;
    font-size: 1.2rem;
    border-radius: 5px;
    transition: background-color 0.3s ease;
}

.cta-btn:hover {
    background-color: #e68a00;
}
</style>
</head>
<body id="bd">
<main>

    <jsp:include page="Header.jsp"/>
    <div class="hero-content">
        <section class="hero">
    


 <h2 >Welcome to StudyVerse</h2>
            <p>Your ultimate destination for academic success! Explore a vast collection of university past year questions (PYQs), textbooks, courses, and more—all in one place.</p>
            <p>Whether you're preparing for exams or enhancing your knowledge, StudyVerse is here to support your learning journey.</p>
            <a href="#" class="cta-btn">Discover, Learn, Succeed</a> 
            </section>
</div>
<h1 id="courses">Courses</h1>
    <div class="container">
    	
        <%
        Connection con = DataCon.getCon();
        PreparedStatement ps = con.prepareStatement("select * from Ecourses");
        ResultSet rs = ps.executeQuery();
        for(int i=1;i<=2;i++) {rs.next();
        %>
            <div class="course-item">
            
                <a href="">
                    <img src="EImages/<%=rs.getString("Img_file")%>" alt="<%=rs.getString("Course")%>">
                </a>
                <h3><%=rs.getString("Course")%></h3>
                <p><%=rs.getString("Description")%></p>
                <p>By: <%=rs.getString("Author")%></p>
                <a href="Enroll?cid=<%=rs.getInt("c_id") %>&Images=<%=rs.getString("Img_file")%>&Course=<%=rs.getString("Course")%>">Enroll</a>
            </div>
        <% } %>
    </div>
   
    </main>
     <p style="text-align:center;"><a href="ECourses.jsp" class="cta-btn">More Courses</a> </p>
        <jsp:include page="Footer.jsp"/>
</body>
</html>
