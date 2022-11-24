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
<style>
</style>
</head>
<body>

	<div class="img">
		<div class="content">
			<h1>공지사항수정</h1>
		</div>
	</div>
	<div class="form">
		<form id="frm" action="noticeUpdate.do" method="POST">
			<ul>
				<li><label>제목</label> <textarea name="title"
						placeholder="제목을 입력하세요.." value="${notice.title }">${notice.title }</textarea></li>
				<li><label>내용</label> <textarea name="cont"
						placeholder="내용을 입력하세요.." style="height: 200px">${notice.cont }</textarea></li>
				<li
					style="display: inline-block; margin-left: 33px;  text-align: center;"><input
					type="submit" value="수정" onclick="alert('수정되었습니다.')" class="btn">
					<input type="reset" value="초기화" class="btn"></li>
				<li><input type="hidden" name="noticeCode"
					value="${notice.noticeCode }"></li>
			</ul>

		</form>
	</div>






</body>
</html>
