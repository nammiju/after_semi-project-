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
	<style>
	</style>
</head>

<body>
	<!-- 일단 등록기능만구현 보완하여 승인한뒤 사용하게 만들것. -->
	<div class="img">
		<div class="content">
			<h1>매장 등록</h1>
		</div>
	</div>
	<div class="form">
		<form id="frm" action="storeInsert.do" method="post" enctype="multipart/form-data">

			<ul>
				<li>
					<label>사업자번호</label><input type="text" id="businessNum" name="businessNum" value="${businessNum }"
						required="required" readonly="readonly">
				</li>
				<li>
					<label>상호명</label><input type="text" id="storeName" name="storeName" required="required">
				</li>
				<li>
					<label>지역명</label><input type="text" id="storeRegion" name="storeRegion" required="required">
				</li>
				<li><label>카테고리</label>
					<select id="storeCategory" name="storeCategory" required autofocus>
						<option value="none">=== 선택 ===</option>
						<option value="한식">한식</option>
						<option value="중식">중식</option>
						<option value="일식">일식</option>
						<option value="양식">양식</option>
						<option value="분식">분식</option>
						<option value="야식">야식</option>
						<option value="디저트">디저트</option>
					</select>
				</li>
				<li>
					<label>상세설명</label><input type="text" id="storeInfo" name="storeInfo" required="required">
				</li>
				<li>
					<label>위도</label><input type="text" id="lat" name="lat" required="required">
				</li>
				<li>
					<label>경도</label><input type="text" id="lng" name="lng" required="required">
				</li>
				<li>
					<label>대표이미지</label><input type="file" id="storeImage" name="storeImage">
				</li>
				<li>
					<label>주소</label><input type="text" id="storeAddress" name="storeAddress" required="required">
				</li>
				<li>
					<input type="submit" value="신청"><input type="reset" value="취소">
				</li>
			</ul>
		</form>
	</div>
</body>

</html>