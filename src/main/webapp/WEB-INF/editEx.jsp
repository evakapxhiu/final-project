<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Club</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}
        .w3-bar .w3-button {
            padding:5px;
        }
        .bgimg-1 {
            background-position: center;
            /*background-size: ;*/
            /*background-image: url("static/css/images/welcome-wallp.jpeg");*/
            min-height: 100%;
            background-image: url(../images/exercises.jpeg);
            background-size: cover;
        }
    </style>
</head>
<body>
<nav>
    <div class="w3-top">
        <div class="w3-bar w3-white w3-card" id="myNavbar">
            <h1 class="w3-bar-item w3-button w3-wide">BOOK BAR</h1>
            <!-- Right-sided navbar links -->
            <div class="w3-right w3-hide-small">
                <a href="/aboutus" class="w3-bar-item w3-button">ABOUT</a>
                <a href="/aboutus" class="w3-bar-item w3-button"><i class="fa fa-envelope"></i> CONTACT</a>
                <a href="/home" class="w3-bar-item w3-button">POST</a>
                <a href="/forum" class="w3-bar-item w3-button">PROBLEM SOLVING</a>
                <a href="/savedPosts" class="w3-bar-item w3-button">MY SAVED POSTS</a>
                <a href="/logout" class="w3-bar-item w3-button">LOG OUT</a>
            </div>
            <!-- Hide right-floated links on small screens and replace them with a menu icon -->
            <a href="javascript:void(0)" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="w3_open()">
                <i class="fa fa-bars"></i>
            </a>
            <!-- Sidebar on small screens when clicking the menu icon -->
            <nav class="w3-sidebar w3-bar-block w3-black w3-card w3-animate-left w3-hide-medium w3-hide-large" style="display:none" id="mySidebar">
                <a href="javascript:void(0)" onclick="w3_close()" class="w3-bar-item w3-button w3-large w3-padding-16">Close ×</a>
                <a href="/aboutus" onclick="w3_close()" class="w3-bar-item w3-button">ABOUT US</a>
                <a href="/aboutus" onclick="w3_close()" class="w3-bar-item w3-button"><i class="fa fa-envelope"></i> CONTACT</a>
                <a href="/home" onclick="w3_close()" class="w3-bar-item w3-button">POST</a>
                <a href="/forum" onclick="w3_close()" class="w3-bar-item w3-button">PROBLEM SOLVING</a>
                <a href="/savedPosts" onclick="w3_close()" class="w3-bar-item w3-button">MY SAVED POSTS</a>
                <a href="/logout" onclick="w3_close()" class="w3-bar-item w3-button">LOG OUT</a>
            </nav>
        </div>
    </div>
</nav>
<div class="w3-container bgimg-1 w3-padding-64">
    <div class="w3-row-padding">
        <div class="w3-col m6">
            <h3 class="alert alert-info">Post something new.</h3>
            <p>Here you can post about your books.You want to sell them,exchane or give it to someone for free.It is in your hand</p>
            <p>You can post whatever you want,or edit and delete it later.<br>Suggest us to your friends later....</p>
        </div>
        <div class="w3-col m6">
            <form:form action="/updateEx/${exercise.id}" modelAttribute="exercise" class="form" method="PUT">
                <div class="form-row">
                    <form:errors path="subject" class="error"/>
                    <form:label for="subjcet" path="subject">Subject:</form:label>
                    <form:input type="text" path="subject" class="form-control"/>
                </div>
                <div class="form-row">
                    <form:errors path="text" class="error"/>
                    <form:label for="text" path="text">The Problem:</form:label>
                    <form:input type="text" path="text" class="form-control"/>
                </div>
                <div class="form-row">
                    <form:errors path="thoughts" class="error"/>
                    <form:label for="thoughts" path="thoughts">Notes:</form:label>
                    <form:input type="text" path="thoughts" class="form-control"/>
                </div>
<%--                <div class="form-row">--%>
<%--                    <form:errors path="fileUrl" class="error"/>--%>
<%--                    <form:label for="fileUrl" path="fileUrl">Upload a file:</form:label>--%>
<%--                    <form:textarea path="fileUrl" class="form-control"/>--%>
<%--                </div>--%>
                <div>
                    <form:errors path="user" class="error"/>
                    <form:input type="hidden" path="user" value="${user.id}" class="form-control"/>
                </div>

                <div>
                    <input type="submit" value="Submit" class="btn btn-outline-info"/>
                </div>
            </form:form>
        </div>
    </div>
</div>
</body>
<script>
    // Toggle between showing and hiding the sidebar when clicking the menu icon
    var mySidebar = document.getElementById("mySidebar");

    function w3_open() {
        if (mySidebar.style.display === 'block') {
            mySidebar.style.display = 'none';
        } else {
            mySidebar.style.display = 'block';
        }
    }

    // Close the sidebar with the close button
    function w3_close() {
        mySidebar.style.display = "none";
    }
</script>
</html>
