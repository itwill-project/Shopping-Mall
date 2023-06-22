<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 부트스트랩 -->
<title>JOO</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
    crossorigin="anonymous">
<link rel="stylesheet" href="../static/css/productDetailQuestionsList.css" />
 
</head>
<body>
    <div>
             <header>
           <jsp:include page="../common/header.jsp"></jsp:include>
             </header>
        

        <main class="text-bg-dark p-3 my-2">

            <!-- main head : 사진과, 결제창 -->
            <div class="container text-center">
                <div class="row">

                    <!-- 이미지 영역 -->
                    <div class="col-md-8">
                        <div>
                            <img src="${product.ptitle_Iamge}"
                                class="img-fluid" alt="headImage"
                                style="width: 400px; height: 400px;">
                        </div>
                    </div>

                    <!-- 결제/상세 설명 영역 -->
                    <div class="col-6 col-md-4">
                        <h1>
                            <strong>${ product.pname }</strong>
                        </h1>
                        <div>${ product.pvolume }</div>
                        <hr />
                        <c:set var="pstock" value="${ product.pstock }" />
                        <c:choose>
                            <c:when test="${ pstock != 0 }">
                                <div class="dropdown-center">

                                    <select
                                        class="form-select form-select-sm"
                                        aria-label=".form-select-sm example"
                                        id="selctProductOption">
                                        <option value="0" selected>[필수]옵션을
                                            선택해 주세요</option>
                                        <option value="1">기본 :
                                            ${ product.pvolume }
                                            ---------- ${ product.pprice }원</option>
                                    </select>
                       
                             
                                    <div>
                                        <!-- 옵션 클릭시 제품이 추가되는 부분 -->

                                        <div id="addProductBasicOption"
                                            class="d-none">
                                            <input id="pvolume"
                                                type="hidden"
                                                value="${ product.pvolume }" />
                                            <input id="pprice"
                                                type="hidden"
                                                value="${ product.pprice }" />
                                            <hr />
                                            <div>

                                                ${ product.pname } <br />
                                                용량 : ${ product.pvolume }
                                                / 가격 : ${ product.pprice }

                                                <br />
                                                <div
                                                    class="container text-center">

                                                    <div class="row">
                                                        <div class="col">
                                                            <button
                                                                id="btnMinus"
                                                                class="btn btn-outline-primary">-</button>
                                                        </div>
                                                        <div class="col">
                                                            <span
                                                                id="productCount">0</span>
                                                        </div>
                                                        <div class="col">
                                                            <button
                                                                id="btnPlus"
                                                                class="btn btn-outline-primary">+</button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <br /> 총금액 : <span
                                                    id="finalPrice"></span>
                                            </div>
                                            <hr />
                                        </div>

                                    </div>
                                    <br />
                                    <input type="hidden" id="basketId" value="${ basketId }"/>
                                    <input type="hidden" value="${ product.id }" id="productId"/>
                                    <div class="d-grid gap-2 d-md-block">
                                        <button class="btn btn-primary"
                                            id="btnOrder" type="button">주문하기</button>
                                        <button class="btn btn-primary"
                                            type="button" id="btnAddToBasket">장바구니</button>
                                    </div>
                                </div>
                            </c:when>

                            <c:when test="${ pstock == 0 }">
                                <div>
                                    <h1>매진된 상품입니다.</h1>
                                </div>
                            </c:when>
                        </c:choose>

                    </div>



                </div>
            </div>

            <!-- main body : 사진으로 된 설명 페이지-->
            <div class="mainBody">
                <hr />
                <nav class="nav nav-pills nav-justified bg-dark navbar sticky-top"  id="productNav">
                    <a id="viewProductDetail"  href="#productDetail" class="nav-link" >상품 상세보기</a> 
                    <a id="viewProductReiview" href="#reviews" class="nav-link">후기보기</a>
                    <a id="viewProductQuestion" href="#question" class="nav-link">문의보기</a>
                </nav>
                <!-- main foot : 약관및 기타 정보(배송비및 교환환불)사항 -->
                <br />
                <!-- 상품 상세정보 -->
                <div data-bs-spy="scroll" data-bs-target="#productNav" data-bs-offset="0" class="scrollspy-example" tabindex="0">
                <div id=productDetail>
                    <img src="${ product.pdetail_Iamge }"
                        class="rounded mx-auto d-block" alt="bodyImage">
                </div>
                <div class="mainFoot">
                    <hr />
                    <div>
                        <img id="productDetail"
                            src="../static/assets/porducts/add/1.png"
                            class="rounded mx-auto d-block"
                            alt="footImage">
                    </div>
                </div>
                
                    <!-- 리뷰 -->
                    <div id="reviews" class="container-fluid d-flex align-items-center justify-content-center">
					  <div class="card my-2 p-1 text-left" style="background-color: #343A40; width: 80%;">
					    <h2 class="text-center" style="color: #fff;">&lt;${product.pname}&gt; 리뷰문의 (총 ${reviewList.size()}건)</h2>
					    <div class="d-flex justify-content-center"> 
					      <table class="card-body table table-dark text-center">
							  <thead>
							    <tr>
							      <th scope="col">#</th>
							      <th scope="col">답변 여부</th>
							      <th scope="col" style="text-align: center;">리뷰 내용</th>
							      <th scope="col" style="text-align: right;">별점</th>
							      <th scope="col" style="text-align: right;">작성일자</th>
							    </tr>
							  </thead>
							  <tbody>
							    <c:forEach items="${reviewList}" var="review">
							      <tr style="font-weight: bold;">
							        <td class="align-middle">${review.id}</td>
							        <td class="align-middle">${review.review_reply}</td>
							        <td class="align-middle" style="text-align: center;">${review.rcontent}</td>
							        <td class="align-middle" style="text-align: right;">${review.rratings}</td>
							        <td class="align-middle" style="text-align: right;">${review.rcreated_time}</td>
							      </tr>
							    </c:forEach>
							  </tbody>
							</table>
					</div>
                    <!-- 문의 -->
                    <div id="question" class="container-fluid">
                                <div class="card my-2 p-1 text-left" style="background-color: #343A40;">
                                    <h2 class="text-center" style="color: #fff;">&lt;${product.pname}&gt; 상품문의 (총 ${questionsList.size()}건)</h2>
                                
                                    <table class="card-body table"style="background-color: #343A40;" id="QuestionsList">
                                        <thead>
                                            <tr>
                                                <th scope="col">번호</th>
                                                <th scope="col">답변여부</th>
                                                <th scope="col">문의 유형</th>
                                                <th scope="col">작성자 아이디</th>
                                                <th scope="col">등록일자</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${questionsList}" var="question" >
                                                <tr style= font-weight: bold;">
                                                    <td style="color: #b69ccc; font-weight: bold;">${question.id}</td>
                                                    <td style="color: #b69ccc; font-weight: bold;">${question.is_answered}</td>
                                                    <td style="color: #b69ccc; font-weight: bold;">
                                                        <sec:authentication property="principal.username" var="login_id" />
                                                        <c:set value="${question.login_id}" var="qlogin_id" />
                                                        <c:url var="QuestionDetailPage" value="/questions/questionDetail">
                                                            <c:param name="p_id" value="${question.id}" />
                                                        </c:url>
                                                        <c:choose>
                                                            <c:when test="${login_id == qlogin_id}">
                                                                <a href="${QuestionDetailPage}" style="color: #a43c0c; font-weight: bold;">${question.qtype}</a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                ${question.qtype}
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td style="color: #b69ccc; font-weight: bold;">${question.login_id}</td>
                                                    <td style="color: #b69ccc; font-weight: bold;"><fmt:formatDate value="${question.qcreated_time}" pattern="yyyy-MM-dd HH:MM:mm" /></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="row pt-3">
                                <div class="col-2"></div>
                                    <div class="text-end">
                                        <button type="button" id="QuestionCreateBtn" class="btn btn-lg btn-outline-secondary" style="text-align: center; margin-right: 45px;" onclick="questionCreate();">< ${product.pname} >문의 작성</button>
                                    </div>

                                
                                <div class="pull-right">
                                    <ul class="pagination">
                                        <c:if test="${pageMaker.prev}">
                                            <li class="page-item"><a class="page-link" href="${pageMaker.startPage - 1}"> 이전 </a></li>
                                        </c:if>
                                        <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
                                            <li class="page-item ${pageMaker.cri.pageNum == num ? 'active' : ''}">
                                                <a class="page-link" href="${num}" style="color: #b69ccc; font-weight: bold;">${num}</a>
                                            </li>
                                        </c:forEach>
                                        <c:if test="${pageMaker.next}">
                                            <li class="page-item"><a class="page-link" href="${pageMaker.endPage + 1}"> 다음 </a></li>
                                        </c:if>
                                    </ul>
                                </div>
                            </div>

                    <form id="actionForm" action="/joo/post/postList" method="get">
                        <input type="hidden" name="pageNum" value="${ pageMaker.cri.pageNum }" /> 
                        <input type="hidden" name="amount" value="${ pageMaker.cri.amount }" /> 
                        <input type="hidden" name="category" value="${ pageMaker.cri.category }" />
                        <input type="hidden" name="keyword" value="${ pageMaker.cri.keyword }" />
                    </form>

                </div>
                <div class="text-center">
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <!-- TODO : 페이지 번호 생성  JavaScript 코드 삽입  -->
                        </ul>
                    </nav>
                </div>
                <div class="text-end">



                    <script> 
    function questionCreate() {
    var principal = '<%=request.getUserPrincipal()%>';
    if (!principal || principal === 'null') {
    var con = confirm("로그인을 하셔야 문의를 남길 수 있습니다");
        if (con) {
            location.href = "/joo/user/login"
            }
                } else {
        location.href = "/joo/questions/questionCreate?pid=${productId}";
            }
        }
</script>

        </main>


   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
         $(function() {
       
         	  $('#btnAddToBasket').click(function() {
         	    const b_id = $('#basketId').val();
         	    const p_id = $('#productId').val();
         	    const pcount = $('#productCount').text().match(/\d+/);
         	    const count = parseInt(pcount, 10);
         	    //alert(b_id + " " + p_id + " " + count);
         	    
         	    const param = {"b_id": b_id, "p_id": p_id, "pcount": count};
         	   
         	    // AJAX 요청 전에 장바구니에 동일한 제품이 있는지 확인
         	    $.ajax({
         	      url: '/joo/user/updatePcount',
         	      type: 'POST',
         	      data: JSON.stringify(param),
         	      contentType: 'application/json',
         	      success: function(response) {
	            	    	if(confirm('상품 추가 완료. 장바구니로 이동할까요?')) {
	            	    		window.location.href='/joo/user/myBasket';
	            	    	} else {
	            	    		window.location.href = window.location.href;
	            	    	}
         	      },
         	      error: function(error) {
         	        alert(error);
         	      }
         	    });
         	  });
         	});

        
         	function updatePcount() {
         		const id = $('#userId').val();
         	    const b_id = $('#basketId').val();
         	    const p_id = $( '#product.id').val();
         	    const pcount = $('#selectpcount').val();
         	    
         	    const param = {"b_id": b_id, "p_id": p_id, "pcount": pcount};
         		
         		alert('update');
         		
         	  $.ajax({
         	    url: '/joo/user/updatePcount',
         	    type: 'POST',
         	    data: JSON.stringify(param),
         	    contentType: 'application/json',
         	    success: function(res) {
         	    	
         	    	
         	    	
         	    },
         	    error: function(error) {
         	      alert(error);
         	    }
         	  });
         	}
        </script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
        <script>const pid = ${ productId }</script>
        <script src="../static/js/productPage/ProductDetailPage.js"></script>
    </div>
</body>
</html>

        <footer class="my-1 p-3 text-bg-dark">
            <jsp:include page="../common/footer.jsp"></jsp:include>
        </footer>