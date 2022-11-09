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
		                  <!-- value 넣을곳 -->
		                  <a>1단계</a>
		                </span>
		                <span class="userPoint">
		                  <a>보유 포인트 : </a>
		                  <!-- value 넣을곳 -->
		                  <a>10,000</a>
		                </span>
	                </div>
	                <dt>
	                  내역 조회
	                </dt>
	                <dd>
	                    <ul class="menu">
	                        <!-- 포인트 결제 관련하여 모든 내역조회(포인트 사용내역, 포인트 충전내역) -->
	                        <li class="menuli"><a href="#">결제내역</a></li>
	                        <!-- 나를 후원해주는 사람들 리스트로 생성 클릭시 언제 얼마나 후원했는지 -->
	                        <li class="menuli"><a href="#">내가 받은 후원</a></li>
	                        <!-- 내가 후원하는 사람들 리스트로 생성 클릭시 언제 얼마나 후원했는지 -->
	                        <li class="endli"><a href="#">내가 한 후원</a></li>
	                    </ul>
	                </dd>
	                
	                <dt>
	                  친구 관리
	                </dt>
	                <dd>
	                    <ul class="menu">
	                    	<!-- 내가 팔로우한 사람들 리스트(클릭시 상세정보/ 프로필) -->
	                        <li class="menuli"><a href="#">내가 팔로우한 사람들</a></li>
	                        <!-- 나를 팔로우한 사람들 리스트(클릭시 상세정보/ 프로필)) -->
	                        <li class="menuli"><a href="#">나를 팔로우한 사람들</a></li>
	                        <li class="menuli"><a href="#">채팅방 목록</a></li>
	                        <li class="endli"><a href="#">차단 목록관리</a></li>
	                    </ul>
	                </dd>
	                
	                <dt>
	                  게시물 관리
	                </dt>
	                <dd>
	                    <ul class="menu">
	                        <li class="menuli"><a href="#">내가 작성한 게시글</a></li>
	                        <li class="menuli"><a href="#">좋아요 표시한 게시글</a></li>	                       
	                        <li class="endli"><a href="#">댓글단 게시글</a></li>
	                    </ul>
	                </dd>
	                
	                <dt>
	                  개인정보 수정
	                </dt>
	                <dd>
	                    <ul class="menu">
	                        <li class="menuli"><a href="#">비밀번호 변경</a></li>
	                        <li class="menuli"><a href="#">결제수단 변경</a></li>
	                        <li class="menuli"><a href="#">회원정보 수정</a></li>		                       
	                        <li class="endli"><a href="#">회원 탈퇴</a></li>
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