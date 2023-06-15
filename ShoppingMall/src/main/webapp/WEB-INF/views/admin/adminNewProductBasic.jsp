<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
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
        <div class="container text-center">

            
            
            <!-- 새상품 등록 -->
            <form action="/joo/admin/adminNewProductImage" id="formCreatNewProduct" method="get" > 
            
                <div class="container position-absolute top-50 start-50 translate-middle">
                    <h1>새상품 등록 기본설정</h1>
                    <hr/>
                    <div class="row p-3">
                    
                        <div class="col-1">
                            <label for="pname">
                            제품이름 : 
                            </label>
                        </div>
                        <div class="col-5">
                            <input name="pname" id="pname" type="text" class="form-control"
                            placeholder="20글자 이하로 적어주세요" autofocus/>
                        </div>
                        <div class="col-6">
                            <select name="pcategory" id="pcategory" class="form-select" aria-label="Default select example">
                                <option selected>--카테고리--</option>
                                <option value="소주">소주</option>
                                <option value="맥주">맥주</option>
                                <option value="와인">와인</option>
                                <option value="전통주">전통주</option>
                                <option value="기타">기타</option>
                            </select>
                        </div>
                    </div>       
                
                    <div class="row p-1">
                        <div class="col-1">
                            <label for="pprice">
                            가격 : 
                            </label>
                        </div>
                        <div class="col-5">
                            <input name="pprice" id="pprice" type="number" class="form-control"
                            placeholder="6자리 이하의 숫자로 적어주세요" />
                        </div>
                        
                        <div class="col-1">
                            <label for="palc">
                            도수 : 
                            </label>
                        </div>
                        <div class="col-2">
                            <input name="palc" id="palc" type="number" class="form-control"
                            placeholder="도수 숫자" />
                        </div>
                        
                        <div class="col-3">
                            <select name="pregion" id="pregion" class="form-select" aria-label="Default select example">
                                <option selected>--원산지--</option>
                                <option value="서울">서울</option>
                                <option value="경기">경기</option>
                                <option value="강원">강원</option>
                                <option value="충청">충청</option>
                                <option value="전라">전라</option>
                                <option value="경상">경상</option>
                                <option value="제주">제주</option>
                                <option value="기타">기타</option>
                            </select>
                        </div>
                    </div>
                
                    <div class="row p-1">
                        <div class="col-1">
                            <label for="pstock">
                            제고수 : 
                            </label>
                        </div>
                        
                        <div class="col-5">
                            <input name="pstock" id="pstock" type="text" class="form-control"
                            placeholder="5자리 이하의 숫자로 적어주세요" />
                        </div>
                        
                        <div class="col-1">
                            <label for="pvolume">
                            용량 : 
                            </label>
                        </div>
                        
                        <div class="col-2">
                            <input name="pvolume" id="pvolume" type="text" class="form-control"
                            placeholder="용량 예시) 350ml" />
                        </div>
                        
                        <div class="col-1">
                            <label for="pdiscount">
                            할인률 : 
                            </label>
                        </div>
                        
                        <div class="col-2">
                            <input name="pdiscount" id="pdiscount" type="number" class="form-control"
                            placeholder="할인률 예시) 10" />
                        </div>
                    </div>       

                    <hr class="p-3"/>                    
                    
                    <input class="btn btn-outline-primary" type="submit" id="btnNext" value="다음"/>
                    <input class="btn btn-outline-secondary" type="button" id="btnPrevious" value="취소"/>
                </div>
            </form>
            
            
        </div>
        <br/>
                
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
            crossorigin="anonymous"></script>
        <script src="../static/js/adminPage/productBasicSetting.js"></script>              
    </body>
</html>