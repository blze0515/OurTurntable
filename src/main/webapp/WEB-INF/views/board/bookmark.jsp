<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
	.level-1{display:flex; justify-content:space-around; width:80%; height:350px;}
	.level-2{width:30%; height:350px; text-align:center; line-height:350px;}
</style>
</head>
<body>
<!-- 
								북마크 페이지 구현 계획
								1. boardList나 board 페이지에 북마크 추가하기 버튼을 넣고
									북마크에 등록/해제 하는 기능 구현
								2. 북마크 페이지에서 특정 메뉴를 선택하면 BoardList 페이지로 이동하는데
									JQuery 사용해서 북마크 표시 된 게시물만 화면에 조회 되도록 한다.

 -->



	<jsp:include page="${pageContext.request.contextPath }/header.jsp"></jsp:include>
	<div class="untree_co-section">
		<div class="container" style="width:75%; text-align:-webkit-center;">
<!-- 컨텐츠 부분 시작 -->

		<div class="level-1">
			<div class="level-2">
				<a href="/board/readBoardList.do?boardCategory=F">자유게시판 북마크</a>
			</div>
			<div class="level-2">
				<a href="/board/readBoardList.do?boardCategory=S">자랑게시판 북마크</a>
			</div>
			<div class="level-2">
				<a href="/board/readBoardList.do?boardCategory=R">추천게시판 북마크</a>
			</div>
		</div>
		
		
		
<!-- 컨텐츠 부분 끝 -->	
		</div>
	</div>
	<jsp:include page="${pageContext.request.contextPath }/footer.jsp"></jsp:include>
</body>
</html>