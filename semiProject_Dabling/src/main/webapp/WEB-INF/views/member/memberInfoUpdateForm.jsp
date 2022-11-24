<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
label{
width:100px;
}
</style>
</head>
<body>
	<div class="img">
		<div class="content">
			<h1>내정보 수정</h1>
		</div>
	</div>

	<div class="form">
		<form id="frm" action="memberInfoUpdate.do"
			onsubmit="return formSubmit()" method="post">
			<ul>
				<li><label>회원코드</label><input type="text" id="memberCode"
					name="memberCode" value=${memberCode } disabled></li>
				<li><label>이메일</label><input type="email" id="email"
					name="email" value=${email } disabled></li>
				<li><label>비밀번호</label><input id="password" name="password"
					type="password" required autofocus></li>
				<li><label>비밀번호확인</label><input id="password1" name="password1"
					type="password" required></li>
				<li><label>이름</label><input type="text" id="name" name="name"
					value=${name } disabled></li>
				<li><label>전화번호</label><input id="phone" name="phone"
					type="text" required value=${phone }></li>
				<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
					&nbsp; &nbsp; <input type="submit" class="btn" value="수정하기">
					<input type="reset" class="btn" value="취소">
				</li>
				<li><input type="hidden" id="author" name="author"
					value=${author}></li>

			</ul>

		</form>
	</div>
	<script type="text/javascript">
		function formSubmit() {
			if (document.getElementById('password').value != document
					.getElementById('password1').value) {
				alert("패스워드가 확인값과 일치 하지 않습니다.");
				document.getElementById('password').value = "";
				document.getElementById('password1').value = "";
				document.getElementById('password').focus();
				return false;
			}

			return true;
		}
	</script>
</body>
</html>
