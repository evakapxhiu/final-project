<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        html,body,h1,h2,h3,h4,h5,h6 {font-family: "Roboto", sans-serif}

    </style>
</head>
<body>
<div class="w3-content w3-margin-top" style="max-width:1400px;">
    <!-- The Grid -->
    <div class="w3-row-padding">
        <!-- Right Column -->
        <div class="w3-twothird">
            <div class="w3-container w3-card w3-white w3-margin-bottom">
                <p class="w3-text-grey w3-padding-16"><i class="fa fa-suitcase fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i><a href="/forum">Go back to posts:</a> </p>
                <div class="container" >
                    <h4 class="text-success fw-lighter fst-italic">This post was created by : <c:out value="${exercise.user.username}"></c:out> on <c:out value="${exercise.createdAt}"/></h4>
                    <h4 class=" fw-lighter fst-italic text-success">Subject:</h4><h4><c:out value="${exercise.subject}"/></h4>
                    <h4 class=" fw-lighter fst-italic text-success">The issue: </h4> <h4><c:out value="${exercise.text}"/></h4>
                    <h4 class=" fw-lighter fst-italic text-success">Notes: </h4> <h4><c:out value="${exercise.thoughts}"/></h4>
<%--                    <div class="fw-lighter fst-italic text-danger">--%>
<%--                        IMAGE/FILE:--%>
<%--                        <img class="img-thumbnail" src="${exercise.fileUrl}">--%>
<%--                    </div>--%>
                    <hr>
                                <div class="w3-col l3 m6 w3-margin-bottom">
                        <h4 class="text-danger fw-lighter fst-italic">*Comments for this post:</h4>
                    <c:forEach items="${exercise.comments}" var="comment">
                        <p class="fw-lighter fst-italic"> <c:out value="${comment.userCo.username}"/>comment for this post on <c:out value="${comment.createdAt}"/>:  <p class="form-control"><c:out value="${comment.content}"/></p>  </p>
                    </c:forEach>
                    <div class="container">
<%--@elvariable id="comment" type="java"--%>
<form:form method="post" action="/forum/comment" modelAttribute="comment">
    <p class="form-control">
        <form:label path="content">Comment:</form:label>
        <form:errors path="content"></form:errors>
        <form:textarea path="content"></form:textarea>
    </p>
    <form:input type="hidden" path="userCo" value="${user.id}" />
    <form:input type="hidden" path="exerciseCo" value="${exercise.id}" />

    <input type="submit" value="Leave a comment"/>
</form:form>
                                </div>
                                </div>

                </div>
                </div>
        </div>
        <!-- End Right Column -->
    </div>

    <!-- End Grid -->
</div>

<!-- End Page Container -->
</div>
</body>
</html>