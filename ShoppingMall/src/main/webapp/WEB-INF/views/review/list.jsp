<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
 	<meta name="viewport" content="width=device-width, initial-scale=1">
 	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" 
    rel="stylesheet" 
    integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" 
    crossorigin="anonymous">
	<title>Review List page</title>
</head>
	<body>
	<header class="bg-warning p-2 text-dark bg-opacity-50">
		<h1>리뷰 페이지</h1>
	</header>	
<hr>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
            <ul class="navbar-nav bg-light">
                <li class="nav-item">
                    <c:url var="mainPage" value="/" />
                    <a class="mx-1 btn btn-outline-success" href="/joo">메인 페이지</a>
                </li>
                <li class="nav-item">
                    <c:url var="postCreatePage" value="/post/create" />
                    <a class="mx-1 btn btn-outline-success" href="/joo/review/create">후기 작성</a>
                </li>
            </ul>
</nav>
<hr>
<main class="my-2">
            <div class="card">
                <table class="card-body table table-success">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>후기 내용</th>
                            <th>작성자 ID</th>
                            <th>작성시간</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach items="${list}" var="review">
                    		<tr>
                    			<td>${review.id}</td>
                    			<td>
                    				 <c:url var="reviewDetailPage" value="/review/detail">
                                        <c:param name="id" value="${ review.id }" />
                                    </c:url>
                                    <a href="${ reviewDetailPage }">${ review.rcontent}</a>
                                </td>
                                <td>${ review.u_id }</td>
						</td>
                            </tr>    
					  	</c:forEach>


 	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" 
            crossorigin="anonymous">
 	</script>
</body>
</html>














































