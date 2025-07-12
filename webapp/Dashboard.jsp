<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
  response.setHeader("Pragma", "no-cache");%>
      <% if(session.getAttribute("username") == null){
        response.sendRedirect("Home.jsp");
    }%>
<%@page import="java.sql.Connection,java.sql.PreparedStatement,java.sql.ResultSet,java.sql.DriverManager"%>
<%@page import="Project.DataCon"%>


 
   
<%
    int id = 0;
    try {
        id = (int) session.getAttribute("Uid");
    } catch (Exception e) {
        e.printStackTrace();
    }

    String university = null;
    String email = null;
    Connection con = DataCon.getCon();
    PreparedStatement ps = con.prepareStatement("select * from users where id=?");
    ps.setInt(1, id);
    ResultSet rs = ps.executeQuery();
    if(rs.next()){
        university = rs.getString("Institute");  
        email = rs.getString("email");
        session.setAttribute("Uemail",email );
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        
        h2 {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            text-align: center;
            margin-top: 0;
        }
        
        .container {
            width: 80%;
            margin: 20px auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }
        
        label {
            font-weight: bold;
            margin-top: 10px;
        }
        
        input[type="text"], input[type="file"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0 15px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .profile-info {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <jsp:include page="AHeader.jsp" />

    <div class="container">
        <h2><%= university %></h2>

        <div class="profile-info">
            <div class="form-group">
                <label>Student ID</label>
                <input type="text" value="<%= id %>" readonly>
            </div>
            
            <div class="form-group">
                <label>Name</label>
                <input type="text" value="<%= session.getAttribute("username") %>" readonly>
            </div>

            <div class="form-group">
                <label>Email</label>
                <input type="text" value="<%= email %>" readonly>
            </div>
            
            <form method="post" action="./UploadFile" enctype="multipart/form-data">
                <div class="form-group">
                    <label>Upload Image</label>
                    <input type="file" name="files" accept="image/*" required/>
                </div>
                <input type="submit" value="Upload" />
            </form>
        </div>
    </div>
</body>
</html>
