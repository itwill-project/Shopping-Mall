<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Spring 2</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
</head>
<style>
	#QuestionsList {
		color: black;
	}
	
	#QuestionsCreateBtn {
		background-color: black;
		color: white;
	}
</style>
<body>
	<div>
		<header>문의목록</header>
		<nav></nav>
		<!-- Q&A 상품 문의 목록 -->
		<div class="container mt-4">
			<h5>Q & A 상품문의 (총 ${questionsList.size()}건)</h5>

			<table class="table table-striped" id="QuestionsList">
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">답변여부</th>
						<th scope="col">제목</th>
						<th scope="col">내용</th>
						<th scope="col">작성자 아이디</th>
						<th scope="col">등록일자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${questionsList}" var="question">
						<tr>
							<td>${question.id}</td>
							<td>${question.is_answered}</td>
							<td><c:url var="QuestiondetailPage"
									value="/questions/detail">
									<c:param name="id" value="${ question.id }" />
								</c:url> <a href="${ QuestiondetailPage }">${question.qtitle}</a></td>
							<td>${question.qcontent}</td>
							<td>${question.u_id}</td>
							<td><fmt:formatDate value="${question.qcreated_time}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="text-center">
				<nav aria-label="Page navigation">
					<ul class="pagination">
						<!-- TODO : 페이지 번호 생성  JavaScript 코드 삽입 -->
					</ul>
				</nav>
			</div>
			<div class="text-end">
				<button
					onclick="window.location.href='/joo/questions/questionCreate'"
					type="button" class="btn btn-primary" id="QuestionsCreateBtn">작성하기</button>
			</div>
		</div>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
			crossorigin="anonymous"></script>
	</div>
</body>
</html>