<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <title> SignUp Form</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- Custom Theme files -->
    <link href="css/index.css" rel="stylesheet" type="text/css" media="all" />
    <!-- //Custom Theme files -->
    <!-- web font -->
    <link href="//fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,700,700i" rel="stylesheet">
    <!-- //web font -->
</head>
<body>
<!-- main -->
<div class="main-w3layouts wrapper">
    <h1>One step ahead before joining us...</h1>
    <div class="main-agileinfo">
        <div class="agileits-top">
            <form:form class="form d-flex flex-column gap-3" action="/register"
                       method="post" modelAttribute="newUser">
                <p>If you don't have an account ,sign up!</p>
                <div class="d-flex flex-column justify-content-center align-items-center gap-2">
                    <form:errors path="username" class="errors text-danger"></form:errors>
                    <form:label path="username">Name: </form:label>
                    <form:input class="form-control" type="text" path="username"></form:input>
                </div>
                <div
                        class=" d-flex flex-column  justify-content-center align-items-center gap-2">
                    <form:errors path="email" class="errors text-danger"></form:errors>
                    <form:label path="email">Email: </form:label>
                    <form:input class="form-control" type="text" path="email"></form:input>
                </div>
                <div
                        class=" d-flex flex-column  justify-content-center align-items-center gap-2">
                    <form:errors path="password" class="errors text-danger"></form:errors>
                    <form:label path="password">Password: </form:label>
                    <form:input class="form-control" type="password" path="password"></form:input>
                </div>
                <div
                        class=" d-flex flex-column  justify-content-center align-items-center gap-2">
                    <form:errors path="confirm" class="errors text-danger"></form:errors>
                    <form:label path="confirm">Confirm Password: </form:label>
                    <form:input class="form-control" type="password" path="confirm"></form:input>
                </div>
                <div class="wthree-text">
                    <label class="anim">
                        <input type="checkbox" class="checkbox" required="">
                        <span>I Agree To The Terms & Conditions</span>
                    </label>
                    <div class="clear"> </div>
                </div>
                <input type="submit" value="SIGNUP">
            </form:form>
            <p>If you have an account ,sign in to continue!</p>
            <form:form class="form d-flex flex-column gap-3" action="/login"
                       method="post" modelAttribute="newLogin">
                <div class="d-flex flex-column  justify-content-center align-items-center gap-2">
                    <form:errors path="email" class="errors text-danger"></form:errors>
                    <form:label path="email">Email: </form:label>
                    <form:input class="form-control" type="text" path="email"></form:input>
                </div>
                <div class="d-flex flex-column  justify-content-center align-items-center gap-2">

                    <form:label path="password">Password: </form:label>
                    <form:input class="form-control" type="password" path="password"></form:input>
                    <form:errors path="password" class="errors text-danger"></form:errors>
                </div>
                <input class="w-50 btn btn-primary" type="submit" value="Submit" />
            </form:form>
        </div>
    </div>
    <!-- copyright -->
    <div class="colorlibcopy-agile">
        <p>© 2023  Signup Form</p>
    </div>
    <!-- //copyright -->
    <ul class="colorlib-bubbles">
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
    </ul>
</div>
<!-- //main -->
</body>

</html>