<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<html>
<head>
    <title>Posts</title>
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
            background-image: url(../images/background.jpeg);
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
            <a class="w3-bar-item w3-button" href="/home">POSTS</a>
            <a href="/forum" class="w3-bar-item w3-button">EXERCISES</a>
            <a href="/addPage" class="w3-bar-item w3-button">NEW POST</a>
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
        <a href="/aboutus" conclick="w3_close()" class="w3-bar-item w3-button">ABOUT</a>
        <a href="/aboutus" onclick="w3_close()" class="w3-bar-item w3-button"><i class="fa fa-envelope"></i> CONTACT</a>
        <a onclick="w3_close()" class="w3-bar-item w3-button" href="/home">POSTS</a>
        <a href="/forum" onclick="w3_close()" class="w3-bar-item w3-button">EXERCISES</a>
        <a href="/addPage" onclick="w3_close()" class="w3-bar-item w3-button">NEW POST</a>
        <a href="/logout" onclick="w3_close()" class="w3-bar-item w3-button">LOG OUT</a>
    </nav>
</div>
<div class="bgimg-1 w3-container" style="padding:128px 16px" id="team">
    <h3 class="alert alert-info w3-center"> Welcome: <c:out value="${user.username}"/>. Have a nice stay!</h3>
    <p class="w3-center w3-large">Posts you have saved.</p>
    <div class="w3-row-padding w3-grayscale" style="margin-top:64px">
    <div class="w3-card">
            <div class="w3-container">
                <c:forEach var="book" items="${books}">
                                <c:if test="${book.savers.contains(user)}">
                                    <p class="col-sm-3 w3-large">Title:<c:out value="${book.title}"/></p>
                                    <p class="col-sm-3 w3-large">School:<c:out value="${book.schoolName}"></c:out></p>
                                    <p><a href="/books/${book.id}" class="btn btn-outline-info w3-center">More Details.</a></p>
                                </c:if>
                    <hr>
                                <c:if test="${ ! book.savers.contains(user)}">
                                    <p class="text text-danger w3-large">Want to save more posts!</p>
                                    <p><a href="/home" class="btn btn-outline-info w3-center">Go back to posts!.</a></p>
                                </c:if>

                </c:forEach>
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