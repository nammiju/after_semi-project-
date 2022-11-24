<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<title>Restaurant HTML Template</title>

	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	<!-- 나머지 글자 폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<!-- table css -->
	<link href="assets/css/storeDetail.css" rel="stylesheet">
	<!-- 어썸폰트 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
	<style>

	</style>
</head>

<body>
	<!-- 스크롤이미지  -->
	<div class="tm-hero d-flex justify-content-center align-items-center" data-parallax="scroll"
		data-image-src="assets/images/food.jpg">
		<!--       <form class="d-flex tm-search-form"> -->
		<!--       </form> -->
	</div>
	<!-- 스크롤이미지  끝-->

	<!--  가게정보 보이기 -->
	<div class="store-picture-wrap">
		<div class="store-image">
			<c:if test="${not empty store.storeImage }">
				<img src="${store.storeImage}" alt="Image" class="img-fluid" style="width: 500px; height: 400px;">
			</c:if>
			<c:if test="${empty store.storeImage }">
				<img src="assets/images/DablingLogo2.png" alt="Image" class="img-fluid"
					style="width: 500px; height: 400px;">
			</c:if>
		</div>
		<div class="store-info">
			<div class="href-btns">
				<ul>
					<li>
						<c:if test="${not empty likeValue}">
							<c:choose>
								<c:when test="${likeValue =='찜하기'}">
									<button class="btn btn-outline-success tm-like-btn" id="like-btn">
										<i class="fa-solid fa-heart-circle-plus"></i>
									</button>
								</c:when>
								<c:otherwise>
									<button class="btn btn-outline-success tm-like-btn" id="like-btn">
										<i class="fa-solid fa-heart-circle-xmark"></i>
									</button>
								</c:otherwise>
							</c:choose>
						</c:if>
						<h1 class="title">${store.storeName}</h1>
					</li>
					<li>
						<h2 class="lead">${store.storeInfo}</h2>
					</li>
					<li><a href="#menu-list"><button class="btn btn-outline-success tm-href-btn">메뉴리스트</button></a> <a
							href="#review-list"><button class="btn btn-outline-success tm-href-btn"
								style="margin-left: 4px;">리뷰리스트</button></a></li>
					<li><a href="#reservation-form">
							<button class="btn btn-outline-success tm-href-btn2"
								style="margin-top: 4px;">예약하기/지도</button>
						</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!--  가게정보 보이기 끝-->

	<!-- 메뉴리스트 -->
	<div class="section-menu-list">
		<a name="menu-list"></a>
		<div class="row tm-mb-74 tm-people-row menu-list-container">
			<c:forEach var="menu" items="${menuList}" varStatus="status">
				<div class="col-lg-3 col-md-6 col-sm-6 col-12 mb-5 menu-card">
					<c:if test="${not empty menu.menuImage }">
						<img src="${menu.menuImage }" alt="Image" class="mb-4 img-fluid"
							style="width: 400px; height: 320px;">
					</c:if>
					<c:if test="${empty menu.menuImage }">
						<img src="assets/images/DablingLogo2.png" alt="Image" class="mb-4 img-fluid">
					</c:if>
					<c:if test="${not empty menu.menuName }">
						<h2 class="tm-text-primary mb-4 font-Jua">${menu.menuName}</h2>
						<h3 class="tm-text-secondary h5 mb-4">
							<fmt:formatNumber value="${menu.price}" />원
						</h3>
					</c:if>
				</div>
			</c:forEach>
		</div>
	</div>
	<!-- 메뉴리스트 끝 -->

	<!-- 리뷰카드 리스트 -->
	<div class="review-container">
		<a name="review-list"></a>
		<c:forEach var="review" items="${reviewList}" varStatus="status">
			<div class="col-5 float-left review-card">
				<!--리뷰영역-->
				<div id="review-${status.index}">
					<h5 class="tm-text-primary mb-4 font-Jua">
						<span>${review.reviewDate}</span> ⭐${review.rate}
					</h5>
					<h4 class="tm-text-secondary h4 mb-4">${review.content}</h4>
				</div>
				<!--답글영역-->
				<!--리뷰 예약코드와 답글 예약코드 같은지 확인-->
				<c:forEach var="reply" items="${replyList}" varStatus="replySt">
					<c:if test="${review.reservationCode == reply.reservationCode}">
						<c:set var="replyCard" value="${status.index}" />
						<input type="hidden" id="reservation-code${status.index}" value="${review.reservationCode}">
						<div class="reply-card" id="review-${status.index}-reply">
							<ul>
								<li>
									<div class="reply-card-content">${reply.content}</div>
								</li>
								<c:if test="${store.businessNum == businessNum}">
									<li>
										<button id="modify-reply-btn">답글수정</button>
										<button id="delete-reply-btn">답글삭제</button> <input type="hidden"
											id="add-reply-btn">
									</li>
								</c:if>
							</ul>
						</div>
					</c:if>
				</c:forEach>
				<c:choose>
					<c:when test="${replyCard == status.index}">
						<div></div>
					</c:when>
					<c:otherwise>
						<c:if test="${store.businessNum == businessNum}">
							<input type="hidden" id="reservation-code${status.index}" value="${review.reservationCode}">
							<div class="reply-card" id="review-${status.index}-reply">
								<ul>
									<li class="reply-card-content"><textarea placeholder="답글내용 작성"></textarea></li>
									<li>
										<button id="add-reply-btn">답글등록</button> <input type="hidden"
											id="modify-reply-btn"> <input type="hidden" id="delete-reply-btn">
									</li>
								</ul>
							</div>
						</c:if>
					</c:otherwise>
				</c:choose>
			</div>
		</c:forEach>
	</div>
	<!-- 리뷰리스트 끝 -->

	<!-- 예약하기, 지도 -->
	<div class="container-fluid tm-mt-60 row reservation-container">
		<div class="row tm-mb-50">
			<!-- 예약-->
			<div class="col-lg-4 col-12 mb-5">
				<h2 class="tm-text-primary mb-5">
					Reservation <a name="reservation-form"></a>
				</h2>
				<form id="contact-form" action="" method="POST" class="tm-contact-form mx-auto">
					<div class="form-group">
						<input type="hidden" id="storelat" value="${store.lat}"> <input type="hidden" id="storelng"
							value="${store.lng}">
						<c:choose>
							<c:when test="${memberCode != null}">
								<input class="form-control rounded-0 reservation-input" type="text" name="name"
									placeholder="${name}" id="name" readonly>
								<input type="hidden" id="memberCode" value="${memberCode}">
								<input type="hidden" id="storeCode" value="${store.storeCode}">
							</c:when>
							<c:otherwise>
								<input type="text" name="name" class="form-control rounded-0 reservation-input"
									placeholder="Name" required />
							</c:otherwise>
						</c:choose>
					</div>
					<div class="form-group">
						<c:choose>
							<c:when test="${memberCode != null}">
								<input type="text" name="name" class="form-control rounded-0 reservation-input"
									placeholder="${phone}" id="phone" readonly>
							</c:when>
							<c:otherwise>
								<input type="text" name="name" class="form-control rounded-0 reservation-input"
									placeholder="Phone" id="phone">
							</c:otherwise>
						</c:choose>
					</div>
					<div class="form-group">
						<c:choose>
							<c:when test="${memberCode!= null}">
								<input class="form-control rounded-0 reservation-input" type="email"
									placeholder="${email}" id="email" readonly>
							</c:when>
							<c:otherwise>
								<input class="form-control rounded-0 reservation-input" type="email" placeholder="Email"
									id="email">
							</c:otherwise>
						</c:choose>
					</div>
					<div class="form-group">
						<select class="form-control rounded-0 reservation-input" id="person" name="person">
							<option value="-">Number of Guests</option>
							<option value="1">1 Person</option>
							<option value="2">2 People</option>
							<option value="3">3 People</option>
							<option value="4">4 People</option>
							<option value="5">5 People</option>
							<option value="6">6 People</option>
						</select>
					</div>
					<div class="form-group">
						<table>
							<tr>
								<td><label for="time">Date</label></td>
								<td><label for="time">Time</label></td>
							</tr>
							<tr>
								<td><input class="form-control rounded-0 reservation-input" type="text"
										placeholder="YYYY/MM/DD" id="date"></td>
								<td><input class="form-control rounded-0 reservation-input" type="text"
										placeholder="HH:MM" id="time"></td>
							</tr>
						</table>
					</div>
					<div class="form-group tm-text-right">
						<c:choose>
							<c:when test="${memberCode== null}">
								<!-- <input type="button" class="form-control rounded-0" value="로그인후 예약가능"> -->
								<button type="button" class="btn btn-primary">로그인후 예약가능</button>
							</c:when>
							<c:otherwise>
								<!-- <input type="button" class="form-control rounded-0" id="bookBtn"value="Book Now"> -->
								<button type="button" class="btn btn-primary" id="bookBtn">Book
									Now</button>
							</c:otherwise>
						</c:choose>
					</div>
				</form>
			</div>

			<!-- 지도-->
			<div class="col-lg-8 col-12">
				<div class="map-container">
				<h2 class="tm-text-primary mb-5">Our Location</h2>
				<!-- Map -->
					<div class="mapouter" id="map"></div>
					<br>
					<h2 class="tm-text-primary address">Our Address</h2>
					<div class="tm-text-gray middle-section-text">
						${store.storeAddress}</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 예약하기, 지도 끝-->

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fbd0c3f89baf8cb5bc48455b0ff961e4">
	</script>
	<script>
		//-----------------------카카오지도생성----------------------------------
		let storelat = document.getElementById('storelat').value;
		let storelng = document.getElementById('storelng').value;

		var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
		mapOption = {
			center: new kakao.maps.LatLng(storelat, storelng), // 지도의 중심좌표
			level: 3
			// 지도의 확대 레벨
		};
		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption);
		// 마커가 표시될 위치입니다 
		var markerPosition = new kakao.maps.LatLng(storelat, storelng);
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			position: markerPosition
		});
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		//-------------------------------------------------------------------------

		document.querySelector('#bookBtn').addEventListener('click', makeReservation);
		document.querySelector('#like-btn').addEventListener('click', LikeFnc);

		let addbtns = document.querySelectorAll('#add-reply-btn');
		addbtns.forEach(addbtn => addbtn.addEventListener('click', addReply));

		let modifybtns = document.querySelectorAll('#modify-reply-btn');
		modifybtns.forEach(modbtn => modbtn.addEventListener('click', modifyReply));

		let delbtns = document.querySelectorAll('#delete-reply-btn');
		delbtns.forEach(delbtn => delbtn.addEventListener('click', deleteReply));

		//------------------------예약기능------------------------
		function makeReservation() {
			let memberCode = document.getElementById('memberCode').value;
			let storeCode = document.getElementById('storeCode').value;
			let date = document.getElementById('date').value;
			let time = document.getElementById('time').value;
			let person = document.getElementById('person').value;

			data = "memberCode=" + memberCode + "&storeCode=" + storeCode +
				"&date=" + date + "&time=" + time + "&person=" + person;

			let addBookAjax = new XMLHttpRequest();
			addBookAjax.open('post', 'makeReservation.do');
			addBookAjax.setRequestHeader('Content-type',
				'application/x-www-form-urlencoded');
			addBookAjax.send(data);
			addBookAjax.onload = function () {
				let message = addBookAjax.responseText;
				document.getElementById('memberCode').value = "";
				document.getElementById('storeCode').value = "";
				document.getElementById('date').value = "";
				document.getElementById('time').value = "";
				document.getElementById('person').value = "";
				alert(message);
				location.href="reservationStatus.do?memberCode="+memberCode;
			}
		};

		//------------------------찜기능------------------------
		function LikeFnc() {
			let memberCode = document.getElementById('memberCode').value;
			let storeCode = document.getElementById('storeCode').value;
			data = "memberCode=" + memberCode + "&storeCode=" + storeCode;
			let addLikeAjax = new XMLHttpRequest();
			addLikeAjax.open('post', 'likeCommand.do');
			addLikeAjax.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
			addLikeAjax.send(data);
			addLikeAjax.onload = function () {
				location.replace(location.href);
				let message = addLikeAjax.responseText;
				alert(message);
			}
		};

		//------------------------답글달기기능------------------------
		function addReply() {
			let thisDiv = this.parentElement.parentElement.parentElement;
			let id = thisDiv.id;
			let reservationCode = thisDiv.previousElementSibling.value;
			let content = this.parentElement.previousElementSibling.firstElementChild.value;
			console.log('addReply: ' + id + " / content: " + content + "/reservationCode :" + reservationCode);

			let data = "reservationCode=" + reservationCode + "&content=" + content;
			let addReplyAjax = new XMLHttpRequest();
			addReplyAjax.open('post', './addReply.do');
			addReplyAjax.setRequestHeader('Content-type',
				'application/x-www-form-urlencoded');
			addReplyAjax.send(data);
			addReplyAjax.onload = function () {
				let message = addReplyAjax.responseText;
				alert(message);
				if (message == "답글 등록 완료") {
					console.log(document.getElementById(id));
					document.getElementById(id).firstElementChild.innerHTML =
						' <li><div class= "reply-card-content">' + content +
						' </div></li>' +
						' <c:if test="${store.businessNum == businessNum}">' +
						' <li> <button id="modify-reply-btn">답글수정</button>' +
						' <button id="delete-reply-btn">답글삭제</button></li>' +
						' </c:if>';
				}
				location.replace(location.href);
			}
		};

		//------------------------답글수정기능------------------------
		function modifyReply() {
			//수정 누르면 수정area 열리게
			let thisDiv = this.parentElement.parentElement.parentElement;
			let id = thisDiv.id;
			let reservationCode = thisDiv.previousElementSibling.value;
			let content = this.parentElement.previousElementSibling.firstElementChild.textContent;
			console.log('modifyReply: ' + id + " / content: " + content);
			document.getElementById(id).firstElementChild.innerHTML = '<li class="reply-card-content"><textarea>' +
				content +
				'</textarea></li>' +
				'<li><button id="modify-confirm-btn">답글수정완료</button>' +
				'<button id="delete-reply-btn">답글삭제</button></li>';

			document.querySelector('#modify-confirm-btn').addEventListener('click', modifyFnc);

			//수정 완료 누르면 수정되는 기능
			function modifyFnc() {
				//this: modify-confirm-btn 버튼
				let content = this.parentElement.previousElementSibling.firstElementChild.value;
				console.log(content);
				let data = "reservationCode=" + reservationCode + "&content=" +
					content;
				let modifyReplyAjax = new XMLHttpRequest();
				modifyReplyAjax.open('post', './updateReply.do');
				modifyReplyAjax.setRequestHeader('Content-type',
					'application/x-www-form-urlencoded');
				modifyReplyAjax.send(data);
				modifyReplyAjax.onload = function () {
					let message = modifyReplyAjax.responseText;
					alert(message);
					if (message == "답글 수정 완료") {
						console.log(document.getElementById(id));
						document.getElementById(id).firstElementChild.innerHTML =
							'<li><div class= "reply-card-content">' +
							content +
							'</div></li>' +
							' <c:if test="${store.businessNum == businessNum}">' +
							' <li> <button id="modify-reply-btn">답글수정</button>' +
							' <button id="delete-reply-btn">답글삭제</button></li>' +
							' </c:if>';
						location.replace(location.href);
					}
				}
			}
		};

		//------------------------답글삭제기능------------------------
		function deleteReply() {
			let thisDiv = this.parentElement.parentElement.parentElement;
			let id = thisDiv.id;
			let reservationCode = thisDiv.previousElementSibling.value;
			console.log('deleteReply: ' + id);

			let deleteReplyAjax = new XMLHttpRequest();
			deleteReplyAjax.open('post', './deleteReply.do');
			deleteReplyAjax.setRequestHeader('Content-type',
				'application/x-www-form-urlencoded');
			deleteReplyAjax.send("reservationCode=" + reservationCode);
			deleteReplyAjax.onload = function () {
				let message = deleteReplyAjax.responseText;
				alert(message);
				if (message == "답글 삭제 완료") {
					location.replace(location.href);
					//                document.getElementById(id).firstElementChild.innerHTML =
					//                   '<li class="reply-card-content"><textarea placeholder="답글내용 작성"></textarea></li>' +
					//                   '<li><button id="add-reply-btn">답글등록</button></li>';
				}

			}
		}
	</script>
</body>

</html>