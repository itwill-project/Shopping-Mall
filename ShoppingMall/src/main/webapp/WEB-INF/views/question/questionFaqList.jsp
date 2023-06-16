<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>주류 FAQ</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #000000; /* 검정색 배경 */
            color: #ffffff; /* 밝은색 글자 */
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 40px;
            background-color: #333333; /* 어두운 배경 */
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #ffffff; /* 밝은색 글자 */
            font-size: 32px;
            margin-bottom: 30px;
            text-transform: uppercase;
            letter-spacing: 2px;
        }
        .list-group-item {
            border: none;
            padding: 30px;
            background-color: #444444; /* 어두운 배경 */
            margin-bottom: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .list-group-item h4 {
            color: #ffffff; /* 밝은색 글자 */
            font-size: 24px;
            margin-bottom: 20px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        .list-group-item p {
            color: #cccccc; /* 밝은 회색 글자 */
            font-size: 18px;
            line-height: 1.5;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h1>주류 FAQ</h1>
        <ul class="list-group mt-4">
            <li class="list-group-item">
                <h4>주류를 구매하려면 어떻게 해야 하나요?</h4>
                <p>주류를 구매하려면 온라인 쇼핑몰에 접속하여 원하는 주류를 선택한 후 주문 절차를 따르시면 됩니다.</p>
            </li>
            <li class="list-group-item">
                <h4>주류의 배송은 어떻게 이루어지나요?</h4>
                <p>주류의 배송은 주문한 주소로 택배 또는 우편을 통해 이루어집니다. 일반적으로 배송 시 일정 기간이 소요됩니다.</p>
            </li>
            <li class="list-group-item">
                <h4>주류의 교환 또는 환불은 가능한가요?</h4>
                <p>주류의 교환 또는 환불은 상품의 상태에 따라 가능할 수 있습니다. 자세한 사항은 고객센터에 문의하시기 바랍니다.</p>
            </li>
            <li class="list-group-item">
                <h4>주류의 유통기한은 어떻게 확인하나요?</h4>
                <p>주류의 유통기한은 제품 포장에 표시되어 있습니다. 유통기한이 지난 제품은 섭취하지 않는 것이 좋습니다.</p>
            </li>
            <li class="list-group-item">
                <h4>주류의 온라인 주문 취소는 가능한가요?</h4>
                <p>주류의 온라인 주문 취소는 주문 절차에 따라 가능할 수 있습니다. 주문 상태와 시점에 따라 제한이 있을 수 있으니 빠른 처리를 권장합니다.</p>
            </li>
        </ul>
    </div>
</body>
</html>
