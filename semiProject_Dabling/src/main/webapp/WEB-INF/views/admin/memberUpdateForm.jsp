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
</style>
</head>

<body>
	<div class="img">
		<div class="content">
			<h1>회원정보수정</h1>
		</div>
	</div>
	<div class="form">
		<form id="frm" action="memberSelect.do" onsubmit="return formSubmit()"
			method="get">
			<ul>
				<li><label>회원번호</label><input type="number" name="memberCode">
					<input type="hidden" name="job" value="memberUpdate"> <input
					type="submit" class="btn" value="조회"></li>
				<li hidden>빔일li</li>
			</ul>
		</form>
		<form id="frm1" action="memberUpdate.do" method="post">
			<ul>
				<li><label>회원번호</label><input type="text" name="memberCode"
					value="${member.memberCode }" readonly></li>
				<li><label for="email">이메일</label><input type="text" id="email"
					name="email" value="${member.email}"></li>
				<li><label>비밀번호</label><input type="text" name="password"
					value="${member.password}"></li>
				<li><label>이름</label><input type="text" name="name"
					value="${member.name }"></li>
				<li><label>전화번호</label><input type="text" name="phone"
					value="${member.phone }"></li>
				<li><label>사업자번호</label><input type="text" name="businessNum"
					value="${member.businessNum }"></li>
				<li><label>권한</label><input type="number" name="author"
					value="${member.author }"></li>
				<li
					style="display: inline-block; margin-left: 50px; text-align: center;"><input
					type="submit" class="btn1" value="수정" onclick="alert('수정이 완료되었습니다.')"></li>
				<li hidden>빔일li</li>
			</ul>
		</form>
	</div>
</body>

</html>