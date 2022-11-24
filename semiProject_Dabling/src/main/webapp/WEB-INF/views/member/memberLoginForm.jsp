<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Login</title>
<style>
.mainform {
	width: 100%;
	height: 100%;
}

.loginForm {
	text-align: center;
}

/* css템플릿 */
body {
	font-family: 'Montserrat', sans-serif;
	background: white;
	height: 100%;
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
	padding-left: 220px;
}

.links li {
	display: inline-block;
	margin: 0 20px 0 0;
	transition: .2s linear;
}

.links li:nth-child(2) {
	opacity: .6;
}

.links li:hover {
	opacity: 1;
}

.links li:nth-child(3) {
	opacity: .6;
}

.links li:hover {
	opacity: 1;
}

.aTag {
	text-decoration: none;
	color: #0f132a;
	font-weight: bolder;
	text-align: center;
	cursor: pointer;
}

p {
	color: #BDB8B8;
}

form {
	width: 100%;
	max-width: 680px;
	margin: 40px auto 10px;
}

.input__block {
	margin: 20px auto;
	display: block;
	position: relative;
	text-align: center;
}

.first-input__block::before {
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

.signup-input__block::before {
	content: "";
	position: absolute;
	top: -15px;
	left: 150px;
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
	display: block;
	width: 90%;
	max-width: 680px;
	height: 50px;
	margin: 0 auto;
	border-radius: 8px;
	border: none;
	background: rgba(#0f132a, .1);
	color: rgba(#0f132a, .3);
	padding: 0 0 0 15px;
	font-size: 14px;
	font-family: 'Montserrat', sans-serif;
}

input:focus:active {
	outline: none;
	border: none;
	color: rgba(#0f132a, 1);
}

.find {
	color: rgba(#0f132a, .4);
	font-size: 14px;
	text-align: center;
}

.signin__btn {
	background: rgb(255, 87, 87);
	color: white;
	display: block;
	width: 92.5%;
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

.kakao__btn {
	display: block;
	width: 92.5%;
	max-width: 680px;
	margin: 20px auto;
	height: 50px;
	cursor: pointer;
	font-size: 14px;
	font-family: 'Montserrat', sans-serif;
	border-radius: 8px;
	border: none;
	line-height: 40px;
	background: #ffee00;
	color: #665511;
	box-shadow: 0 15px 30px rgba(#ddcc00, .36);
	transition: .2s linear;
}

.signin__btn:hover {
	box-shadow: 0 0 0 rgba(#e91e63, .0);
}

.separator {
	display: block;
	margin: 30px auto 10px;
	text-align: center;
	height: 40px;
	position: relative;
	background: transparent;
	color: rgba(#0f132a, .4);
	font-size: 13px;
	width: 90%;
	max-width: 680px;
}

.separator::before {
	content: "";
	position: absolute;
	top: 8px;
	left: 0;
	background: rgba(#0f132a, .2);
	height: 1px;
	width: 45%;
}

.separator::after {
	content: "";
	position: absolute;
	top: 8px;
	right: 0;
	background: rgba(#0f132a, .2);
	height: 1px;
	width: 45%;
}

.fa {
	font-size: 20px;
	padding: 0 5px 0 0;
}

.fa:hover {
	box-shadow: 0 0 0 rgba(#5b90f0, .0);
}

.fa {
	font-size: 20px;
	padding: 0 5px 0 0;
}

.fa :hover {
	box-shadow: 0 0 0 rgba(#25282d, .0);
}
</style>
</head>

<body>
	<div class="mainform">
		<div class="container">
			<!-- Heading -->
			<h1>SIGN IN</h1>

			<!-- Links -->
			<ul class="links">
				<li><a href="#" class="aTag" id="signin">SIGN IN</a></li>
				<li><a href="memberJoinForm.do" class="aTag" id="signup">SIGN UP</a></li>
				<li><a onclick="reset();" class="aTag" id="reset">RESET</a></li>
			</ul>

			<!-- Form -->
			<form action="memberLogin.do" method="post">
				<!-- email input -->
				<div class="first-input input__block first-input__block">
					<input type="email" id="email" name="email" placeholder="Email"
						required="required" />
				</div>
				<!-- password input -->
				<div class="input__block">
					<input type="password" id="password" name="password"
						placeholder="Password" required="required" />
				</div>
				<!-- sign in button -->
				<input type="submit" class="signin__btn" value="Sign in    ">
				<div class="find">
					<a href="findPasswordForm.do" class="aTag">Find Password</a>
				</div>
			</form>
			<!-- separator -->
			<div class="separator">
				<p>OR</p>
			</div>
			<!-- kakao button -->
			<button class="kakao__btn" onclick="kakaoLogin();">
				<i class="fa fa-kakao"></i> Sign in with kakao
			</button>
		</div>
	</div>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript">
		Kakao.init("8fd6e2817c7b55bad682e268c8fc4923");

		function kakaoLogin() {
			window.Kakao.Auth.login({
				scope: 'profile_nickname, account_email',
				success: function (authObj) {
					console.log(authObj);
					window.Kakao.API.request({
						url: '/v2/user/me',
						success: res => {
							const kakao_account = res.kakao_account;
							var email = res.kakao_account.email;
							let url = "kakaoLogin.do?email=" + email;
							location.href = url;

						}
					});
				}
			});
		}
		$(document).ready(function () {
			let signup = $(".links").find("li").find("#signup");
			let signin = $(".links").find("li").find("#signin");
			let reset = $(".links").find("li").find("#reset");
			let first_input = $("form").find(".first-input");
			let hidden_input = $("form").find(".input__block").find("#repeat__password");
			let signin_btn = $("form").find(".signin__btn");

			//----------- sign up ---------------------
			signup.on("click", function (e) {
				e.preventDefault();
				$(this).parent().parent().siblings("h1").text("SIGN UP");
				$(this).parent().css("opacity", "1");
				$(this).parent().siblings().css("opacity", ".6");
				first_input.removeClass("first-input__block").addClass("signup-input__block");
				hidden_input.css({
					"opacity": "1",
					"display": "block"
				});
				signin_btn.text("Sign up");
			});


			//----------- sign in ---------------------
			signin.on("click", function (e) {
				e.preventDefault();
				$(this).parent().parent().siblings("h1").text("SIGN IN");
				$(this).parent().css("opacity", "1");
				$(this).parent().siblings().css("opacity", ".6");
				first_input.addClass("first-input__block")
					.removeClass("signup-input__block");
				hidden_input.css({
					"opacity": "0",
					"display": "none"
				});
				signin_btn.text("Sign in");
			});

			//----------- reset ---------------------

		});

		function reset() {
			document.getElementById('email').value = "";
			document.getElementById('password').value = "";
		}
	</script>
</body>

</html>