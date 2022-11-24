<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>이용내역</title>
	<!-- 회원명 부분 폰트 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	<!-- 나머지 글자 폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<!-- table css -->
	<link href="assets/css/table.css" rel="stylesheet">
</head>

<body>
	<div class="form">
		<div class="img" align="center">
			<div class="content">
				<h1>매장이용내역</h1>
			</div>
		</div>
		<div style="overflow: scroll; width: 100%; height: 500px; padding: 10px;">
			<form class="form" action="reviewForm.do" onsubmit="return formSubmit()" method="post">

				<c:set var="today" value="<%=new java.util.Date()%>" />
				<c:set var="date">
					<fmt:formatDate value="${today}" pattern="yyyy-MM-dd kk:mm" />
				</c:set>
				<div class="tbl-header">
					<table id="myTable">
						<thead>
							<tr class="header">
								<th>예약번호</th>
								<th>회원코드</th>
								<th>가게코드</th>
								<th>예약일</th>
								<th>예약시간</th>
								<th>예약인원</th>
								<th>리뷰</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${reservationStatus }" var="b">
								<fmt:parseDate var="parsedDate" value="${b.reservationTime}" pattern="kk:mm" />
								<c:set var="a" value="${b.reservationDate} ${fn:substring(parsedDate,11,16) } " />
								<c:if test="${a < date }">
									<tr>
										<td>${b.reservationCode }<input type="hidden" name="reservationCode"
												id="reservationCode" value="${b.reservationCode }"></td>
										<td>${memberCode }</td>
										<td>${b.storeCode }<input type="hidden" name="storeCode" id="storeCode"
												value="${b.storeCode }"></td>
										<td>${fn:substring(b.reservationDate,0,10) }</td>
										<td>${b.reservationTime }</td>
										<td>${b.reservationPeople }</td>
										<!-- 리뷰작성부분 -->
										<div class="container">
											<td><button type="button" id="reviewBtn" onclick="value1(this.value);"
													value="${b.reservationCode } ${b.storeCode }" data-toggle="modal"
													data-target="#mo1">리뷰작성</button></td>
										</div>
				
				<div class="modal fade" id="mo1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">리뷰작성</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<!--body-->
							<div class="modal-body">
								<div class="row">

									<div class="form-group">
										<label>예약번호</label> <input type="text" name="reservationCode1"
											id="reservationCode1" class="form-control" value="${b.reservationCode }"
											readonly="readonly">
									</div>


									<div class="form-group">
										<label>가게코드</label> <input type="text" id="storeCode1" name="storeCode1"
											class="form-control" value="${b.storeCode }" readonly="readonly">
									</div>

									<div class="col-12">
										<div class="form-group">
											<label>내용</label>
											<textarea id="content" placeholder="내용을 입력하세요." name="content"
												class="form-control"></textarea>
										</div>
									</div>
									<div class="col-12">
										<div class="form-group">
											<label>평점</label> <input type="text" onkeypress='return checkNumber(event)'
												id="rate" name="rate">
										</div>
									</div>

								</div>
							</div>
							<div class="modal-footer">
								<input type="submit" id="update" value="저장하기">
								<button type="button" id="close" data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>

				</tr>
				</c:if>
				</c:forEach>
				</tbody>
				<tfoot>
				</tfoot>
				</table>
		</div>
		</form>
	</div>
	</form>
</body>
<script type="text/javascript">
	function formSubmit() {
		return true;
	}

	function value1(value) {
		let a = value.split(" ");
		b = a[0];
		c = a[1];
		document.getElementById('reservationCode1').value = b;
		document.getElementById('storeCode1').value = c;
	}
	document.getElementById('submit').onclick = function () {
		alert(document.getElementsByTagName('input')[0].id);
	}

	function checkNumber(event) {
		if (event.key === '.' || event.key >= 0 && event.key <= 5) {
			return true;
		}
		alert("1~5까지의 숫자를 입력하세요")
		return false;
	}
</script>

</html>