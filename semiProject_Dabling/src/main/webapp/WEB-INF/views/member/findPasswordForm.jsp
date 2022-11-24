<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>비밀번호찾기</title>
<style>
.mainform {
	width: 100%;
	height: 600px;
}

.loginForm {
	text-align: center;
}

/* css템플릿 */
body {
	font-family: 'Montserrat', sans-serif;
	background: white;
}

.container {
	display: block;
	max-width: 680px;
	width: 80%;
	margin: 80px auto;
}

h1 {
	color: rgb(255, 87, 87);
	font-size: 48px;
	font-weight: bolder;
	letter-spacing: -3px;
	text-align: center;
	margin: 50px 0 50px 0;
	transition: .2s linear;
}

.links {
	list-style-type: none;
	text-align: center;
}

.links li {
	display: inline-block;
	margin: 0 20px 0 0;
	transition: .2s linear;
	opacity: .6;
}

.links li:hover {
	opacity: 1;
}

a {
	text-decoration: none;
	color: #0f132a;
	font-weight: bolder;
	text-align: center;
	cursor: pointer;
}

form {
	width: 100%;
	max-width: 750px;
	margin: 40px auto 10px;
}

form ul {
	list-style-type: none;
	padding: 0;
}

p {
	text-align: left;
	color: #BDB8B8;
}

input {
	display: inline-block;
	width: 80%;
	max-width: 680px;
	height: 50px;
	margin: 0 auto;
	margin-left: 35px;
	border-radius: 8px;
	border: none;
	background: rgba(#0f132a, .1);
	color: rgba(#0f132a, .3);
	margin-bottom: 5px;
	padding: 0 0 0 10px;
	font-size: 14px;
	font-family: 'Montserrat', sans-serif;
}

#emailCheckBtn {
	display: inline;
	background: rgb(255, 87, 87);;
	color: white;
	width: 62.188px;
	height: 33px;
	padding: 6px 12px 6px 12px;
	border-radius: 8px;
	margin: 0 auto;
	border: none;
	cursor: pointer;
	font-size: 14px;
	font-family: 'Montserrat', sans-serif;
	box-shadow: 0 15px 30px rgba(#e91e63, .36);
	transition: .2s linear;
}
</style>
</head>

<body>
	<div class="mainform">
		<div class="container">
			<!-- Heading -->
			<h1>FIND PASSWORD</h1>

			<!-- Links -->
			<ul class="links">
				<li><a href="memberloginForm.do" class="linkLi">SIGN IN</a></li>
				<li><a onclick="location.href='main.do'" class="linkLi">HOME</a></li>
			</ul>

			<!-- Form -->
			<form id="searchForm">
				<!-- email input -->
				<div class="emailinput">
					<p>찾으시는 계정을 입력하세요.</p>
					<input type="email" id="email" name="email" placeholder="Email"
						required="required" /> <input type="button" class="emailCheckBtn"
						id="emailCheckBtn" value="Check" onclick="emailCheck()"></input> <br>
					<input id="result" readonly>
				</div>
				<div>
					<input type="button" id="sendEmail" value="비밀번호 메일전송"
						onclick="emailSend()">
				</div>
			</form>
		</div>


		<script type="text/javascript">
			function emailCheck() { // 이메일 조회하고 보여주게 하기
				let email = document.getElementById('email').value;
				let url = "ajaxEmailFind.do?email=" + email;
				fetch(url)
					.then(response => response.text())
					.then(data => { // 결과처리 함수
						if (data == '0') {
							num = email.indexOf('@');
							str = email.substring(3, num);
							result = email.replace(str, '*****');
							document.getElementById('result').value = result + "계정이 존재합니다.";
						} else {
							document.getElementById('result').value = email + "는 존재하지 않는 계정입니다.";
							document.getElementById('email').value = "";
							document.getElementById('email').focus();
						}
					});
			}

			function emailSend() {
				alert("임시비밀번호 메일이 발송중입니다.");
				let email = document.getElementById('email').value;
				let url = "sendEmail.do?email=" + email;
				console.log(email);

				fetch(url)
					.then(response => response.text())
					.then(data => { // 결과처리 함수
						console.log(data);
						if (data != "failed") {
							alert("임시비밀번호 메일이 발송되었습니다");
							searchForm.emailCheck.disabled = true;
						} else {
							alert("발송에 실패했습니다. 잠시 후 다시 시도해주세요");
						}
					})
			}
		</script>
</body>

</html>