<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
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
</head>
<body>
    <div class="container text-center">
        <div
            class="container position-absolute top-50 start-50 translate-middle">

            <form action="/joo/admin/adminCreateProduct" method="post"
                id="formSettingImage">

                <h1>새상품 등록 이미지설정</h1>
                <hr />
                <div class="row p-3">

                    <div class="col-1">
                        <label for="pname"> 제품이름 : </label>
                    </div>
                    <div class="col-3">
                        <input value="${ product.pname }" name="pname"
                            id="pname" type="hidden"
                            class="form-control" readonly /> <strong>[
                            ${ product.pname } ]</strong>
                    </div>
                    <div class="col-1">
                        <label for="pname"> 카테고리 : </label>
                    </div>
                    <div class="col-1">
                        <input value="${ product.pcategory }"
                            name="pcategory" id="pcategory"
                            type="hidden" class="form-control" readonly />
                        <strong>[ ${ product.pcategory } ]</strong>
                    </div>
                    <div class="col-1">
                        <label for="pstock"> 제고수 : </label>
                    </div>
                    <div class="col-1">
                        <input value="${ product.pstock }" readonly
                            name="pstock" id="pstock" type="hidden"
                            class="form-control" /> <strong>[
                            ${ product.pstock } 개]</strong>
                    </div>
                    <div class="col-1">
                        <label for="palc"> 도수 : </label>
                    </div>
                    <div class="col-1">
                        <input value="${ product.palc }" readonly
                            name="palc" id="palc" type="hidden"
                            class="form-control" /> <strong>[
                            ${ product.palc } 도]</strong>
                    </div>
                    <div class="col-1">
                        <label for="pregion"> 원산지 : </label>
                    </div>
                    <div class="col-1">
                        <input value="${ product.pregion }" readonly
                            name="pregion" id="pregion" type="hidden"
                            class="form-control" /> <strong>[
                            ${ product.pregion } ]</strong>
                    </div>
                </div>

                <div class="row p-1">
                    <div class="col-1">
                        <label for="pprice"> 가격 : </label>
                    </div>
                    <div class="col-3">
                        <input value="${ product.pprice }" readonly
                            name="pprice" id="pprice" type="hidden"
                            class="form-control" /> <strong>[
                            ${ product.pprice } 원]</strong>

                    </div>
                    <div class="col-1">
                        <label for="pvolume"> 용량 : </label>
                    </div>

                    <div class="col-3">
                        <input value="${ product.pvolume }" readonly
                            name="pvolume" id="pvolume" type="hidden"
                            class="form-control" /> <strong>[
                            ${ product.pvolume } ]</strong>
                    </div>

                    <div class="col-1">
                        <label for="pdiscount"> 할인률 : </label>
                    </div>

                    <div class="col-3">
                        <input value="${ product.pdiscount }" readonly
                            name="pdiscount" id="pdiscount"
                            type="hidden" class="form-control" /> <strong>[
                            ${ product.pdiscount } %]</strong>
                    </div>
                </div>

                <hr class="p-3" />
                <label for="title_image" class="form-label"> -
                    타이틀 이미지 (1장)) -</label> <input class="form-control"
                    type="file" id="title_image" /> <label
                    for="detail_image" class="form-label"> - 디데일
                    이미지 (1~3장) -</label> <input class="form-control" type="file"
                    id="detail_image" multiple />

                <hr class="p-3" />

                <input class="btn btn-outline-primary" type="button"
                    id="btnCreate" value="등록" /> <input
                    class="btn btn-outline-secondary" type="button"
                    id="btnPrevious" value="이전" /> <input
                    class="btn btn-outline-secondary" type="button"
                    id="btnSkip" value="다음에 설정하기" />
            </form>
        </div>

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
            crossorigin="anonymous"></script>
        <script src="../static/js/adminPage/productImageSetting.js"></script>
    </div>
</body>
</html>