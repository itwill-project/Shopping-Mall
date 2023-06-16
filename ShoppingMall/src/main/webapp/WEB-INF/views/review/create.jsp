<%@ page language="java" contentType="text/html;charset=UTF-8" 
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Review Page</title>
<link rel="stylesheet" type="text/css" href="../static/assets/css/star.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" 
rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" 
crossorigin="anonymous">
</head>
<body>
	<div class="container-fluid">
		<header class="bg-warning p-2 text-dark bg-opacity-50">
			<h1>후기 작성</h1>
		</header>
		<hr>
		<table width="100%" cellpadding='0' cellspacing='0'>
			<tr>
				<td align="left"><font size="2"> 
				<b>상품 이미지</b> 
				<img src="../static/images/a1.JPG" width="150" height="100" alt="a1"> 
				<br /> 
				<br />
						<form name="rratings" id="myform" method="post" action="./create">
							<center>
							<fieldset>
								<legend>별점</legend>
						        <label for="rate1">⭐</label><input type="radio" name="rratings" value="5" id="rate1">
						        <label for="rate2">⭐</label><input type="radio" name="rratings" value="4" id="rate2">
						        <label for="rate3">⭐</label><input type="radio" name="rratings" value="3" id="rate3">
						        <label for="rate4">⭐</label><input type="radio" name="rratings" value="2" id="rate4">
						        <label for="rate5">⭐</label><input type="radio" name="rratings" value="1" id="rate5">
							</fieldset>
							<center>
						</form>
				</td>
			</tr>
		</table>

		<hr>
		<br />
		<main class="my-2">
			<div class="card">
				<div class="card-body">
					<div class="my-2">
						<label class="form-label" for="rcontent">내용</label>
						<textarea class="form-control" id="rcontent" 
						name="rcontent" required placeholder="내용을 입력해주세요.">
                        </textarea>
					</div>
					<div>
						<form name="myForm" method="post" action="uploadFile.jsp" enctype="multipart/form-data">
							<input type="file" name="fileUpload" id="fileUpload"> 
							<input type="submit" value="Upload">
						</form>
					</div>
				</div>
				<div class="d-flex justify-content-center">
					<a class="mx-1 btn btn-outline-danger" href="/joo">취소</a>
					<button type="button" class="mx-1 btn btn-outline-success" id="rcontent">등록</button>
				</div>
			</div>
		</main>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
		</script>
		<script>
        	$(function() {
        		$('#rcontent').click(function() {
        			const rratings = 4;
        			const rcontent = $('#rcontent').val();
        			
        			$.ajax({
        				url: '/joo/review/create',
        				type: 'POST',
        				data: {"rratings": rratings, "rcontent": rcontent},
        				success: function(res) {
        					alert('success');
        				},
        				error: function(error) {
        				alert(error);
        				}
        			});
        		});
        	});
        </script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" 
		crossorigin="anonymous">
		</script>
</body>
</html>


















