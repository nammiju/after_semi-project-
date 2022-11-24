<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장예약현황조회</title>
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
<style>
</style>

</head>
<body>
	<div class="img">
		<div class="content">
			<h1>예약현황조회</h1>
		</div>
	</div>
	<div class="tbl-header">
		<form>
			<span><input type="date" id="firstDate"></span> <span>
				~ </span> <span><input type="date" id="lastDate"></span> <input
				type="button" value="검색" onclick="search()">
		</form>
		<c:set var="today" value="<%=new java.util.Date()%>" />
		<c:set var="date">
			<fmt:formatDate value="${today}" pattern="yyyy-MM-dd hh:mm:ss" />
		</c:set>
		<c:if test="${empty reservationStatus}">
			<p>현재 매장의 예약이 없습니다.</p>
		</c:if>
		<div
			style="overflow: scroll; width: 100%; height: 500px; padding: 10px;">
			<c:if test="${not empty reservationStatus}">
				<table id="myTable">
					<thead>
						<tr class="header">
							<th>예약번호</th>
							<th>예약자</th>
							<th>회원코드</th>
							<th>예약일</th>
							<th>예약시간</th>
							<th>예약인원</th>
							<th>연락처</th>
							<th>취소</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${reservationStatus }" var="b">
							<c:if test="${b.reservationDate > date }">
								<tr>
									<td>${b.reservationCode }</td>
									<td>${b.name }</td>
									<td>${b.memberCode }</td>
									<td>${b.reservationDate }</td>
									<td>${b.reservationTime }</td>
									<td>${b.reservationPeople }</td>
									<td>${b.phone }</td>
									<td><input type="button" value="취소" class="cancle"
										onclick="delRow()"></td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
		</div>

		<!-- The Modal -->
		<c:forEach items="${reservationStatus }" var="b">
			<div id="myModal${b.reservationCode}" class="modal-custom">
				<!-- Modal content -->
				<div class="form" align="left">
					<div class="modal-content">
						<div class="modal-header">
							<span class="close-modal">×</span>
							<h2>예약번호: ${b.reservationCode} ${b.name }</h2>
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
			</div>
		</c:forEach>
	</div>
	<script type="text/javascript">
		// 달력조회 날짜 세팅
 		document.getElementById('firstDate').value = new Date().toISOString().substring(0, 10);
		
		// 예약취소ok
		function delRow() {
			let trs = document.querySelector('.cancle').parentNode.parentNode;
			if (confirm('예약을 취소하시겠습니까?')) {
				alert('예약취소 완료!')
				trs.remove();
				
				//DB삭제 ok
				let reservationCode = trs.children[0].textContent;
				let url = "storeReservationCancle.do?reservationCode=" + reservationCode;
				
				fetch(url)
					.then(response => response.text())
					.then(data => { // 결과처리 함수
					})
			}
		};
		
		///날짜 검색
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
            reservationCode: '예약번호',
            name: '예약자명',
            memberCode : '회원코드',
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
                if(data.content != null) {
                	let td = document.createElement('td');
	                let button = document.createElement('button');
	                button.setAttribute('class','modal-custom-button');
	                button.setAttribute('href','#myModal' +data.reservationCode);
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
        }//검색결과창 끝.
	</script>
</body>
</html>