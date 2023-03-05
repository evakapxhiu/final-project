<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>EDIT Posts</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
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
<nav class="w3-top">
  <div class="w3-bar w3-white w3-card" id="myNavbar">
    <h1 class="w3-bar-item w3-button w3-wide">BOOK BAR</h1>
    <!-- Right-sided navbar links -->
    <div class="w3-right w3-hide-small">
      <a href="/aboutus" class="w3-bar-item w3-button">ABOUT</a>
      <a href="/aboutus" class="w3-bar-item w3-button"><i class="fa fa-envelope"></i> CONTACT</a>
      <a class="w3-bar-item w3-button" href="/home"> POSTS</a>
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
    <a onclick="w3_close()" class="w3-bar-item w3-button" href="/home"> POSTS</a>
    <a href="/forum" onclick="w3_close()" class="w3-bar-item w3-button">EXERCISES</a>
    <a href="/addPage" onclick="w3_close()" class="w3-bar-item w3-button">NEW POST</a>
    <a href="/logout" onclick="w3_close()" class="w3-bar-item w3-button">LOG OUT</a>
  </nav>
</nav>
<div class="w3-container bgimg-1 w3-padding-64">
  <div class="w3-row-padding">
    <div class="w3-col m6">
      <h3 class="alert alert-info">Post something new.</h3>
      <p>Here you can post about your books.You want to sell them,exchane or give it to someone for free.It is in your hand</p>
      <p>You can post whatever you want,or edit and delete it later.<br>Suggest us to your friends later....</p>
    </div>
    <div class="w3-col m6">
      <form:form action="/update/${book.id}" modelAttribute="book" class="form" method="PUT" enctype="multipart/form-data">
        <div class="form-row">
          <form:errors path="title" class="error"/>
          <form:label for="title" path="title">Title:</form:label>
          <form:input type="text" path="title" class="form-control"/>
        </div>
        <div class="form-row">
          <form:errors path="author" class="error"/>
          <form:label for="author" path="author">Author:</form:label>
          <form:input type="text" path="author" class="form-control"/>
        </div>
        <div class="form-row">
          <form:errors path="schoolName" class="error"/>
          <form:label for="title" path="schoolName">School Name:</form:label>
          <form:input type="text" path="schoolName" class="form-control"/>
        </div>
        <div class="form-row">
          Price Details
          <form:select  path="priceDetails" class="form-control">
            <form:option value="free">Free</form:option>
            <form:option value="sale">Sale</form:option>
            <form:option value="change">Exchange</form:option>
          </form:select>
        </div>
        <div class="form-row">
          <form:errors path="priceDetails" class="error"/>
          <form:label for="price" path="price">Price:</form:label>
          <form:input type="text" path="price" class="form-control"/>
        </div>
        <div class="form-row">
          <form:errors path="notes" class="error"/>
          <form:label for="notes" path="notes">Notes:</form:label>
          <form:textarea path="notes" class="form-control"/>
        </div>
        <div class="form-row">
          <form:errors path="fileUpload" class="error"/>
          <form:label for="fileUpload" path="fileUpload">Upload a file:</form:label>
          <form:textarea path="fileUpload" class="form-control"/>
        </div>
        <div>
          <form:errors path="user" class="error"/>
          <form:input type="hidden" path="user" value="${user.id}" class="form-control"/>
        </div>

        <div>
          <input type="submit" value="Submit" class="btn btn-outline-info"/>
        </div>
      </form:form>
<%--  <form method="put" action="/update/${book.id}" enctype="multipart/form-data">--%>
<%--    <div class="form-row">--%>
<%--      <p>Title of the book(s):</p>--%>
<%--      <input class="form-control" type="text" name="title">--%>
<%--    </div>--%>
<%--    <div class="form-row">--%>
<%--      <p>Author:</p>--%>
<%--      <input class="form-control" type="text" name="author"/>--%>
<%--    </div>--%>
<%--    <div class="form-row">--%>
<%--      <p>School Name:</p>--%>
<%--      <input class="form-control" type="text" name="schoolName"/>--%>
<%--    </div>--%>
<%--    <div class="form-row">--%>
<%--      <p>Price details:</p>--%>
<%--      <input class="form-control" id="sale" type="radio" name="priceDetails" value="sale"/>--%>
<%--      <label for="sale"> SELL </label>--%>
<%--      <input class="form-control" id="exchange" type="radio" name="priceDetails" value="exchange"/>--%>
<%--      <label for="exchange"> EXCHANGE </label>--%>
<%--      <input class="form-control" id="free" type="radio" name="priceDetails" value="free"/>--%>
<%--      <label for="free"> FREE </label>--%>
<%--    </div>--%>
<%--    <div class="form-row">--%>
<%--      <p>Price:</p>--%>
<%--      <input class="form-control" type="number" name="price"/>--%>
<%--    </div>--%>
<%--    <div class="form-row">--%>
<%--      <p>Notes:</p>--%>
<%--      <input class="form-control" type="text" name="notes"/>--%>
<%--    </div>--%>
<%--    <div class="form-row">--%>
<%--      <p>Choose a file:</p>--%>
<%--      <input class="form-control" type="file" name="file"/>--%>
<%--    </div>--%>
<%--    <button class="btn btn-outline-info">Submit</button>--%>
<%--  </form>--%>
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