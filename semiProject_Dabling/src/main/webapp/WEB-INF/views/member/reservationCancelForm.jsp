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
<title>예약취소</title>
<!-- 회원명 부분 폰트 -->
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
</head>

<body>
	<div class="img">
		<div class="content">
			<h1>예약취소</h1>
		</div>
	</div>

	<div class="tbl-header">
		<form action="reservationCancel.do" onsubmit="return formSubmit()"
			method="post">
			<input type="submit" class="cancelBtn" value="예약취소">
			<div
				style="overflow: scroll; width: 100%; height: 500px; padding: 10px;">

				<c:set var="today" value="<%=new java.util.Date()%>" />
				<c:set var="date">
					<fmt:formatDate value="${today}" pattern="yyyy-MM-dd kk:mm" />
				</c:set>

				<table id="myTable">
					<thead>
						<tr class="header">
							<th><input type="checkbox" id="cboxAll" name="cboxAll"
								onclick="checkAll();"></th>
							<th>예약번호</th>
							<th>회원코드</th>
							<th>가게코드</th>
							<th>예약일</th>
							<th>예약시간</th>
							<th>예약인원</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${reservationStatus }" var="b">
							<fmt:parseDate var="parsedDate" value="${b.reservationTime}"
								pattern="kk:mm" />
							<c:set var="a"
								value="${b.reservationDate} ${fn:substring(parsedDate,11,16) } " />
							<c:if test="${a > date }">
								<tr>
									<td><input type="checkbox" name="reservationCode"
										id="reservationCode" value="${b.reservationCode }"></td>
									<td>${b.reservationCode }</td>
									<td>${memberCode }</td>
									<td>${b.storeCode }</td>
									<td>${fn:substring(b.reservationDate,0,10) }</td>
									<td>${b.reservationTime }</td>
									<td>${b.reservationPeople }</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
		</form>
	</div>
	</div>

</body>
<script type="text/javascript">
	function formSubmit() {
		return true;
	}

	function checkAll() {
		if ($("#cboxAll").is(':checked')) {
			$("input[name=reservationCode]").prop("checked", true);
		} else {
			$("input[name=reservationCode]").prop("checked", false);
		}
	}
</script>

</html>