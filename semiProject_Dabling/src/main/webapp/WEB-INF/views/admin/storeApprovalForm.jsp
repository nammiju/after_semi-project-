<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<!-- table css -->
<link href="assets/css/table.css" rel="stylesheet">
</head>
<body>
	<div class="img">
		<div class="content">
			<h1>매장등록대기목록</h1>
		</div>
	</div>
<input type="text" id="myInput" onkeyup="myFunction()"
		placeholder="Search for names.." title="Type in a name">
	<div class="tbl-header">	
	<table id="myTable" class="myTable">
	<thead>
		<tr id="header">
			<th>매장번호</th>
			<th>매장이름</th>
			<th>매장지역</th>
			<th>매장분류</th>
			<th>매장설명</th>
			<th>매장주소</th>
			<th>사업자등록번호</th>
			<th>승인상태</th>
			<th>비고</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${stores }" var="s">
			<tr>
				<td>${s.storeCode }</td>
				<td>${s.storeName }</td>
				<td>${s.storeRegion }</td>
				<td>${s.storeCategory }</td>
				<td>${s.storeInfo }</td>
				<td>${s.storeAddress }</td>
				<td>${s.businessNum }</td>
				<td><c:if test="${s.approvalState == 1}">
							승인완료
					</c:if> <c:if test="${s.approvalState == 0}">
						승인대기
					 </c:if></td>
				<td><c:if test="${s.approvalState  == 0}">
						<form action="storeApproval.do" method="post">
							<input type="hidden" name="businessNum" value="${s.businessNum }">
							<button type="submit" onclick="alert('매장을 등록했습니다.')" id="approval">승인</button>
						</form>

					</c:if></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
	<p />
	<div class='pagination'>
		<c:if test="${page.prev }">
			<a class='active'
				href="storeApprovalForm.do?page=${page.startPage- 1}">&laquo;</a>
		</c:if>
		<c:forEach var="i" begin="${page.startPage }" end="${page.endPage }"
			step="1">
			<c:choose>
				<c:when test="${page.pageNum == i }">
					<a class='active' href="storeApprovalForm.do?page=${i }"> ${i }</a>
				</c:when>
				<c:otherwise>
					<a href="storeApprovalForm.do?page=${i }"> ${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${page.next }">
			<a class='active' href="memberSelectForm.do?page=${page.endPage+1 }">&laquo;</a>
		</c:if>
	</div>
	<script>
		function myFunction() {
			var input, filter, table, tr, td, i, txtValue;
			input = document.getElementById("myInput");
			filter = input.value.toUpperCase();
			table = document.getElementById("myTable");
			tr = table.getElementsByTagName("tr");
			for (i = 0; i < tr.length; i++) {
				td = tr[i].getElementsByTagName("td")[1];

				if (td) {
					txtValue = td.textContent || td.innerText;
					if (txtValue.toUpperCase().indexOf(filter) > -1) {
						tr[i].style.display = "";
					} else {
						tr[i].style.display = "none";
					}
				}

			}
		}
	</script>
</body>
</html>