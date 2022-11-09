<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<link rel="shortcut icon" href="${pageContext.request.contextPath }/favicon.ico">
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
	
	<!-- <style>
		link[rel="shortcut icon"]{display: block;}
	</style> -->
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
				<div class="sh-index-nav">
					<a href="/main/main.do" class="logo m-0">
					<img src="/images/img_logo.jpg" style="height:90px";> <!-- Tour <span class="text-primary" ></span>-->
					</a>
					<a><h1>Our Turntable</h1> </a>
					<ul class="js-clone-nav d-none d-lg-inline-block text-left site-menu float-right">
						<li class="active"><a href="/main/main.do">Home</a></li>
						<li class="has-children">
							<a href="#">게시판</a>
							<ul class="dropdown">
								<!-- WEB-INF 폴더 안에 jsp 파일은 직접 접근이 불가능하여
								     컨트롤러의 메소드를 만들어서 viewResolver를 통해 해당 화면으로 이동 -->
								<li><a href="/board/readBoardList.do">자유 게시판</a></li>
								<li><a href="#">자랑 게시판</a></li>
								<li><a href="/board/readRecBoardList.do">추천 게시판</a></li>
							</ul>
						</li>
<!----------------------<li><a href="/main/services.do">Services</a></li>	 -->
						<li><a href="/main/about.do">팔로우</a></li>
						<li><a href="/main/contact.do">문의</a></li>
						<!-- 로그인/회원가입/마이페이지 드롭다운 -->
						<li class="has-children">
						  <c:choose>
						  	<c:when test="${loginUser eq null }">
								<a href="#">가입/로그인</a>
							</c:when>
							<c:otherwise>
							    <a>${loginUser.userId }</a>
							</c:otherwise>
						  </c:choose>
							<ul class="dropdown">
								<c:choose>
									<c:when test="${loginUser eq null }">
										<li><a href="/user/login.do">로그인</a></li>
										<li><a href="/user/createUser.do">회원가입</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="#">마이페이지</a></li>
										<li><a href="javascript:void(0)" onClick="javascript:logout()">로그아웃</a></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</li>
					</ul>
				</div>
				<a href="#" class="burger ml-auto float-right site-menu-toggle js-menu-toggle d-inline-block d-lg-none light" data-toggle="collapse" data-target="#main-navbar">
					<span></span>
				</a>

			</div>
		</div>
	</nav>


	<div class="hero">

	</div>
	
	<script>
		/* 로그아웃 요청을 POST로 보내기 */
		function logout(){
		    let f = document.createElement('form');
		    f.setAttribute('method', 'post');
		    f.setAttribute('action', '/user/logout.do');
		    document.body.appendChild(f);
		    f.submit();
		}

	</script>
</body>
</html>