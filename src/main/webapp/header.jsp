<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<link rel="shortcut icon" href="${pageContext.request.contextPath }/favicon.png">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&family=Source+Serif+Pro:wght@400;700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/owl.carousel.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/owl.theme.default.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/jquery.fancybox.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/fonts/icomoon/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/fonts/flaticon/font/flaticon.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/daterangepicker.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/aos.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
	
	<script src="${pageContext.request.contextPath }/js/jquery-3.6.1.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/popper.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/jquery.animateNumber.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/jquery.waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/jquery.fancybox.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/aos.js"></script>
	<script src="${pageContext.request.contextPath }/js/moment.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/daterangepicker.js"></script>
	<script src="${pageContext.request.contextPath }/js/typed.js"></script>
	<script src="${pageContext.request.contextPath }/js/custom.js"></script>
</head>
<body>
	<div class="site-mobile-menu site-navbar-target">
		<div class="site-mobile-menu-header">
			<div class="site-mobile-menu-close">
				<span class="icofont-close js-menu-toggle"></span>
			</div>
		</div>
		<div class="site-mobile-menu-body"></div>
	</div>

	<nav class="site-nav">
		<div class="container">
			<div class="site-navigation">
				<a href="index.jsp" class="logo m-0">Tour <span class="text-primary">.</span></a>

				<ul class="js-clone-nav d-none d-lg-inline-block text-left site-menu float-right">
					<li class="active"><a href="#">Home</a></li>
					<li class="has-children">
						<a href="#">Dropdown</a>
						<ul class="dropdown">
							<!-- WEB-INF 폴더 안에 jsp 파일은 직접 접근이 불가능하여
							     컨트롤러의 메소드를 만들어서 viewResolver를 통해 해당 화면으로 이동 -->
							<li><a href="#">Elements</a></li>
							<li><a href="#">Menu One</a></li>
							<li class="has-children">
								<a href="#">Menu Two</a>
								<ul class="dropdown">
									<li><a href="#">Sub Menu One</a></li>
									<li><a href="#">Sub Menu Two</a></li>
									<li><a href="#">Sub Menu Three</a></li>
								</ul>
							</li>
							<li><a href="#">Menu Three</a></li>
						</ul>
					</li>
					<li><a href="/main/about.do">Services</a></li>
					<li><a href="#">About</a></li>
					<li><a href="#">Contact Us</a></li>
				</ul>

				<a href="#" class="burger ml-auto float-right site-menu-toggle js-menu-toggle d-inline-block d-lg-none light" data-toggle="collapse" data-target="#main-navbar">
					<span></span>
				</a>

			</div>
		</div>
	</nav>


	<div class="hero">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-7">
					<div class="intro-wrap">
						<h1 class="mb-5"><span class="d-block">Let's Enjoy Your</span> Trip In <span class="typed-words"></span></h1>

						<div class="row">
							<div class="col-12">
								<form class="form">
									<div class="row mb-2">
										<div class="col-sm-12 col-md-6 mb-3 mb-lg-0 col-lg-4">
											<select name="" id="" class="form-control custom-select">
												<option value="">Destination</option>
												<option value="">Peru</option>
												<option value="">Japan</option>
												<option value="">Thailand</option>
												<option value="">Brazil</option>
												<option value="">United States</option>
												<option value="">Israel</option>
												<option value="">China</option>
												<option value="">Russia</option>
											</select>
										</div>
										<div class="col-sm-12 col-md-6 mb-3 mb-lg-0 col-lg-5">
											<input type="text" class="form-control" name="daterange">
										</div>
										<div class="col-sm-12 col-md-6 mb-3 mb-lg-0 col-lg-3">
											<input type="text" class="form-control" placeholder="# of People">
										</div>

									</div>    
									<div class="row align-items-center">
										<div class="col-sm-12 col-md-6 mb-3 mb-lg-0 col-lg-4">
											<input type="submit" class="btn btn-primary btn-block" value="Search">
										</div>
										<div class="col-lg-8">
											<label class="control control--checkbox mt-3">
												<span class="caption">Save this search</span>
												<input type="checkbox" checked="checked" />
												<div class="control__indicator"></div>
											</label>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-5">
					<div class="slides">
						<img src="${pageContext.request.contextPath }/images/hero-slider-1.jpg" alt="Image" class="img-fluid active">
						<img src="${pageContext.request.contextPath }/images/hero-slider-2.jpg" alt="Image" class="img-fluid">
						<img src="${pageContext.request.contextPath }/images/hero-slider-3.jpg" alt="Image" class="img-fluid">
						<img src="${pageContext.request.contextPath }/images/hero-slider-4.jpg" alt="Image" class="img-fluid">
						<img src="${pageContext.request.contextPath }/images/hero-slider-5.jpg" alt="Image" class="img-fluid">
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>