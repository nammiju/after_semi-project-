<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.tm-bg-bluegray {
    background-color: #ff5757;
}

.tm-bg-bluegray {
	color: white;
}


</style>
</head>
<body>
	<footer class="tm-bg-bluegray pb-3 tm-text-gray tm-footer">
		<div class="container-fluid tm-container-small">
			<div class="row">
				<div class="col-lg-6 col-md-12 col-12 px-5 mb-5">
					<h3 class="tm-text-primary mb-4 tm-footer-title">About Dabling</h3>
					<p>
						Dabling<a rel="sponsored"
							href="https://www.daeguoracle.com/homeMain/homepageMain">예담직업전문학교</a> 
							1강의실 1조의 중간프로젝트 결과물입니다. 조이름은 1인분입니다.
					</p>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-6 col-12 px-5 mb-5">
					<h3 class="tm-text-primary mb-4 tm-footer-title">Page Link</h3>
					<ul class="tm-footer-links pl-0">
						<li><a href="./main.do">Home</a></li>
						<c:choose>
							<c:when test="${empty email}">
								<li><a href="memberloginForm.do">Login</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="logout.do">Logout</a></li>
							</c:otherwise>
						</c:choose>
						<li><a href="memberJoinForm.do">Join</a></a></li>
						<c:if test="${ not empty email }">
							<li><a href="#top">Mypage</a></li>
						</c:if>
					</ul>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-6 col-12 px-5 mb-5">
					<img src="assets/images/DablingLogo4.png" width="150px" style="margin-top: 39px;">
				</div>
			</div>
			<div class="row">
				<div class="col-lg-8 col-md-7 col-12 px-5 mb-3">Copyright 2022
					My Single Portion. All rights reserved.</div>
				<div class="col-lg-4 col-md-5 col-12 px-5 text-right">
					Designed by <a href="https://templatemo.com" class="tm-text-gray"
						rel="sponsored" target="_parent">TemplateMo</a>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>