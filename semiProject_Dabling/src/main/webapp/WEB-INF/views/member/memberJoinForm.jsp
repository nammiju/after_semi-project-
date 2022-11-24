<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Join</title>
<style>
body {
	font-family: 'Montserrat', sans-serif;
	background: white;
	height: 100%;
}

.container {
	width: 100%;
	height: 100%;
	display: block;
	max-width: 800px;
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

p {
	color: #BDB8B8;
}

.links {
	list-style-type: none;
	padding-left: 280px;
}

.links li {
	display: inline-block;
	margin: 0 20px 0 0;
	transition: .2s linear;
}

.links li:nth-child(1) {
	opacity: .6;
}

.links li:nth-child(1):hover {
	opacity: 1;
}

.links li:nth-child(3) {
	opacity: .6;
}

.links li:nth-child(3):hover {
	opacity: 1;
}

.aTag {
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
}

.joinType, .loginInfo .businessInfo {
	margin: 0px auto;
	position: relative;
	text-align: center;
}

#btn, #btn1 {
	display: inline;
	background: rgb(255, 87, 87);;
	color: white;
	border-radius: 8px;
	margin: 0 auto;
	border: none;
	cursor: pointer;
	font-size: 14px;
	font-family: 'Montserrat', sans-serif;
	box-shadow: 0 15px 30px rgba(#e91e63, .36);
	transition: .2s linear;
}

[type="radio"] {
	display: inline;
	border: max(2px, 0.1em) solid gray;
	border-radius: 50%;
	width: 1.25em;
	height: 1.25em;
}

.loginInfo::before {
	content: "";
	position: absolute;
	top: -15px;
	left: 50px;
	display: block;
	width: 0;
	height: 0;
	background: transparent;
	border-left: 15px solid transparent;
	border-right: 15px solid transparent;
	border-bottom: 15px solid rgba(#0f132a, .1);
	transition: .2s linear;
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

.privateInfo #name {
	display: inline;
	width: 90%;
	max-width: 680px;
}

.privateInfo input {
	margin-bottom: 5px;
	display: inline;
	width: 26%;
	max-width: 680px;
}

.businessInfo {
	display: none;
}

input:focus:active {
	outline: none;
	border: none;
	color: rgba(#0f132a, 1);
}

.password1 {
	opacity: 0;
	display: none;
	transition: .2s linear;
}

.button input {
	background: rgb(255, 87, 87);;
	color: white;
	display: block;
	width: 100%;
	max-width: 680px;
	height: 50px;
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
	<div class="container">
		<!-- Heading -->
		<h1>SIGN UP</h1>
		<!-- Links -->
		<ul class="links">
			<li><a href="memberloginForm.do" id="signin" class="aTag">SIGN IN</a></li>
			<li><a href="#" id="signup" class="aTag">SIGN UP</a></li>
			<li><a onclick="reset();" id="reset" class="aTag">RESET</a></li>
		</ul>

		<!-- Form -->
		<form class="form" action="memberJoin.do"
			onsubmit="return formSubmit()" method="post">
			<!-- 가입유형 선택 -->
			<div class="joinType">
				<p>가입 유형을 선택해 주세요</p>
				<input type='radio' id="normal" name='member' value='1'
					checked="checked" onchange="setDisplay()" />일반회원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type='radio' id="business" name='member' value='2'
					onchange="setDisplay()" />사업자회원
			</div>
			<!-- 로그인 정보 input -->
			<div class="loginInfo">
				<p>로그인 정보</p>
				<ul>
					<li><input id="email" name="email" type="text"
						placeholder="Email" required autofocus>
						<button class="btn" id="btn" value="No" onclick="emailCheck()">Check</button>
					</li>
					<li><input id="password" name="password" type="password"
						placeholder="Password" required><br></li>
					<li><input id="password1" name="password1" type="password"
						placeholder="Repeat Password" required><br></li>
				</ul>
			</div>
			<div class="privateInfo">
				<p>개인 정보</p>
				<ul>
					<li><input id="name" name="name" type="text"
						placeholder="Name" required></li>
					<li><input type='tel' id='phone1' name='phone1'
						placeholder="Phone" required />-<input type='tel' id='phone2'
						name='phone2' required />-<input type='tel' id='phone3'
						name='phone3' required /></li>
				</ul>
			</div>
			<!-- 사업자정보 -->
			<div class="businessInfo">
				<p>사업자 정보</p>
				<ul>
					<li><input id="businessNum" name="businessNum" type="text"
						placeholder="Business number">
						<button class="btn" id="btn1" value="No"
							onclick="businessNumCheck()">Check</button></li>
				</ul>
				</fieldset>
			</div>
			<div class="button">
				<input type="submit" value="Sign up">
			</div>
		</form>
	</div>

	<script type="text/javascript">
		function setDisplay() {
			if ($('input:radio[id=business]').is(':checked')) {
				$('.businessInfo').show();
			} else {
				$('.businessInfo').hide();
			}
		}

		function formSubmit() {
			if (form.btn.value == 'No') {
				alert("이메일 중복체크를 해주세요.");
				return false;
			}

			if (document.getElementById('password').value != document.getElementById('password1').value) {
				alert("패스워드가 확인값과 일치 하지 않습니다.");
				document.getElementById('password').value = "";
				document.getElementById('password1').value = "";
				document.getElementById('password').focus();
				return false;
			}

			if (document.getElementById('businessNum').value != null && document.getElementById('btn1').value == 'No') {
				alert("사업자번호 중복체크를 해주세요.");
				return false;
			}

			return true;
		}

		function emailCheck() { // 아이디 중복체크
			let email = document.getElementById('email').value;
			let url = "ajaxEmailCheck.do?email=" + email;
			fetch(url)
				.then(response => response.text())
				.then(data => { // 결과처리 함수
					if (data == '1') {
						alert(email + "는 사용가능한 메일입니다.");
						document.getElementById('password').focus();
						document.getElementById('btn').value = 'Yes';
					} else {
						alert(email + "는 이미 사용중인 메일입니다.");
						email = "";
						document.getElementById('email').focus();
					}
				});
		}

		function businessNumCheck() {
			let businessNum = document.getElementById('businessNum').value;
			let url = "ajaxbusinessNumCheck.do?businessNum=" + businessNum;

			fetch(url)
				.then(response => response.text())
				.then(data => { // 결과처리 함수
					if (data == '1') {
						alert(id + "는 사용가능한 사업자번호입니다.");
						document.getElementById('businessNum').focus();
						document.getElementById('btn1').value = 'Yes';
					} else {
						alert(email + "는 이미 사용중인 사업자번호입니다.");
						document.getElementById('businessNum').value = "";
						document.getElementById('businessNum').focus();
					}
				});
		}

		function reset() {
			document.getElementById('email').value = "";
			document.getElementById('password').value = "";
			document.getElementById('password1').value = "";
			document.getElementById('name').value = "";
			document.getElementById('phone1').value = "";
			document.getElementById('phone2').value = "";
			document.getElementById('phone3').value = "";
			document.getElementById('businessNum').value = "";
		}
	</script>
</body>

</html>