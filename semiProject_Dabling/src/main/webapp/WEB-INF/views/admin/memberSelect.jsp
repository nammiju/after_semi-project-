<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h1 {
		margin-top: 80px;
	}
</style>
</head>
<body>
<div align="center">
<h1>회원상세보기</h1>
			<table border="1" class="table">
				<thead>
					<tr>
					<tr>
						<th>회원번호</th>
						<th>이메일</th>
						<th>비밀번호</th>
						<th>이름</th>
						<th>전화번호</th>
						<th>사업자번호</th>
						<th>권한</th>
					</tr>
						<tr>
							<td> ${memberCode }</td>
							<td>${email }</td>
							<td>${password }</td>
							<td>${name }</td>
							<td>${phone }</td>
							<td>${businessNum }</td>
							<td>${author }</td>
						</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			</div>
</body>
</html>