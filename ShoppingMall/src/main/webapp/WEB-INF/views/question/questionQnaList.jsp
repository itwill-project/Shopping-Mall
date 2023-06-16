<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>상품문의</title>
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
        crossorigin="anonymous">
    </head>
        <body>
            <div class="container-fluid">
            <header class="my-2 p-5 text-center text-bg-dark">
                <h1> Q & A 문의 (총 ${questionQnaList.size()}건)</h1>
            </header>

    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <ul class="navbar-nav bg-light">
                <li class="nav-item">
                    <c:url var="mainPage" value="/" /> 
                    <a class="nav-link" href="${ mainPage }">메인 페이지</a>
                </li>
                <li class="nav-item">
                    <c:url var="questionFaqListPage" value="/question/questionFaqList" />
                   <a class="nav-link" href=${ questionFaqListPage }>자주묻는 질문</a>
                </li>
                <li class="nav-item">
                    <c:url var="questionQnaCreatePage" value="/question/questionQnaCreate" /> 
                    <a class="nav-link" href="${ questionQnaCreatePage }">새 문의사항 작성</a>
                </li>
         </ul>
    </nav>

    <main class="my-2">
        <div class="card">
            <table class ="card-body table table-hover">
                <thead>
                  
                    <tr>
                        <th>번호</th>
                        <th>답변여부</th>
                        <th>문의 유형</th>
                        <th>제목</th>
                        <th>작성자 아이디</th>
                        <th>작성시간</th>
                    </tr>
               
                </thead>
                <tbody>
                   <!-- var는 도메인 모델 이름! -->
                    <c:forEach items="${questionQnaList }" var="question">
                        <tr>
                            <td>${ question.id }</td>
                            <td>${ question.is_answered }</td>
                            <td>${ question.qtype }</td>
                            <td> 
                                <c:url var ="QuestionDetailPage" value="/question/questionQnaDetail">
                                    <c:param name="id" value="${ question.id }" />
                                </c:url>
                                <a href="${ QuestionDetailPage }">${ question.qtitle }</a>
                            </td>
                            
                            <td>${ question.login_id }</td>
                            <td>
                                    <fmt:formatDate
                                        value="${ question.qcreated_time }"
                                        pattern="yyyy-MM-dd HH:MM:mm" />
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
    
                        <script
                            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
                            crossorigin="anonymous"></script>
           </div>
       </main>
</body>
</html>