<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
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
            <h1>관리자 페이지</h1>
            <hr/>
                <select id="menu" class="form-select form-select-lg mb-3"
                    aria-label=".form-select-lg example">
                    <option selected>관리자 기능을 선택하시오</option>
                    <option value="product">상품관리</option>
                    <option value="user">유저관리</option>
                    <option value="question">문의관리</option>
                    <option value="review">리뷰관리</option>
                    <option value="post">게시글 관리</option>
                </select>
                
                <!-- 선택지에 따라서 하단에 리스트 표시 -->
                <!-- 클릭이 되었을때, 레스트컨트롤러로 해당 db에서 값을 읽어온다. -->
                <!-- div를 하나만 설정하고, 그 id를 받아서 해당값 innerhtml을 변경시킨다. -->
                
                <div id ="selectedContens"></div>
                
                <!-- 상품 수정위한 모달 -->
                <div class="modal fade" id="productUpdateModal" 
                    data-bs-backdrop="static" data-bs-keyboard="false"
                    tabindex="-1" >
                    <div class="modal-dialog">
                        <div class="modal-content">
                        
                            <div class="modal-header">
                                <h1 class="modal-title fs-5"
                                    id="staticBackdropLabel">수정하기</h1>
                                <button type="button" class="btn-close"
                                    data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                
                                    <input id="PUMp_id" class="d-none"/>
                                <!-- 내용 체울 부분 -->
                                <div class="mb-3" >                                
                                    <label for="PUMpname" class="form-label">
                                    상품이름 : 
                                    </label>
                                    <input type="text" id="PUMpname" class="form-control" autofocus required placeholder="수정할 상품 이름을 입력하세요"/>
                                </div>
                                
                                <div class="mb-3" >                                
                                    <label for="PUMpprice" class="form-label">
                                        상품 가격 : 
                                    </label>
                                    <input type="number" id="PUMpprice" class="form-control" required placeholder="수정할 상품 가격을 입력하세요"/>
                                </div>
                                
                                <div class="mb-3" >                                
                                    <label for="PUMpdiscound" class="form-label">
                                        상품 할인율 : 
                                    </label>
                                    <input type="number" id="PUMpdiscound" class="form-control" required placeholder="수정할 상품 할인율 입력하세요"/>
                                </div>
                                
                                <div class="mb-3" >                                
                                    <label for="PUMpstock" class="form-label">
                                        상품 제고수 : 
                                    </label>
                                    <input type="number" id="PUMpstock" class="form-control" required placeholder="수정할 상품 제고수를 입력하세요"/>
                                </div>
                            
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary"
                                    data-bs-dismiss="modal">취소</button>
                                <button type="button" class="btn btn-primary" id="btnProductUpdate">수정완료</button>
                            </div>
                            
                        </div>
                    </div>
                </div>
                
            
            <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
                crossorigin="anonymous"></script>
            <script src="../static/js/adminPage/adminPage.js"></script>
            <script src="../static/js/adminPage/questionModify.js"></script>
        </div>
    </body>
</html>