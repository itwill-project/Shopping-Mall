<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>create</title>
        <link 
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" 
            rel="stylesheet" 
            integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" 
            crossorigin="anonymous">
    </head>
    <body>
    
		<div class="panel" style="margin-left: 1px;">
	        <header class="my-2 p-5 text-center text-bg-dark">
				<h1 class="page-header">등록 페이지</h1>
	        </header>
			
			<div id="contAreaBox">
				<div class="panel">
					<div class="panel-body">
						<form role="form" action="/joo/admin/postCreate" method="post">
							<div class="table-responsive" style="text-align: center;">
								<table id="datatable-scroller" class="table table-bordered tbl_Form">
									<caption></caption>
									<colgroup>
										<col width="250px" />
										<col />
									</colgroup>
									
									<tbody>
										<!-- <tr>
											<th class="active">타입</th>
											<td class="form-inline">
												<input type="text" id="type" name="type" class="form-control" style="width: 500px" 
												 required autofocus placeholder="공지 또는 이벤트라고 작성하시오" />
											</td>
										</tr> -->
										<tr>
										<th><label for="btype">타입</label></th>
										<td class="text-start">
											<select name="btype" id="btype" style="width: 300px;">
												<option value="공지">공지</option>
												<option value="이벤트">이벤트</option>
											</select>
										</td>
										</tr>
										<tr>
											<th class="active">제목</th>
											<td class="form-inline">
												<input type="text" id="btitle" name="btitle" class="form-control" style="width: 840px" required />
											</td>
										</tr>
										<!-- <tr>
											<th class="active">작성자</th>
											<td class="form-inline">
												<input type="text" id="writer" name="writer" class="form-control" style="width: 500px" />
											</td>
										</tr> -->
										
										<tr>
											<th class="active">내용</th>
											<td class="form-inline">
												<textarea id="bcontent" name="bcontent" cols="100" rows="10" class="form-control" required></textarea>
											</td>
										</tr>
										<tr>
											<th class="active">파일첨부</th>
											<td class="form-inline">

											<div class="form-group uploadDiv text-start" >
												<input type="file" name="uploadFile" id="uploadFile" multiple />
											</div>
											<div class="uploadResult">
												<ul></ul>
											</div>

										</td>
										</tr>
										
									</tbody>
								</table>
							</div>

						<div style="margin-left: 1px;">
								<button type="submit" class="btn btn-primary">등록</button>
								<a href="/joo/post/postList" class="btn btn-danger">취소</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" 
            crossorigin="anonymous">
		</script>
            
         <script src="https://cdn.ckeditor.com/ckeditor5/31.1.0/classic/ckeditor.js"></script>
    </body>
</html>
