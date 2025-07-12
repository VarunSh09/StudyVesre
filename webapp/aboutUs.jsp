<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>about us</title>
<style>
.about {
    background-color: #f9f9f9;
    padding: 50px 20px;
    text-align: center;
}

.about-content h2 {
    font-size: 3rem;
    margin-bottom: 20px;
    color: #007BFF;
}

.about-content p {
    font-size: 1.2rem;
    line-height: 1.6;
    margin-bottom: 30px;
    max-width: 800px;
    margin-left: auto;
    margin-right: auto;
}

.about-content h3 {
    font-size: 2rem;
    margin-top: 30px;
    color: #007BFF;
}

.about-content ul {
    list-style-type: none;
    padding: 0;
    margin-top: 20px;
}

.about-content ul li {
    font-size: 1.1rem;
    margin-bottom: 15px;
}
footer {
    background-color: #333;
    color: white;
    text-align: center;
    padding: 10px 0;
    margin-top: 40px;
}
</style>
</head>
<body>
    <jsp:include page="Header.jsp"/>

<section class="about">
        <div class="about-content">
            <h2>About StudyVerse</h2>
            <p>At StudyVerse, our mission is to empower students by providing them with the best resources to excel in their academic journey. Whether you're preparing for exams or expanding your knowledge, we are committed to making learning easier, more accessible, and more effective.</p>

            <h3>Our Vision</h3>
            <p>To create an all-in-one platform that connects students with a vast range of educational resources, including past year questions (PYQs), books, and courses. We aim to foster a community of learners who support each other in their pursuit of academic success.</p>

            <h3>What We Offer</h3>
            <ul>
                <li><strong>University PYQs:</strong> A comprehensive collection of past year questions from various universities to help students prepare for exams effectively.</li>
                <li><strong>Books:</strong> A wide selection of textbooks across multiple disciplines to aid in deeper learning.</li>
                <li><strong>Courses:</strong> Online courses designed to enhance knowledge and skills in various subjects.</li>
            </ul>
        </div>
    </section>
    
 <footer>
        <p>&copy; 2025 StudyVerse. All rights reserved.</p>
    </footer>    
</body>
</html>