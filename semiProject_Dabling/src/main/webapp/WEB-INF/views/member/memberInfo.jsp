<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>내정보 조회</title>
</head>
<body>
	<div class="img">
		<div class="content">
			<h1>${message }</h1>
		</div>
	</div>

	<div class="form">

		<form id="frm">
			<ul>
				<li><label>회원코드</label><input type="text" id="name_input"
					name="name_input" value="${memberCode }" readonly></li>
				<li><label>이메일</label><input type="text" id="name_input"
					name="name_input" value="${email }" readonly></li>
				<li><label>이름</label><input type="text" id="name_input"
					name="name_input" value="${name }" readonly></li>
				<li><label>전화번호</label><input type="text" id="name_input"
					name="name_input" value="${phone }" readonly></li>
					<li hidden></li>
			</ul>
		</form>


	</div>

</body>
</html>