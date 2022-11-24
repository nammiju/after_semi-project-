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
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	<!-- 나머지 글자 폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<!-- table css -->
	<link href="assets/css/form.css" rel="stylesheet">
</head>

<body>
	<div class="img">
		<div class="content">
			<h1>매장정보수정</h1>
		</div>
	</div>
	<div class="form">
		<form id="frm" action="storeSelect.do" method="post" onsubmit="return formSubmit()">
			<ul>
				<li><label>사업자번호:</label> <input type="text" name="businessNum">
					<input type="hidden" name="job" value="storeUpdate"> <input type="submit" value="조회" class="btn">
				</li>
				<li hidden>빔일li</li>
			</ul>
		</form>
		<form id="frm1" action="storeUpdate.do" method="post">
			<ul>
				<li><label>매장번호:</label> <input type="number" name="storeCode" value="${store.storeCode }" readonly>
				</li>
				<li><label>매장이름:</label> <input type="text" name="storeName" value="${store.storeName }"></li>
				<li><label>지역:</label> <input type="text" name="storeRegion" value="${store.storeRegion }"></li>
				<li><label> 카테고리:</label> <input type="text" name="storeCategory" value="${store.storeCategory }"></li>
				<li><label>설명:</label>
					<textarea name="storeInfo">${store.storeInfo }</textarea></li>
				<li><label>위도:</label> <input type="text" name="lat" value="${store.lat }"></li>
				<li><label>경도:</label> <input type="text" name="lng" value="${store.lng }"></li>
				<li><label>이미지:</label> <input type="text" name="storeImage" value="${store.storeImage }"></li>
				<li><label>변경이미지네임:</label> <input type="text" name="storeImageRename"
						value="${store.storeImageRename }"></li>
				<li><label>주소:</label> <input type="text" name="storeAddress" value="${store.storeAddress }"></li>
				<li><label>사업자번호:</label> <input type="text" name="businessNum" value="${store.businessNum }"></li>
				<li style="display: inline-block; margin-left: 50px; text-align: center;"><input type="submit"
						class="btn1" value="수정" onclick="alert('수정이 완료되었습니다.')"></li>
				<li hidden>빔일li</li>
			</ul>
		</form>
	</div>
</body>

</html>