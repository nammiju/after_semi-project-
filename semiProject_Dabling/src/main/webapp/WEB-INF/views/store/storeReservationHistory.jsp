<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link href="assets/css/table.css" rel="stylesheet">
<style>
</style>
<title>예약내역조회</title>
</head>

<body>
	<div class="img">
		<div class="content">
			<h1>예약내역조회</h1>
		</div>
	</div>
	<div class="tbl-header">
		<form>
			<span><input type="date" id="firstDate" value="2022-01-01"></span>
			<span> ~ </span> <span><input type="date" id="lastDate"></span>
			<input type="button" value="검색" onclick="search()">
		</form>
		<c:set var="today" value="<%=new java.util.Date()%>" />
		<c:set var="date">
			<fmt:formatDate value="${today}" pattern="yyyy-MM-dd hh:mm:ss" />
		</c:set>
		<c:if test="${empty reservationStatus}">
			<p>현재 매장의 예약내역이 없습니다.</p>
		</c:if>
		<div style="overflow: scroll; width: 100%; height: 500px; padding: 10px;">
		<c:if test="${not empty reservationStatus}">
			<table id="myTable">
				<thead>
					<tr class="header">
						<th>가게번호</th>
						<th>예약번호</th>
						<th>예약자</th>
						<th>회원코드</th>
						<th>예약일</th>
						<th>예약시간</th>
						<th>예약인원</th>
						<th>연락처</th>
						<th>리뷰</th>
					</tr>
				</thead>

				<tbody>
						<c:forEach items="${reservationStatus }" var="b">
							<c:if test="${b.reservationDate < date }">	
							<tr>
									<td>${b.storeCode }</td>
									<td>${b.reservationCode }</td>
									<td>${b.name }</td>
									<td>${b.memberCode }</td>
									<td>${b.reservationDate }</td>
									<td>${b.reservationTime }</td>
									<td>${b.reservationPeople }</td>
									<td>${b.phone }</td>
									<!--<td><input type="button" data-toggle="modal" data-target="#insertBlack"  data-notifyid="${list.NOTIFYID }" data-nonnotifyid="${list.NONNOTIFYID }" data-ncontent="${list.NCONTENT }" class="btn btn-danger" value="리뷰확인" class="review"></td> -->
									<td>
										<!-- Trigger/Open The Modal --> <c:if
											test="${not empty b.content}">
											<button class="modal-custom-button"
												href="#myModal${b.reservationCode}">리뷰확인</button>
										</c:if>
									</td>
								</tr>
							</c:if>
						</c:forEach>
				</tbody>
			</table>
		</c:if>
	</div>
	</div>


	<!-- The Modal -->
	<c:forEach items="${reservationStatus }" var="b">
		<div id="myModal${b.reservationCode}" class="modal-custom">
			<!-- Modal content -->
			<div class="modal-content">
				<div class="modal-header">
					<span class="close-modal">X</span>
					<h3>예약번호: ${b.reservationCode}</h3>
					<h4>${b.name }고객님의 소중한 리뷰입니다.</h4>
				</div>
				<div class="modal-body">
					<p>예약일 : ${b.reservationDate}</p>
					<p>예약인원 : ${b.reservationPeople}</p>
					<c:if test="${not empty b.content}">
						<p>내용 : ${b.content}</p>
					</c:if>
					<c:if test="${ empty b.content}">
						<p>등록된 리뷰가 없습니다.</p>
					</c:if>
				</div>
			</div>
		</div>

	</c:forEach>

	<script type="text/javascript">
      //달력 값 지정
      document.getElementById('lastDate').value = new Date().toISOString().substring(0, 10);
      var now_utc = Date.now()
      var timeOff = new Date().getTimezoneOffset() * 60000;
      var today = new Date(now_utc - timeOff).toISOString().split("T")[0];
      document.getElementById("lastDate").setAttribute("max", today);

      //날짜 검색
      function search() {
         console.log(document.querySelector('#firstDate').value)
         console.log(document.querySelector('#lastDate').value)
         let firstDate = document.querySelector('#firstDate').value;
         let lastDate = document.querySelector('#lastDate').value;
         let job = 'history';
         let url = "storeReservationSearch.do?firstDate=" + firstDate + "&lastDate=" + lastDate + "&job=" + job;
         fetch(url)
            .then(response => response.json())
            .then(data => htmlViews(data)) // 결과처리 함수
      }
      let titles = {
         storeCode: '가게번호',
         reservationCode: '예약번호',
         name: '예약자명',
         memberCode: '회원코드',
         reservationDate: '예약일',
         reservationTime: '예약시간',
         reservationPeople: '예약인원',
         phone: '연락처'
      }
      //html뿌려줄 data값 매개변수명 지정.
      function htmlViews(datas) {
         //바디 지우기
         document.querySelector('tbody').remove();

         //바디 생성,텍스트 출력
         let tbody = document.createElement('tbody');
         for (data of datas) {
            let tr = document.createElement('tr');
            for (title in titles) {
               let td = document.createElement('td');
               td.textContent = data[title];
               tr.append(td);
            }
            if (data.content != null) {
               let td = document.createElement('td');
               let button = document.createElement('button');
               button.setAttribute('class', 'modal-custom-button');
               button.setAttribute('href', '#myModal' + data.reservationCode);
               button.textContent = '리뷰확인';
               tr.append(button);
            } else {
               let td = document.createElement('td');
               tr.append(td);
            }
            tbody.append(tr);
         }

         //테이블 붙이기
         document.querySelector('table').appendChild(tbody);

         //1.검색한 결과의 모달창
         var btn = document.querySelectorAll("button.modal-custom-button");
         var modals = document.querySelectorAll('.modal-custom');
         var spans = document.getElementsByClassName("close-modal");

         for (var i = 0; i < btn.length; i++) {
            btn[i].onclick = function (e) {
               e.preventDefault();
               modal = document.querySelector(e.target.getAttribute("href"));
               modal.style.display = "block";
            }

            spans[i].onclick = function () {
               for (var index in modals) {
                  if (typeof modals[index].style !== 'undefined') modals[index].style.display = "none";
               }
            }
         }

         // When the user clicks anywhere outside of the modal, close it
         window.onclick = function (event) {
            if (event.target.classList.contains('modal-custom')) {
               for (var index in modals) {
                  if (typeof modals[index].style !== 'undefined') modals[index].style.display = "none";
               }
            }
         }
      } //검색결과창 끝.


      //2.예약내역조회 모달창
      var btn = document.querySelectorAll("button.modal-custom-button");
      var modals = document.querySelectorAll('.modal-custom');
      var spans = document.getElementsByClassName("close-modal");

      for (var i = 0; i < btn.length; i++) {
         btn[i].onclick = function (e) {
            e.preventDefault();
            modal = document.querySelector(e.target.getAttribute("href"));
            modal.style.display = "block";
         }

         spans[i].onclick = function () {
            for (var index in modals) {
               if (typeof modals[index].style !== 'undefined') modals[index].style.display = "none";
            }
         }
      }

      // When the user clicks anywhere outside of the modal, close it
      window.onclick = function (event) {
         if (event.target.classList.contains('modal-custom')) {
            for (var index in modals) {
               if (typeof modals[index].style !== 'undefined') modals[index].style.display = "none";
            }
         }
      }
   </script>
</body>

</html>