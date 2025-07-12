<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="Header.jsp"/>
<% response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PYQ</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
    }
    .university-box {
        width: 250px;
        height: 300px;
        margin: 20px;
        background-color: #fff;
        border: 1px solid #ddd;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        display: inline-block;
        text-align: center;
        vertical-align: top;
        transition: transform 0.3s ease;
    }
    .university-box:hover {
        transform: scale(1.05);
    }
    .university-box img {
        width: 100%;
        height: 200px;
        border-bottom: 1px solid #ddd;
        border-top-left-radius: 8px;
        border-top-right-radius: 8px;
    }
    .university-box p {
        margin: 0;
        padding: 10px;
        font-size: 16px;
        color: #333;
        font-weight: bold;
    }
    a {
        text-decoration: none;
        color: inherit;
    }
    .container {
        display: flex;
        justify-content: center;
        flex-wrap: wrap;
        padding: 20px;
    }
</style>
</head>
<body>

<div class="container">
    <div class="university-box">
        <a href="Courses.jsp?University=Gndu">
            <img alt="GNDU" src="Images/Gndu_img.png" />
            <p>GNDU</p>
        </a>
       <p>Guru Nanak Dev University</p>
        
    </div>

    <div class="university-box">
        <a href="Courses.jsp?University=PTU">
            <img alt="PTU" src="Images/PTU_img.png" />
            <p>PTU</p>
        </a>
         <p>Punjab Technical University</p>
        
    </div>
    <div class="university-box">
        <a href="Courses.jsp?University=TIET">
            <img alt="PTU" src="Images/ThaparInsititute.png" />
            <p>TIET</p>
        </a>
         <p>Thapar Institute of Engineering & Technology</p>
        
    </div>
    <div class="university-box">
        <a href="Courses.jsp?University=NITJ">
            <img alt="PTU" src="Images/NITJal.png" />
            <p>NIT</p>
        </a>
         <p>Dr B R Ambedkar National Institute of Technology</p>
        
    </div>
    
</div>

</body>
</html>
