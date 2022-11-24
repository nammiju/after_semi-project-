<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
		$(function () {
			$.ajax({
				url: 'ajaxBoardList.do',
				method: 'get',
				dataType: 'json',
				success: function (result) {
					$.each(result, function (prop, item) {
						$('#list').prepend(makeTr(item));
					})
				},
				error: function (error) {
					console.log(error);
				}
			});
			
			$('#insertBtn').on('click', addBoard);
		});

		function makeTr(board = {
			boardNo: "",
			boardTitle: "",
			boardWriter: ""
		}) {
			return $('<tr />').append(
				$('<td />').text(board.boardNo),
				$('<td />').text(board.title),
				$('<td />').text(board.writer),
			).on('click', board, showBoard);
		}
		
		function showBoard(e){
			let boardNo = e.data.boardNo;
			location.href = 'showBoard.do?boardNo=' + boardNo;
		}
		
		function addBoard(){
			 console.log($('form[name="form"]').serialize()); // 폼의 내용을 자동으로 키값과 밸류 혈식으로 만들어줌.
			 
			 $.ajax({
			      url: 'ajaxBoardInsert.do',
			      method: 'post',
			      contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			      data: $('form[name="form"]').serialize(),
			      dataType: 'json',
			      success: function(result) {
			         console.log(result);
			         $('#list').append(makeTr(result));
			         init();
			      },
			      error: function(error) { console.log(error) }
			   });
		}
	</script>
</head>

<body>
	<div id="insertBoard">
		<form name="form" action="boardInsert.do"
			onsubmit="return formSubmit()" method="post">
			<label>제목<input type="text" name="title" id="title"></label><br>
			<label>내용<input type="text" name="content" id="content"></label><br>
			<label>작성자<input type="text" name="writer" id="writer"></label><br>
			<input type="button" id="insertBtn" value="등록"><input
				type="button" id="resetBtn" value="취소">
		</form>
	</div>
	<div id="showBoard">
		<table border="1">
			<thead>
				<tr>
					<th>No.</th>
					<th>제목</th>
					<th>작성자</th>
				</tr>
			</thead>
			<tbody id="list"></tbody>
		</table>
	</div>


</body>

</html>