<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<div>
			<h1>리뷰쓰기</h1>
			<div>
				<form id="frm" action="review1.do" onsubmit="return formSubmit()"
					method="post">
					<div>
						<table border="1">
							<tr>
								<th width="150">리뷰번호</th>
								<td width="270"><input type="text" id="reviewNum"
									required="required" name="reviewNum">&nbsp;&nbsp;</td>
							</tr>
							<tr>
								<th width="150">예약번호</th>
								<td width="270"><input type="text" id="reservationCode"
									required="required" name="reservationCode">&nbsp;&nbsp;</td>
							</tr>
							<tr>
								<th width="150">내용</th>
								<td width="270"><input type="text" id="content"
									required="required" name="content">&nbsp;&nbsp;</td>
							</tr>
							<tr>
								<th width="150">평점</th>
								<td width="270"><input type="text" id="rate"
									required="required" name="rate">&nbsp;&nbsp;</td>
							</tr>
							<tr>
								<th width="150">리뷰날짜</th>
								<td width="270"><input type="text" id="reviewDate"
									required="required" name="reviewDate">&nbsp;&nbsp;</td>
							</tr>
						</table>
					</div>
					<br />
					<div>
						<input type="submit" value="리뷰작성">&nbsp;&nbsp; <input
							type="reset" value="취소">&nbsp;&nbsp;
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function formSubmit() {
			return true;
		}
	</script>
</body>
</html>