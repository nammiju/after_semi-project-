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
height {
	height: 800px;
}
</style>
</head>
<body>
	<div class="height">
		<div class="img">
			<div class="content">
				<h1>메뉴수정</h1>
			</div>
		</div>

		<div class="form">
			<form id="frm" action="menuUpdateForm.do" method="post"
				enctype="multipart/form-data">
				<ul>
					<li><label>메뉴명 검색</label><input type="text" id="menuName"
						name="menuName" hidden="" /> <select id="menuNameSelect"
						name="menuNameSelect" required autofocus
						onchange="selectBoxChange(this.value);">
							<option value="none">=== 수정메뉴 ===</option>
							<c:forEach var="menu" items="${menuList}">
								<option id="menuName" name="menuName" value="${menu.menuName}">${menu.menuName}</option>
							</c:forEach>
					</select> <input type="submit" value="검색" id="search"></li>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		//DB검색 출력
		function selectBoxChange(value) {
			console.log(value);
			$('#menuName').val(value);
		}
	</script>
</body>
</html>