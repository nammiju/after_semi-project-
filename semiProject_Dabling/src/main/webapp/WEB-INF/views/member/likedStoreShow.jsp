<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/all.min.css">
<link rel="stylesheet" href="assets/css/templatemo-style.css">
<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<!-- 어썸폰트 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
h2, form {
	font-family: 'Jua', sans-serif;
}

.paging .tm-paging {
	display: flex !important;
	justify-content: center;
}
</style>
</head>
<body>
	<div class="container-fluid tm-container-content tm-mt-60" id="storeList">
		<div class="row mb-4">
			<h2 class="col-6 tm-text-primary">내가 찜한 식당 </h2>
			<div class="col-6 d-flex justify-content-end align-items-center">
			</div>
		</div>
	<div class="row tm-mb-90 tm-gallery" id="store-list">
			<!--식당리스트 띄우기-->
			<c:forEach items="${likeList}" var="sl">
				<div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 mb-5"
					id="storeCard"
					onclick="location.href='store.do?storeCode=${sl.storeCode}'">
					<figure class="effect-ming tm-video-item">
						<c:if test="${not empty sl.storeImage }">
							<img src="${sl.storeImage}" alt="Image" class="img-fluid"
								style="width: 500px; height: 400px;">
						</c:if>
						<c:if test="${empty sl.storeImage }">
							<img src="assets/images/DablingLogo2.png" alt="Image"
								class="img-fluid" style="width: 500px; height: 400px;">
						</c:if>
						<figcaption
							class="d-flex align-items-center justify-content-center">
							<h2>${sl.storeName}</h2>
							<a>View more</a>
						</figcaption>
					</figure>
					<div class="d-flex justify-content-between tm-text-gray">
						<span class="tm-text-gray-light">${sl.storeCategory}</span><span class="tm-text-gray-dark">${sl.storeRegion}</span>
					</div>
				</div>
			</c:forEach>
		</div>

</body>
</html>