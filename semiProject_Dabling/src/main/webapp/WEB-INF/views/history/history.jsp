<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.form {
	margin-top: 80px;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="form" align="center">
		<h1>리뷰게시판입니다</h1>
		<div>
			<div>
				<table border="1">
					<c:forEach items="${list}" var="a">
						<tr>
							<th width="150">예약코드</th>
							<td>${a.reservationCode }</td>
						</tr>
						<tr>
							<th width="150">회원코드</th>
							<td>${a.memberCode }</td>
						</tr>
						<tr>
							<th width="150">가게코드</th>
							<td>${a.storeCode }</td>
						</tr>
						<tr>
							<th width="150">예약일</th>
							<td>${a.reservationDate }</td>
						</tr>
						<tr>
							<th width="150">예약시간</th>
							<td>${a.reservationTime }</td>
						</tr>
						<tr>
							<th width="150">예약인원</th>
							<td>${a.reservationPeople }</td>
						</tr>
					</c:forEach>
				</table>
			</div>


		</div>
		<button type="button">
			<a href="reviewForm.do">리뷰작성</a>
		</button>
	</div>



</body>
</html>