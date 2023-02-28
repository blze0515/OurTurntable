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
	<!--사이드바 부분-->
	        <div class="sidebar">
	            <dl>
	                <dt class="title">
	                    <img src="${pageContext.request.contextPath }/images/profile.png"alt="프로필">
	                </dt>
	                <div class="userNick">
	                  <a href="/mypage/readMypage.do">${loginUser.userNickname }</a>
	                  <img src="${pageContext.request.contextPath }/images/pen.png"alt="수정" id="pen">
	                </div>
	                <!-- grade/point=>GP -->
	                <div class="userGP">
		                <span class="userGrade">
		                  <a>등급 : </a>
		                  <!-- value 넣을곳 -->
		                  <a href="#" style="font-style: italic; color: skyblue;">1단계</a>
		                </span>
		                <span class="userPoint">
		                  <a>보유 포인트 : </a>
		                  <!-- value 넣을곳 -->
 <!-- script에서 a링크의 텍스트를 가져와서 콤마 찍고(정규식으로) 다시 .text()로 a링크에 보내면 콤마가 찍혀서 입력된다. -->
		                  <a href="/point/readPointHistoryList.do" style="font-style: italic; color: skyblue;" >${requestScope.userPoint }</a>
		                </span>
	                </div>
	                <dt>
	                  내역 조회
	                </dt>
	                <dd>
	                    <ul class="menu">
	                        <!-- 포인트 결제 관련하여 모든 내역조회(포인트 사용내역, 포인트 충전내역) -->
	                        <li class="menuli"><a href="/point/readPointHistoryList.do">포인트 충전 및 사용내역</a></li>
	                        <!-- 나를 후원해주는 사람들 리스트로 생성 클릭시 언제 얼마나 후원했는지 -->
	                        <li class="menuli"><a href="/mypage/readMyfanList.do">내가 받은 후원</a></li>
	                        <!-- 내가 후원하는 사람들 리스트로 생성 클릭시 언제 얼마나 후원했는지 -->
	                        <li class="endli"><a href="/mypage/readMystarList.do">내가 한 후원</a></li>
	                    </ul>
	                </dd>
	                
	                <dt>
	                  친구 관리
	                </dt>
	                <dd>
	                    <ul class="menu">
	                    	<!-- 내가 팔로우한 사람들 리스트(클릭시 상세정보/ 프로필) -->
	                        <li class="menuli"><a href="/mypage/readFollowingList.do">내가 팔로우한 사람들</a></li>
	                        <!-- 나를 팔로우한 사람들 리스트(클릭시 상세정보/ 프로필)) -->
	                        <li class="menuli"><a href="/mypage/readFollowerList.do">나를 팔로우한 사람들</a></li>
	                        <li class="menuli"><a href="/chat/readChatroomList.do">채팅방 목록</a></li>
	                        <li class="endli"><a href="/mypage/readBlockList.do">차단 목록관리</a></li>
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
	                        <li class="menuli"><a href="/user/updatePw.do">비밀번호 변경</a></li>
<!-- 	                        <li class="menuli"><a href="#">결제수단 변경</a></li> -->
	                        <li class="menuli"><a href="/user/updateUserCheck.do">회원정보 수정</a></li>		                       
	                        <li class="endli"><a href="/user/deleteUser.do">회원 탈퇴</a></li>
	                    </ul>
	                </dd>
	            </dl>
	        </div>
	        
	    <script>
	  	//천 단위 콤마 찍고 숫자


	  

	    </script>    
        
</body>
</html>