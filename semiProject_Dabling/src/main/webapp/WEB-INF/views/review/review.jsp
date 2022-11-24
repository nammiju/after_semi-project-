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
					<c:forEach items="${list }" var="a">
						<tr>
							<th width="150">리뷰번호</th>
							<td>${a.reviewNum}</td>
						</tr>
						<tr>
							<th width="150">예약번호</th>
							<td>${a.reservationCode }</td>
						</tr>
						<tr>
							<th width="150">내용</th>
							<td>${a.content }</td>
						</tr>
						<tr>
							<th width="150">평점</th>
							<td>${a.rate }</td>
						</tr>
						<tr>
							<th width="150">리뷰날짜</th>
							<td>${a.reviewDate }</td>
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