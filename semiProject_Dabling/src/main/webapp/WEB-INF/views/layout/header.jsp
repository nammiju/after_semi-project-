<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Dabling</title>
<style>
.navbar-brand img {
	width: 100%;
	max-height: 100%
}
</style>
</head>

<body>
	<!-- Page Loader -->
	<header class="header-area header-sticky">

		<nav class="navbar navbar-expand-lg">
			<div class="container-fluid">
				<a class="navbar-brand" href="./main.do"><img
					src="assets/images/DablingLogo1.png"> </a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<i class="fas fa-bars"></i>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ml-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link nav-link-1 active"
							aria-current="page" href="./main.do" class="active">Home</a></li>
						<li class="nav-item"><a class="nav-link nav-link-1"
							href="noticeForm.do">Notice</a></li>
						<c:if test="${empty email }">
							<li class="nav-item"><a class="nav-link nav-link-2"
								href="memberloginForm.do">Login</a></li>
							<li class="nav-item"><a class="nav-link nav-link-3"
								href="memberJoinForm.do">Join</a></li>
						</c:if>
						<c:if test="${ not empty email }">
							<li class="nav-item"><a class="nav-link nav-link-4">Mypage</a></li>
							<li class="nav-item"><a class="nav-link nav-link-2"
								href="logout.do">Logout</a></li>

						</c:if>


						<!-- 
                            <li class="submenu">
                                <a href="javascript:;">Drop Down</a>
                                <ul>
                                    <li><a href="#">Drop Down Page 1</a></li>
                                    <li><a href="#">Drop Down Pag 
                                    e 2</a></li>
                                    <li><a href="#">Drop Down Page 3</a></li>
                                </ul>
                                
                            </li>
                        -->

						<!-- <li class=""><a rel="sponsored" href="https://templatemo.com" target="_blank">External URL</a></li> -->




					</ul>
				</div>
			</div>
		</nav>
	</header>
</body>

</html>