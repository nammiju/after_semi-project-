<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<!-- 회원명 부분 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<!-- 나머지 글자 폰트 -->
<link
	href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<style>
.wrapper .sidebar {
	background: white;
	top: 0;
	left: 0;
	width: 260px;
	height: 600px;
	padding: 35px 0;
	transition: all 0.5s ease;
	font-family: 'Noto Sans KR', sans-serif;
}

p {
	font-family: 'Noto Sans KR', sans-serif;
}

.sidebar {
	height: 100%;
}

/* .profile {
	padding-left: 30px;
} */
.wrapper .sidebar .profile {
	margin-bottom: 30px;
	text-align: center;
}

.wrapper .sidebar .profile img {
	display: block;
	width: 100px;
	height: 100px;
	border-radius: 50%;
	margin: 0 auto;
}

.wrapper .sidebar .profile h3 {
	color: rgb(255, 87, 87);
	margin: 10px 0 5px;
	font-family: 'Jua', sans-serif;
}

.wrapper .sidebar .profile p {
	color: black;
	font-size: 14px;
	text-align: center;
}

ul {
	list-style: none;
}

.wrapper .sidebar ul li a {
	text-align: center;
	display: block;
	padding: 13px 30px;
	border-bottom: 1px solid rgb(255, 87, 87);
	color: black;
	font-size: 16px;
	position: relative;
}

.wrapper .sidebar ul li a:hover, .wrapper .sidebar ul li a.active {
	color: rgb(255, 87, 87);
	background: white;
	border-right: 2px solid rgb(5, 68, 104);
}

.wrapper .sidebar ul li a:hover:before, .wrapper .sidebar ul li a.active:before
	{
	display: block;
}
</style>
</head>

<body>
	<div class="float_sidebar">
		<div class="wrapper">
			<!--Top menu -->
			<div class="sidebar">
				<div class="profile">
					<c:if test="${author == '1'}">
						<img src="assets/images/일반회원.png" alt="profile_picture">
					</c:if>
					<c:if test="${author == '2'}">
						<img src="assets/images/사업자회원.png" alt="profile_picture">
					</c:if>
					<c:if test="${author == '9'}">
						<img src="assets/images/관리자.png">
					</c:if>
					<h3>${name}</h3>
					<c:if test="${author == '1'}">
						<p>일반 회원</p>
					</c:if>
					<c:if test="${author == '2'}">
						<p>사업자 회원</p>
					</c:if>
					<c:if test="${author == '9'}">
						<p>관리자</p>
					</c:if>
				</div>
				<ul>
					<c:if test="${author == '1'}">
						<li class="nav-item"><a href="memberInfo.do">마이페이지</a></li>
						<li class="nav-item"><a href="memberInfoUpdateForm.do">내정보수정</a></li>
						<li class="nav-item"><a href="likedStoreShow.do">내가찜한식당</a></li>
						<li class="nav-item"><a href="reservationStatus.do">식당예약조회</a></li>
						<li class="nav-item"><a href="reservationCancelForm.do">식당예약취소</a></li>
						<li class="nav-item"><a href="reservationHistory.do">식당이용내역</a></li>
						<!-- 마지막 메뉴 하나 히든으로 감춰야지 정렬이쁘게 됨; -->
						<li class="nav-item" hidden><a href="#">리뷰게시판</a></li>

					</c:if>
					<c:if test="${author == '2'}">
						<li><a href="storeMyPage.do">나의매장정보</a></li>
						<li><a href="storeInsertForm.do">매장등록신청</a></li>
						<li><a href="storeReservationStatus.do">예약현황조회</a></li>
						<li><a href="storeReservationHistory.do">예약내역조회</a></li>
						<li><a href="menuInsertForm.do">매장메뉴등록</a></li>
						<li><a href="menuSearch.do">매장메뉴수정</a></li>
						<li><a href="menuList.do">매장메뉴빠른관리</a></li>
						<li hidden><a href="menuList.do"></a></li>
					</c:if>
					<c:if test="${author == '9'}">
						<li><a href="memberSelectForm.do?page=1">회원정보조회</a></li>
						<li><a href="memberUpdateForm.do">회원정보수정</a></li>
						<li><a href="storeApprovalForm.do?page=1">매장등록승인</a></li>
						<li><a href="storeSelectForm.do?page=1">매장정보조회</a></li>
						<li><a href="storeUpdateForm.do">매장정보수정</a></li>
						<li><a href="storeDeleteForm.do">매장정보삭제</a></li>
						<li hidden><a href="storeDeleteForm.do">매장정보삭제</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>

	<script>
		$(function() {
			var $win = $(window);
			var top = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.

			/*사용자 설정 값 시작*/
			var speed = 500; // 따라다닐 속도 : "slow", "normal", or "fast" or numeric(단위:msec)
			var easing = 'linear'; // 따라다니는 방법 기본 두가지 linear, swing
			var $layer = $('.float_sidebar'); // 레이어 셀렉팅
			var layerTopOffset = 0; // 레이어 높이 상한선, 단위:px
			$layer.css('position', 'relative').css('z-index', '1');
			/*사용자 설정 값 끝*/

			// 스크롤 바를 내린 상태에서 리프레시 했을 경우를 위해
			if (top > 0)
				$win.scrollTop(layerTopOffset + top);
			else
				$win.scrollTop(0);

			//스크롤이벤트가 발생하면
			$(window).scroll(function() {
				yPosition = $win.scrollTop() - 1100; //이부분을 조정해서 화면에 보이도록 맞추세요
				if (yPosition < 0) {
					yPosition = 0;
				}
				$layer.animate({
					"top" : yPosition
				}, {
					duration : speed,
					easing : easing,
					queue : false
				});
			});
		});
	</script>
</body>

</html>