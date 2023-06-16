<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	<div class="btn-group btn-group-lg" role="group" aria-label="Large button group">
	  <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
	  <label class="btn btn-outline-primary" for="btnradio1">오늘</label>
	
	  <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
	  <label class="btn btn-outline-primary" for="btnradio2">1개월</label>
	
	  <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off">
	  <label class="btn btn-outline-primary" for="btnradio3">3개월</label>
	  
	  <input type="radio" class="btn-check" name="btnradio" id="btnradio4" autocomplete="off">
	  <label class="btn btn-outline-primary" for="btnradio4">6개월</label>
	</div>
<hr>
<div>
	<p>
	<button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseWidthExample" aria-expanded="false" aria-controls="collapseWidthExample">
    전통 증류주 500ml 후기
  	</button>
  	</p>
  	<div style="min-height: 120px;">
  		<div class="collapse collapse-horizontal" id="collapseWidthExample">
    		<div class="card card-body" style="width: 300px;">
			  <c:forEach items="${list}" var="review">
			    <span>${review.id}</span>
			    <span>${review.p_id}</span>
			    <span>${review.rcontent}</span>
			    <span>${review.rratings}</span>
			  </c:forEach>
			  <button type="button" class="btn btn-outline-primary">수정하기</button>
			  <section class="my-2 card">
                <div class="card-header fw-bold">
                	<span>관리자 댓글</span>
                    <span id="replyCount">${ post.replyCount }</span>
                    <button class="btn" id="btnToggleReply">
                        <img id="toggleBtnIcon" 
                            src="../static/assets/icons/toggle2-off.svg" 
                            alt="toggle-off" width="32"/>
                    </button>
                </div>
			 </div>
			  <div class="card-body collapse" id="replyToggleDiv">
                    <!-- 관리자 댓글 등록 -->
                    <div class="my-2 row">
                        <label class="form-label" for="replyText">나의 댓글</label>
                        <div class="col-10">
                            <textarea class="form-control" id="replyText"></textarea>
                            <input class="d-none" id="writer" value="admin" /> <!-- TODO: 로그인 사용자 아이디 -->
                        </div>
                        <div class="col-2">
                            <button class="form-control btn btn-outline-success" id="btnAddReply">
                                등록
                            </button>
                        </div>
                    </div>
		</div>
	</div>
	<p>
	<button class="btn btn-primary" type="button" 
	data-bs-toggle="collapse" data-bs-target="#collapseWidthExample"
	aria-expanded="false" aria-controls="collapseWidthExample">
    안동소주 300ml 후기
  	</button>
  	</p>
  	<div style="min-height: 120px;">
  		<div class="collapse collapse-horizontal" id="collapseWidthExample">
    		<div class="card card-body" style="width: 300px;">
			  <c:forEach items="${list}" var="review">
			    <span>${review.id}</span>
			    <span>${review.p_id}</span>
			    <span>${review.rcontent}</span>
			    <span>${review.rratings}</span>
			  </c:forEach>
			  <button type="button" class="btn btn-outline-primary">수정하기</button>
				<section class="my-2 card">
                <div class="card-header fw-bold">
                	<span>관리자 댓글</span>
                    <span id="replyCount">${ post.replyCount }</span>
                    <button class="btn" id="btnToggleReply">
                        <img id="toggleBtnIcon" 
                            src="../static/assets/icons/toggle2-off.svg" 
                            alt="toggle-off" width="32"/>
                    </button>
                </div>
			  	<div class="card-body collapse" id="replyToggleDiv">
                    <!-- 내 댓글 등록 -->
                    <div class="my-2 row">
                        <label class="form-label" for="replyText">나의 댓글</label>
                        <div class="col-10">
                            <textarea class="form-control" id="replyText"></textarea>
                            <input class="d-none" id="writer" value="admin" /> <!-- TODO: 로그인 사용자 아이디 -->
                        </div>
                        <div class="col-2">
                            <button class="form-control btn btn-outline-success" id="btnAddReply">
                                등록
                            </button>
                        </div>
                        
	                        <!-- 댓글 목록 보여줄 영역 -->
	                    <div class="my-2 row" id="replies"></div>
                    </div>
            	</section> <!-- 댓글 등록, 댓글 리스트 카드 -->
			 </div>
		</div>
		
	</div>
 	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" 
            crossorigin="anonymous">
 	</script>
 	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="../static/js/reply.js"></script>
</body>
</html>




















