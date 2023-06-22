<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
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
	<body>
	<div>
       <ul class="nav nav-tabs">
            <li class="nav-item">
                <a class="nav-link" href="/joo/product/productsList">제품보기</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/joo/post/postList">공지사항/이벤트</a>
            </li>
        </ul> 

    <main class="my-1 p-5 text-bg-dark">
        <!-- 공지글 상세보기 -->
        <h1 class="text-center">바디(메인베너)</h1>

        <!-- 반복문으로 이벤트 자동으로 만들기 -->
        <div id="carouselExampleIndicators" class="carousel slide"
            data-b s-ride="true">
            <div class="carousel-indicators">
                <button type="button"
                    data-bs-target="#carouselExampleIndicators"
                    data-bs-slide-to="0" class="active"
                    aria-current="true" aria-label="Slide 1"></button>
                <button type="button"
                    data-bs-target="#carouselExampleIndicators"
                    data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button"
                    data-bs-target="#carouselExampleIndicators"
                    data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            
            <!-- justify-content: center; align-items: center; -->
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <a href="/joo/post/postDetail"> <img
                        src="./static/assets/bannerImages/001.jpg"
                        class="d-block w-100" alt="bannerImege01">
                    </a>
                </div>
                <div class="carousel-item">
                    <a href="/joo/post/postDetail"> <img
                        src="./static/assets/bannerImages/002.jpg"
                        class="d-block w-100" alt="bannerImege02">
                    </a>
                </div>
                <div class="carousel-item">
                    <a href="/joo/post/postDetail"> <img
                        src="./static/assets/bannerImages/003.jpg"
                        class="d-block w-100" alt="bannerImege03">
                    </a>
                </div>
                <!--채한별 : 이거 참조용. 해볼게여 -->
                <%-- <div class="carousel-item">
                    <a href="/joo/post/postDetail"> 
                    <video src="${pageContext.request.contextPath}/static/video/logoMainVideo.mp4" controls muted autoplay loop alt="메인영상"  style="width: 70%; height: auto;">
                    </a>
                </div> --%>
            </div>
            <button class="carousel-control-prev" type="button"
                data-bs-target="#carouselExampleIndicators"
                data-bs-slide="prev">
                <span class="carousel-control-prev-icon"
                    aria-hidden="true"></span> <span
                    class="visually-hidden">Previous</span>
                    
            </button>
            <button class="carousel-control-next" type="button"
                data-bs-target="#carouselExampleIndicators"
                data-bs-slide="next">
                <span class="carousel-control-next-icon"
                    aria-hidden="true"></span> <span
                    class="visually-hidden">Next</span>
            </button>
        </div>

    </main>
                        <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>

	</div>
	</body>
</html>