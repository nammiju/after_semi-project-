<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<style>
</style>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/all.min.css">
<link rel="stylesheet" href="assets/css/templatemo-style.css">
<!-- 어썸폰트 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
	<div id="loader-wrapper">
		<div id="loader"></div>

		<div class="loader-section section-left"></div>
		<div class="loader-section section-right"></div>

	</div>


	<div class="tm-hero d-flex justify-content-center align-items-center"
		data-parallax="scroll" data-image-src="assets/images/food.jpg">
		<form class="d-flex tm-search-form">
			<select class="form-control" id="searchColumn">
				<option value="storeName">식당이름</option>
				<option value="storeRegion">지역명</option>
				<option value="storeCategory">음식종류</option>
			</select> <input class="form-control tm-search-input" type="search"
				aria-label="Search" id="searchKey" placeholder="Search">
			<button class="btn btn-outline-success tm-search-btn" type="button"
				id="searchSubmit">
				<i class="fa-solid fa-magnifying-glass"></i>
			</button>
		</form>
	</div>

	<div class="container-fluid tm-container-content tm-mt-60"
		id="storeList">
		<div class="row mb-4">
			<h2 class="col-6 tm-text-primary">식당 리스트</h2>
			<div class="col-6 d-flex justify-content-end align-items-center">
				<form action="" class="tm-text-primary">
					Page <input type="text" value="1" size="1"
						class="tm-input-paging tm-text-primary"> of 200
				</form>
			</div>
		</div>

		<div class="row tm-mb-90 tm-gallery" id="store-list">
			<!--식당리스트 띄우기-->
			<c:forEach items="${storeList}" var="sl">
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
						<span class="tm-text-gray-light">${sl.storeCategory}</span> <span>${sl.storeRegion}</span>
					</div>
				</div>
			</c:forEach>
		</div>

		<!-- 페이지 넘기기 -->
		<div class="row tm-mb-90">
			<div
				class="col-12 d-flex justify-content-between align-items-center tm-paging-col">
				<a href="javascript:void(0);"
					class="btn btn-primary tm-btn-prev mb-2 disabled">Previous</a>
				<div class="tm-paging d-flex">
					<a href="javascript:void(0);" class="active tm-paging-link">1</a> <a
						href="javascript:void(0);" class="tm-paging-link">2</a> <a
						href="javascript:void(0);" class="tm-paging-link">3</a> <a
						href="javascript:void(0);" class="tm-paging-link">4</a>
				</div>
				<a href="javascript:void(0);" class="btn btn-primary tm-btn-next">Next
					Page</a>
			</div>
		</div>
	</div>
	<!-- container-fluid, tm-container-content -->
	<script>
		document.querySelector('#searchSubmit').addEventListener('click',
				searchFnc);

		function searchFnc() {
			let searchColumn = document.getElementById('searchColumn').value;
			let searchKey = document.getElementById('searchKey').value;
			let data = "searchColumn=" + searchColumn + "&searchKey="
					+ searchKey;
			location.href = 'ajaxStoreSearch.do?' + data;

		}
	</script>
</body>

</html>