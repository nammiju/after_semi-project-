<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- h1 부분 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<!-- 나머지 글자 폰트 -->
<link
	href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<!-- table css -->
<link href="assets/css/form.css" rel="stylesheet">
</head>
<body>
	<div class="img">
		<div class="content">
			<h1>메뉴등록</h1>
		</div>
	</div>
	<div class="form">
		<form id="frm1" action="menuInsert.do" method="post"
			enctype="multipart/form-data">
			<ul>
				<li><label>메뉴명</label><input type="text" id="menuName"
					name="menuName" required="required"></li>
				<li><label>대표이미지</label><input type="file" id="menuImage"
					name="menuImage"></li>
				<li><label>가격</label><input type="text" id="price" name="price"
					required="required"></li>
				<li><div class="updateDeleteBtn" align="center">
                  <input type="submit" value="추가" id="update">
                  <input type="button" value="삭제" id="delete">
               </div></li>
			</ul>
		</form>
	</div>

</body>
</html>