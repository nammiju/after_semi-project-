<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/all.min.css">
<link rel="stylesheet" href="assets/css/templatemo-style.css">
<style>
.menuSection {
	position: fixed;
}

.menuSection, .bodySection {
	float: left;
}

.bodySection {
	margin-bottom: 50px;
	min-height:600px;
}

.footerSection {
	clear: both;
}
</style>
</head>
<body>



	<!-- ***** Header Area Start ***** -->
	<div>
		<tiles:insertAttribute name="header" />
	</div>

	<!-- ***** Header Area End ***** -->

	<div class="col-xl-12 ">
		<c:choose>
			<c:when test="${ not empty email }">
				<div class=" col-xl-2 menuSection">
					<tiles:insertAttribute name="menu" />
				</div>
				<div class="col-xl-10 bodySection" style="margin-left: 265px">
					<tiles:insertAttribute name="body" />
				</div>
			</c:when>
			<c:otherwise>
				<div class="col-xl-12 bodySection">
					<tiles:insertAttribute name="body" />
				</div>
			</c:otherwise>
		</c:choose>

	</div>

	<!-- ***** body***** -->

	<!-- ***** Footer Start ***** -->
	<div class="footerSection">
		<tiles:insertAttribute name="footer" />
	</div>
	<!-- Footer End -->

	<script src="assets/js/plugins.js"></script>
	<script>
		$(window).on("load", function() {
			$('body').addClass('loaded');
		});
	</script>
</body>
</html>