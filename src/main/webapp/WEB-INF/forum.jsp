<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Need help with exercise?</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}
        .w3-bar .w3-button {
            padding: 16px;
        }
        /* Full height image header */
        .bgimg-1 {
            background-position: center;
            /*background-size: ;*/
            min-height: 100%;
            background-image: url(../images/exercises.jpeg);
            background-size: cover;
        }
    </style>
</head>
<body class="w3-light-grey w3-content" style="max-width:1600px">
<!-- Navbar (sit on top) -->
<div class="w3-top">
    <div class="w3-bar w3-white w3-card" id="myNavbar">
        <h1 class="w3-bar-item w3-button w3-wide">BOOK BAR</h1>
        <!-- Right-sided navbar links -->
        <div class="w3-right w3-hide-small">
            <a href="/aboutus" class="w3-bar-item w3-button">ABOUT</a>
            <a href="/aboutus" class="w3-bar-item w3-button"><i class="fa fa-envelope"></i> CONTACT</a>
            <a href="/home" class="w3-bar-item w3-button">POSTS</a>
            <a href="/newPost" class="w3-bar-item w3-button">NEED HELP?</a>
            <a href="/home" class="w3-bar-item w3-button">POSTS</a>
            <a onclick="w3_close()" class="w3-bar-item w3-button" href="/savedBooks">MY SAVED POSTS</a>
            <a href="/logout" class="w3-bar-item w3-button">LOG OUT</a>
        </div>
        <!-- Hide right-floated links on small screens and replace them with a menu icon -->
        <a href="javascript:void(0)" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="w3_open()">
            <i class="fa fa-bars"></i>
        </a>
    </div>
    <!-- Sidebar on small screens when clicking the menu icon -->
    <nav class="w3-sidebar w3-bar-block w3-black w3-card w3-animate-left w3-hide-medium w3-hide-large" style="display:none" id="mySidebar">
        <a href="javascript:void(0)" onclick="w3_close()" class="w3-bar-item w3-button w3-large w3-padding-16">Close ×</a>
        <a href="/aboutus" onclick="w3_close()" class="w3-bar-item w3-button">ABOUT</a>
        <a href="/aboutus" onclick="w3_close()" class="w3-bar-item w3-button"><i class="fa fa-envelope"></i> CONTACT</a>
        <a href="/newPost" onclick="w3_close()" class="w3-bar-item w3-button">NEED HELP?</a>
        <a onclick="w3_close()" class="w3-bar-item w3-button" href="/savedBooks">MY SAVED POSTS</a>
        <a href="/addPage" onclick="w3_close()" class="w3-bar-item w3-button">NEW POST</a>
        <a href="/logout" onclick="w3_close()" class="w3-bar-item w3-button">LOG OUT</a>
    </nav>
</div>
<div class="w3-container bgimg-1" style="padding:128px 16px" id="team">
    <h3 class="alert alert-info w3-center"> Welcome: <c:out value="${user.username}"/></h3>
    <p class="w3-center w3-large">If you are strugling with your projects  in school,this is the right place!</p>
    <div class="w3-row-padding w3-grayscale" style="margin-top:64px">
<%--        <div class="w3-col l3 m6 w3-margin-bottom">--%>
            <div class="w3-card">
                <div class="w3-container">
                                    <c:forEach var="exercise" items="${exercise}">
                                        <div class="w3-row-padding w3-padding-64">
                                            <h3 class="alert alert-info w3-center"><strong><c:out value="${exercise.user.username}"/>  add a new post:</strong></h3>
                                            <p class="col-sm-3 w3-large">Subject:<c:out value="${exercise.subject}"/></p>
                                            <p class="col-sm-3 w3-large">The issue:<c:out value="${exercise.text}"/></p>
                                            <p class="col-sm-3 w3-large">Notes:<c:out value="${exercise.thoughts}"/></p>
                                         <p><a href="/exercise/${exercise.id}" class="btn btn-outline-info w3-center">More Details.</a></p>
                                            <div>
                                                <c:if test="${ ! exercise.user.equals(user)}">
                                                <c:choose>
                                                <c:when test="${exercise.likers.contains(user)}">
                                                <a class="btn btn-danger" href="/unlike/${exercise.id}">Unlike</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a class="btn btn-info" href="/like/${exercise.id}">Like</a>
                                                </c:otherwise>
                                            </c:choose>
                                                </c:if>
                                            </div>
                                        </div>
                                        <c:if test="${exercise.user.equals(user)}">
                                            <p> <a class="btn btn-outline-info" href="/editEx/${exercise.id}">Edit</a>
                                                <form:form action="/deleteEx/${exercise.id}" method="delete">
                                                    <button class="btn btn-danger">Delete</button>
                                                </form:form> </p>
                                            <h4><c:out value="${exercise.likers.size()}"></c:out> liked this post</h4>
                                        </c:if>
                                        <hr>
                                            </c:forEach>
                                    </div>
            </div>
    </div>
</div>
</div>
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
</body>
</html>