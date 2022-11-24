<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<!-- h1 부분 폰트 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	<!-- 나머지 글자 폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<!-- table css -->
	<link href="assets/css/table.css" rel="stylesheet">

	<style>
		.tbl-tr-content{
			display: 'none';
		}
	</style>

</head>

<body>
	<section>
		<!--for demo wrap-->
		<div class="img">
			<div class="content">
				<h1>공지사항</h1>
			</div>
		</div>
		<c:if test="${author == '9'}">
			<button type="button" onClick="location.href='noticeInsertForm.do'" class="insertBtn">공지작성</button>
		</c:if>
		<div style="overflow: scroll; width: 100%; height: 500px; padding: 10px;">
			<div class="tbl-header">
				<table cellpadding="0" cellspacing="0" border="0">
					<thead>
						<tr>
							<th style="width: 150px;">번호</th>
							<th>제목</th>
							<th>작성일</th>
							<c:if test="${author == '9'}">
								<th>비고</th>
							</c:if>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${notices }" var="n">
							<tr id="trNotice">
								<td>${n.noticeCode }</td>
								<td>${n.title }</td>
								<td>${n.writingDate}</td>
								<c:if test="${author == '9'}">
									<td>
										<form action="noticeUpdateForm.do" method="POST">
											<button type="sumbit" id="update">수정</button>
											<input type="hidden" name="noticeCode" value="${n.noticeCode }">
										</form>
										<form action="noticeDelete.do" method="POST">
											<button type="submit" onclick="return confirm('정말 삭제하시겠습니까?')"
												id="delete">삭제</button>
											<input type="hidden" name="noticeCode" value="${n.noticeCode }">
										</form>
									</td>
								</c:if>
							</tr>
							<tr style="display: none;">
								<td></td>
								<td colspan="2">${n.cont }</td>
								<td></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</section>
	<script>
		let trs = document.querySelectorAll('#trNotice');
		trs.forEach(tr => tr.addEventListener('click', showContent));

		$(window).on(
			"load resize ",
			function () {
				var scrollWidth = $('.tbl-content').width() -
					$('.tbl-content table').width();
				$('.tbl-header').css({
					'padding-right': scrollWidth
				});
			}).resize();

		function showContent() {
			let trText = this.nextElementSibling;
			if(trText.style.display==''){
				trText.style.display= 'none';
			}else if(trText.style.display=='none'){
				trText.style.display = '';
			}
		}
	</script>
</body>

</html>