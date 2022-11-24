<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>storeMyPage</title>
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
			<h1>나의매장정보</h1>
		</div>
	</div>
	<div class="form">
		<form id="frm" action="storeMyPage.do" method="post"
			enctype="multipart/form-data">
			<ul>
				<li><label>승인현황</label><input type="text" id="approvalState"
					name="approvalState" value="${message }" required="required"
					readonly="readonly"></li>
				<li><label>상호명</label><input type="text" id="storeName"
					name="storeName" value="${store.storeName }" required="required">
				</li>
				<li><label>지역명</label><input type="text" id="storeRegion"
					name="storeRegion" value="${store.storeRegion }"
					required="required"></li>
				<li><label>카테고리</label> <select id="storeCategory"
					name="storeCategory" required autofocus>
						<option value="none">=== 선택 ===</option>
						<option value="한식"
							<c:if test="${store.storeCategory eq '한식'}">selected="selected"</c:if>>한식
						</option>
						<option value="중식"
							<c:if test="${store.storeCategory eq '중식'}">selected="selected"</c:if>>중식
						</option>
						<option value="일식"
							<c:if test="${store.storeCategory eq '일식'}">selected="selected"</c:if>>일식
						</option>
						<option value="양식"
							<c:if test="${store.storeCategory eq '양식'}">selected="selected"</c:if>>양식
						</option>
						<option value="분식"
							<c:if test="${store.storeCategory eq '분식'}">selected="selected"</c:if>>분식
						</option>
						<option value="야식"
							<c:if test="${store.storeCategory eq '야식'}">selected="selected"</c:if>>야식
						</option>
						<option value="디저트"
							<c:if test="${store.storeCategory eq '디저트'}">selected="selected"</c:if>>디저트
						</option>
				</select></li>
				<li><label>상세설명</label> <textarea id="storeInfo"
						name="storeInfo" rows="4" cols="30">${store.storeInfo }</textarea></li>
				<li><label>위도</label><input type="text" id="lat" name="lat"
					value="${store.lat }" required="required"></li>
				<li><label>경도</label><input type="text" id="lng" name="lng"
					value="${store.lng }" required="required"></li>
				<li><label>대표이미지</label><input type="file" id="storeImage"
					value="${store.storeImage }" name="storeImage"> <c:if
						test="${not empty store.storeImage }">
						<div id="img" align="center">
							<img src="${store.storeImage }"
								style="width: 250px; height: 150px;">
						</div>
					</c:if></li>
				<li><label>주소</label> <textarea id="storeAddress"
						name="storeAddress" required="required">${store.storeAddress }</textarea>
				</li>
				<li>
					<div class="updateDeleteBtn" align="center">
						<input type="button" value="수정" id="update"> <input
							type="button" value="삭제" id="delete">
					</div>
				</li>
			</ul>
		</form>
	</div>

	<script>
		document.getElementById("update").addEventListener('click', function() {
			if (!(confirm('매장을 수정하시겠습니까?'))) {
				alert("매장수정를 취소하였습니다.");
			} else {
				alert("매장정보를 수정하였습니다.");
				frm.action = "storeMyPageUpdate.do";
				frm.submit();
			}

		})

		document.getElementById("delete").addEventListener('click', function() {
			if (!(confirm('매장을 삭제하시겠습니까?'))) {
				alert("매장삭제를 취소하였습니다.");
			} else {
				alert("매장정보를 삭제하였습니다.");
				frm.action = "storeMyPageDelete.do";
				frm.submit();
			}
		})
	</script>

</body>

</html>