<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/mypage.css">
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath }/header.jsp"></jsp:include>
	
	<div class="untree_co-section" style="margin-top:5%;">
	    <div class="container" style="max-width:1200px; padding:0; display:flex;">
	        <!--사이드바 부분-->
	        <div class="sidebar">
	            <dl>
	                <dt class="title">
	                    <img src="${pageContext.request.contextPath }/images/profile.png"alt="프로필">
	                </dt>
	                <span class="userNick">
	                  <a>회원 닉네임</a>
	                  <img src="${pageContext.request.contextPath }/images/pen.png"alt="수정" id="pen">
	                </span>
	                <!-- grade/point=>GP -->
	                <div class="userGP">
		                <span class="userGrade">
		                  <a>등급 : </a>
		                  <a>1단계</a>
		                </span>
		                <span class="userPoint">
		                  <a>보유 포인트 : </a>
		                  <a>10,000</a>
		                </span>
	                </div>
	                <dt>
	                  
	                </dt>
	                <dd>
	                    <ul class="menu">
	                        <li class="menuli"><a href="/admin/adminUser.do">회원 관리</a></li>
	                        <li class="menuli"><a href="/admin/adminGrade.do">등급 관리</a></li>
	                        <li class="endli"><a href="/admin/adminBoard.do">게시물 관리</a></li>
	                    </ul>
	                </dd>
	            </dl>
	        </div>
        
            
        </div>
      </div>
	<jsp:include page="${pageContext.request.contextPath }/footer.jsp"></jsp:include>
	
	<div id="overlayer"></div>
  <div class="loader">
    <div class="spinner-border" role="status">
      <span class="sr-only">Loading...</span>
    </div>
  </div>
</body>
</html>