<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>Details</title>--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">--%>

<%--</head>--%>
<%--<body>--%>

<%--<div class="container">--%>
<%--    <h1><c:out value="${book.title}"/></h1>--%>

<%--    <h3>Books from everyone shelves:</h3>--%>
<%--    <a href="/home">back to shelves</a>--%>
<%--    <div>--%>

<%--        <h2 class="text-danger"><c:out value="${book.user.username}"></c:out></h2>--%>
<%--        <h2>read</h2>--%>
<%--        <h2 class="text-success"> <c:out value="${book.title}"></c:out> </h2> <h2 class="text-primary"> by <c:out value="${book.author}"></c:out></h2>--%>
<%--    </div>--%>
<%--    <div class="container">--%>
<%--        <h4>Here are <c:out value="${book.user.username}"/>'s thoughts:</h4>--%>
<%--        <hr />--%>

<%--        <p><c:out value="${book.notes}"/></p>--%>
<%--        <hr />--%>
<%--    </div>--%>
<%--    <c:if test="${!  book.user.equals(user)}">--%>
<%--        <c:choose>--%>
<%--            <c:when test="${book.userWhoSaved.contains(user)}">--%>
<%--                <a href="/unsave/${book.id}">unsave</a>--%>
<%--            </c:when>--%>
<%--            <c:otherwise>--%>
<%--                <a href="/save/${book.id}">Save</a>--%>
<%--            </c:otherwise>--%>
<%--        </c:choose>--%>
<%--    </c:if>--%>
<%--    <c:if test="${book.user.equals(user)}">--%>
<%--        <p> <a href="/edit/${book.id}">Edit</a>--%>
<%--            <form:form action="/delete/${book.id}" method="delete">--%>
<%--                <button>Delete</button>--%>
<%--            </form:form> </p>--%>
<%--        <h4><c:out value="${book.userWhoSaved.size()}"></c:out> saved this post</h4>--%>
<%--    </c:if>--%>
<%--</div>--%>
<!DOCTYPE html>
<html>
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

<!-- Page Container -->
<div class="w3-content w3-margin-top" style="max-width:1400px;">
    <!-- The Grid -->
    <div class="w3-row-padding">
        <!-- Right Column -->
        <div class="w3-twothird">

            <div class="w3-container w3-card w3-white w3-margin-bottom">
                <p class="w3-text-grey w3-padding-16"><i class="fa fa-suitcase fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i><a href="/home">Go back to posts:</a> </p>
                    <div class="container" >
                        <h4 class=" fw-lighter fst-italic text-success">This post was created by : <c:out value="${book.user.username}"></c:out> on <c:out value="${book.createdAt}"></c:out></h4>
                        <h4 class="fw-lighter fst-italic text-danger">Title: </h4> <h4><c:out value="${book.title}"/></h4>
                        <h4 class="fw-lighter fst-italic text-danger"> Author: </h4> <h4><c:out value="${book.author}"></c:out></h4>
                        <h4 class="fw-lighter fst-italic text-danger"> Price Details: </h4> <h4><c:out value="${book.priceDetails}"></c:out></h4>
                        <c:if test="${book.priceDetails == 'sale'}">
                        <h4 class="text-danger col-sm-3"> Price: </h4> <h4><c:out value="${book.price}"></c:out></h4>
                        </c:if>
                        <h4 class="text-danger col-sm-3"> School name: </h4> <h4><c:out value="${book.schoolName}"></c:out></h4>
                    </div>
                <hr />
                <div class="fw-lighter fst-italic text-danger">
                    IMAGE/FILE:
                <img class="img-thumbnail" style="max-width:200px;" src="${book.fileUpload}">
                </div>
                <hr />
                    <div class="container">
                        <h4 class="fw-lighter fst-italic w3-text-grey">*Notes:</h4>
                        <p><c:out value="${book.notes}"/></p>
                        <hr />
    </div>
    </div>
                    <c:if test="${book.user.equals(user)}">
                        <p> <a class="btn btn-outline-info" href="/edit/${book.id}">Edit</a>
                            <form:form action="/delete/${book.id}" method="delete">
                                <button class="btn btn-danger">Delete</button>
                            </form:form> </p>
                    </c:if>
            </div>
            <!-- End Right Column -->
        </div>

        <!-- End Grid -->
    </div>

    <!-- End Page Container -->
</div>
</body>
</html>
