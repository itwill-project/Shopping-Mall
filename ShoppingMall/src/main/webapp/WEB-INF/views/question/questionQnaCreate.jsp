<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Qna Create</title>
            <link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
    crossorigin="anonymous">
    </head>
    
    <body>
        <div class="container-fluid">
            <header class="my-2 p-5 text-center text-bg-dark">
                <h1> QnA 작성</h1>
            </header>

            <nav class="navbar navbar-expand-lg bg-body-tertiary">
                <ul class="navbar-nav bg-light">
                    <li class="nav-item">
                        <c:url var="mainPage" value="/" /> 
                        <a class="nav-link" href="${ mainPage }">메인 페이지</a>
                    </li>
                    <li class="nav-item">
                        <c:url var="questionQnaListPage" value="/question/questionQnaList" /> 
                        <a class="nav-link" href="${ questionQnaListPage }"> 문의사항 목록</a>
                    </li>
                </ul>
            </nav>

        <main class="my-2">
            <div class="card">
                
                <form method="post">
                
                    <div class="card-body">
                        <div>
                            <label class="form-label" for="userId">사용자 번호</label>
                           <input class="form-control"
                                type="text" id="userId" name="u_id" required />
                        </div>
                        <div class="my-2">
                            <label class="form-label" for="productId">상품 번호</label>
                            <input class="forn-control"
                                type="text" id="productId" name="p_id" required />
                        </div>
                        <div class="my-2">
                            <label class="form-label" for="questionType">문의 유형</label>
                            <select class="form-select" id="questionType" name="qtype"  >
                                    <option>취소관련</option>
                                    <option >주문관련</option>
                                    <option >회원정보</option>
                                    <option >서비스</option>
                                    <option >기타</option>
                           </select>
                        </div>
                    
                        <div class="my-2">
                            <label class="form-label" for="questionTitle">문의 제목</label> 
                            <input class="form-control"
                                type="text" id="questionTitle" name="qtitle" required autofocus />
                        </div>
                        <div class="my-2">
                            <label class="form-label" for="questionContent">문의 내용</label>
                            <textarea class="form-control" 
                                id="questionContent" name="qcontent" rows="5" required></textarea>
                        </div>
                        <div class="my-2">
                            <label class="form-label" for="author">작성자 아이디(받아와야해)</label>
                            <input class="form-control" 
                                type="text" id="author" name="author" required />
                        </div> 
                    </div>
                    <div class="card-footer my-2">
                        <input class="form-control btn btn-outline-primary"
                            type="submit" value="문의 작성" />
                    </div>
                </form>
            </div>
        </main>

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
            crossorigin="anonymous"></script>
    </div>
</body>
</html>