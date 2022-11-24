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
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	<!-- 나머지 글자 폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<!-- table css -->
	<link href="assets/css/form.css" rel="stylesheet">
</head>

<body>
	<div class="img">
		<div class="content">
			<h1>메뉴수정</h1>
		</div>
	</div>
	<div class="form">
		<c:if test="${not empty menu.menuName }">
			<form id="frm1" action="menuUpdate.do" method="post" enctype="multipart/form-data">
				<ul>
					<li><label>기존메뉴명</label><input type="text" value="${menu.menuName}" id="menuName" name="menuName"
							readonly="readonly"></li>
					<li><label>변경메뉴명</label><input type="text" value="${menu.menuName}" id="menuReName"
							name="menuReName"></li>
					<li><label>대표이미지</label> <input type="file" value="${menu.menuImage}" id="menuImage"
							name="menuImage">
					</li>
					<li>
						<c:if test="${not empty menu.menuImage }">
							<div id="img" align="center"><img src="${menu.menuImage }"
									style="width: 250px; height: 150px;"></div>
						</c:if>
					</li>
					<li><label>가격</label>
						<input type="text" value="${menu.price}" id="price" name="price" required="required"></li>
					<li>
						<div class="updateDeleteBtn" align="center"><input type="submit" value="수정" id="update">
							<input type="reset" id="delete" value="취소"></div>
					</li>
				</ul>
			</form>
		</c:if>
	</div>
</body>

</html>