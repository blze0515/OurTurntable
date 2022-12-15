<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/myMain.css">
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath }/header.jsp"></jsp:include>
	
	<div class="untree_co-section" style="margin-top:5%;">
	    <div class="container" style="max-width:1200px; padding:0; display:flex;">
		     <jsp:include page="${pageContext.request.contextPath }/mySide.jsp"></jsp:include>   
	         <div class="container-content" style="width:75%; padding-left:5%;">
	         	<!-- 이번달 요약 정보 -->
	         	<div class="monthInfo">
	         		<!-- 수익 -->
	         		<span>
	         			<img src="${pageContext.request.contextPath }/images/money.png" alt="수익">
	         			<span style="display:flex;">
	         				<!-- value -->
		         			<a>10,000</a>
		         			<a>Point</a>
		         		</span>
	         		</span>
	         		
	         		<!-- 팔로워 -->
	         		<span>
	         			<img src="${pageContext.request.contextPath }/images/follower.png" alt="팔로우">
	         			<span style="display:flex;">
	         				<!-- value -->
		         			<a>100</a>
		         			<a>K</a>
		         		</span>
	         		</span>
	         		
	         		<!-- 좋아요 -->
	         		<span>
	         			<img src="${pageContext.request.contextPath }/images/like.png" alt="좋아요">
	         			<span style="display:flex;">
	         				<!-- value -->
		         			<a>1,000</a>
		         			<a>Like</a>
		         		</span>
	         		</span>
	         	</div>
	         	
	         	<!-- 게시물류 요약 정보 -->
	         	<div class="myInfo">
	         		<!-- 내가 댓글 작성한 게시물 -->
	         		<div class="semiInfo">
	         			<h1>내가 댓글 작성한 게시물</h1>
	         			<div class="mytable">
		         			<table>       				
			         				<tr>
			         					<!-- 게시물 번호 -->
			         					<th>번호</th>
			         					<!-- 게시물 제목 -->
			         					<td>제목 입니다~~~~~~~~</td>				         					
			         				</tr>
		         			</table>
	         			</div>
	         			<div class="myBtn">        			
         					<button type="button">더보기 + </button>
         				</div> 
	         		</div>
	         		
	         		<!-- 내가 좋아요 누른 게시물 -->
	         		<div class="semiInfo">
	         			<h1>내가 좋아요누른 게시물</h1>
	         			<div class="mytable">
		         			<table>       				
			         				<tr>
			         					<c:choose>
										<c:when test="${loginUser eq null }">
											<li><a href="/user/login.do">로그인</a></li>
										</c:when>
										<c:otherwise>
					         					<!-- 게시물 번호 -->
					         					<th>번호</th>
					         					<!-- 게시물 제목 -->
					         					<td>제목 입니다~~~~~~~~</td>
										</c:otherwise>
			         					</c:choose>
			         				</tr>
		         			</table>
	         			</div>
	         			<div class="myBtn">        			
         					<button type="button">더보기 + </button>
         				</div> 
	         		</div>
	         		
	         		<!-- 내가 작성한 게시물(자랑) -->
	         		<div class="semiInfo">
	         			<h1>자랑 게시판 작성글</h1>
	         			<div class="mytable">
		         			<table>       				
			         				<tr>
			         					<c:choose>
										<c:when test="${loginUser eq null }">
											<li><a href="/user/login.do">로그인</a></li>
										</c:when>
										<c:otherwise>
					         					<!-- 게시물 번호 -->
					         					<th>번호</th>
					         					<!-- 게시물 제목 -->
					         					<td>제목 입니다~~~~~~~~</td>
										</c:otherwise>
			         					</c:choose>
			         				</tr>
		         			</table>
	         			</div>
	         			<div class="myBtn">        			
         					<button type="button">더보기 + </button>
         				</div> 
	         		</div>
	         		
	         		<!-- 내가 작성한 게시물(추천) -->
	         		<div class="semiInfo">
	         			<h1>추천 게시판 작성글</h1>
	         			<div class="mytable">
		         			<table>       				
			         				<tr>
			         					<c:choose>
										<c:when test="${loginUser eq null }">
											<li><a href="/user/login.do">로그인</a></li>
										</c:when>
										<c:otherwise>
					         					<!-- 게시물 번호 -->
					         					<th>번호</th>
					         					<!-- 게시물 제목 -->
					         					<td>제목 입니다~~~~~~~~</td>
										</c:otherwise>
			         					</c:choose>
			         				</tr>
		         			</table>
	         			</div>
	         			<div class="myBtn">        			
         					<button type="button">더보기 + </button>
         				</div> 
	         		</div>
	         	</div>
	         	
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