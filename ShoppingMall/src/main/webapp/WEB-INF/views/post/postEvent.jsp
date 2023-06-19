<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
	<!-- 6월 12일 -->
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1"> <!-- 부트스트랩 -->
		<title>JOO</title>
		<link
			href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
			rel="stylesheet"
			integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
			crossorigin="anonymous">
	</head>
	<body>
		<div>
            <header class="my-1 p-3 text-bg-dark">
            <div>
                <nav class="navbar navbar-expand-lg bg-secondary">
                    <div class="container-fluid">
                        <!-- 홈과 로고클릭시 메인페이지로 이동 -->
                        <a class="navbar-brand" href="/joo/">로고</a>
                        <button class="navbar-toggler" type="button"
                            data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedcontent"
                            aria-controls="navbarSupportedcontent"
                            aria-expanded="false"
                            aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        
                        <div class="collapse navbar-collapse"
                            id="navbarSupportedcontent">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                <li class="nav-item"><a
                                    class="nav-link active"
                                    aria-current="page" href="/joo/">Home</a>
                                </li>
                                
                                <!-- TODO : 로그인 회원가입 링크로 이동(로그인상태일때 비가시화) -->
                                <li class="nav-item"><a
                                    class="nav-link" href="/joo/user/sign">로그인/회원가입</a></li>
                                    
                                <li class="nav-item dropdown"><a
                                    class="nav-link dropdown-toggle"
                                    href="#" role="button"
                                    data-bs-toggle="dropdown"
                                    aria-expanded="false"> 마이페이지
                                </a>
                                    <ul class="dropdown-menu">
                                        <li><a
                                            class="dropdown-item"
                                            href="/joo/user/myPrivate">개인정보 수정</a></li>
                                        <li><a
                                            class="dropdown-item"
                                            href="/joo/user/myGrade">적립금 확인</a></li>
                                        <li><a
                                            class="dropdown-item"
                                            href="/joo/user/myOrder">주문 내역</a></li>
                                        <li><a
                                            class="dropdown-item"
                                            href="/joo/user/myQuseries">문의 내역</a></li>
                                        <li><hr class="dropdown-divider"></li>
                                        <li><a
                                            class="dropdown-item"
                                            href="/joo/user/myBasket">장바구니</a></li>
                                        
                                    </ul>
                                    </li>
                                <!-- 최근본 상품은 모달로 처리 -->
                                <li class="nav-item"><a class="nav-link" href="">최근본상품</a></li>
                                <li class="nav-item"><a class="nav-link" href="">문의하기</a></li>
                            </ul>
                            <!-- 검색 페이지 -->
                            <form class="d-flex" role="search" action="/joo/product/productsList">
                                <input class="form-control me-2"
                                    type="search" placeholder="제품 검색"
                                    aria-label="Search" id="searchText">
                                <button class="btn btn-outline-success" type="submit">search</button>
                            </form>
                        </div>
                    </div>
                </nav>  
            </div>
            <h3 class="text-center">게시글 리스트</h3>
            </header>
            <!-- 카테고리 네비 -->
            <ul class="nav nav-tabs">
    
                <li class="nav-item dropdown"><a
                    class="nav-link dropdown-toggle"
                    data-bs-toggle="dropdown" href="#" role="button"
                    aria-expanded="false">카테고리</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/joo/product/productsList">모아보기</a></li>
                        <li><a class="dropdown-item" href="/joo/product/productsList">소주</a></li>
                        <li><a class="dropdown-item" href="/joo/product/productsList">맥주</a></li>
                        <li><a class="dropdown-item" href="/joo/product/productsList">와인</a></li>
                        <li><a class="dropdown-item" href="/joo/product/productsList">양주</a></li>
                    </ul></li>
                <li class="nav-item"><a class="nav-link" href="/joo/product/productsNewList">신상</a>
                </li>
                <li class="nav-item"><a class="nav-link" href="/joo/product/productsHotList">랭킹</a></li>
                <li class="nav-item"><a class="nav-link" href="/joo/post/postList">공지사항/이벤트</a></li>
            </ul>
            
            
            <ul class="nav nav-tabs">
                <li class="nav-item"><a class="nav-link" href="/joo/post/postList">전체보기</a></li>
                <li class="nav-item"><a class="nav-link" href="/joo/post/postNotice">공지사항</a></li>
            	<li class="nav-item"><a class="nav-link" href="/joo/post/postEvent">이벤트</a></li>
            </ul>

		<main>
			<div class="card">
				<div class="table-responsive">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">타입</th>
								<th scope="col">제목</th>
								<th scope="col">내용</th>
								<!-- <th scope="col">글쓴이</th> -->
								<th scope="col">등록 일자</th>
								<th scope="col">종료 일자</th>
								<th scope="col">조회수</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach items="${ boards }" var="board">
								<tr class="odd gradex">
									<td>${ board.id }</td>
									<td>${ board.btype }</td>
									<td>
									<c:url var="postDetailPage" value="/post/postDetail">
                                        <c:param name="id" value="${ board.id }" />
                                    </c:url>
									<a href="${ postDetailPage }">${ board.btitle }</a>
									</td>
									<td>${ board.bcontent }</td>
									<%-- <td>${ board.writer }</td> --%>
									<td><fmt:formatDate value="${ board.bcreated_time }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td><fmt:formatDate value="${ board.bmodified_time }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td>${ board.bviewed }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
						<a href="/joo/admin/postCreate" class="btn btn-primary me-md-2">등록</a>
					</div>
					<h3></h3>
					<%-- <h3>${ pageMaker }</h3> --%>
					<form id="searchForm" action="/joo/post/postEvent" method="get">
						<select name="category">
							<option value="" ${ pageMaker.cri.category == null ? "selected" : "" }>전체</option>
							<option value="T" ${ pageMaker.cri.category eq 'T' ? "selected" : "" }>제목</option>
							<option value="C" ${ pageMaker.cri.category eq 'C' ? "selected" : "" }>내용</option>
							<option value="TC" ${ pageMaker.cri.category eq 'TC' ? "selected" : "" }>제목+내용</option>

						</select> 
							<input type="text" name="keyword" value="${ pageMaker.cri.keyword }"> 
							<input type="hidden" name="pageNum" value="${ pageMaker.cri.pageNum }"> 
							<input type="hidden" name="amount" value="${ pageMaker.cri.amount }">
						<button class="btn btn-outline-success">검색</button>
					</form>

					<h3></h3>

					<div class="pull-right">
						<ul class="pagination">
							<c:if test="${ pageMaker.prev }">
								<li class="page-item"><a class="page-link"
									href="${ pageMaker.startPage -1 }">이전</a>
								</li>
							</c:if>
							<c:forEach begin="${ pageMaker.startPage }"
								end="${ pageMaker.endPage }" var="num">
								<li class="page-item ${ pageMaker.cri.pageNum == num ? "active" : "" } ">
									<a class="page-link" href="${ num }">${ num }</a>
								</li>
							</c:forEach>
							<c:if test="${ pageMaker.next }">
								<li class="page-item"><a class="page-link"
									href="${ pageMaker.endPage +1 }">다음</a></li>
							</c:if>
						</ul>
					</div>
					<form id="actionForm" action="/joo/post/postEvent" method="get">
						<input type="hidden" name="pageNum" value="${ pageMaker.cri.pageNum }" /> 
						<input type="hidden" name="amount" value="${ pageMaker.cri.amount }" /> 
						<input type="hidden" name="category" value="${ pageMaker.cri.category }" />
						<input type="hidden" name="keyword" value="${ pageMaker.cri.keyword }" />
					</form>
				</div>
			</div>
		</main>



		<footer class="my-1 p-3 text-bg-dark">
            <!-- 기업정보, 홈 인스타, 페이스북, 등등 필한거 -->
                <h1 class="text-center">풋터</h1>
            
                <a href="">home</a>
            </footer>
			
			<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
			crossorigin="anonymous">
			</script>
			
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" ></script>
			
			<script type="text/javascript">
			$(document).ready(function() {
				var actionForm = $("#actionForm");
				
				$(".page-link").on("click", function(e){
					e.preventDefault();
					
					var targetPage = $(this).attr("href");
					console.log(targetPage);
					
					actionForm.find("input[name='pageNum']").val(targetPage);
					actionForm.submit();
					
				});
				
				var searchForm = $("#searchForm");
					$("#searchForm button").on("click", function (e) {
						e.preventDefault();
						console.log("click");
						searchForm.find("input[name='pageNum']").val(1);
						searchForm.submit();
				});
				
				
			});
			
			</script>
			
			
			
		</div>
	</body>
</html>