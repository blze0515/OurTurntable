<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
	.item img{
	width:300px;
	}
</style>
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath }/header.jsp"></jsp:include>
	<div class="untree_co-section" style="margin-top:5%;">
	    <div class="container" style="max-width:75%;">
	    			<!-- 	<div class="container" style="max-width:1200px; padding:0;"> -->
			
			<!-- 상단 제목 표시 -->
			<div class="row text-left justify-content-center mb-5" style="margin-bottom: -1rem!important;">
				<div class="col-lg-12">
					<h3 class="section-title text-left" style="text-align-last:center;" id="categoryName"></h3></div>
			</div>

<!-- 검색메뉴 -->	     	
			<form id="searchForm" action="/board/readRecBoardList.do" method="post">
				<input type="hidden" name="boardCategory" id="boardCategory" value="${boardCategory }">
								<!-- 키 값으로 객체를 꺼낸 뒤, 객체의 값을 꺼내는데 항상 field 이름으로 꺼낸다. -->
								<!-- boardController의 "sh 예시" 부분 확인 -->
<%-- 				<input type="hidden" name="userId" id="userId" value="${user.userId }"> --%>
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
				<table border="1" style="width: 700px; border-collapse: collapse;">
					<tr>
						<td align="right">
							<select name="searchCondition">
								<option value="all"
								<c:if test="${searchCondition eq 'all' }">selected="selected"</c:if>
								>전체</option>
								<option value="title"
								<c:if test="${searchCondition eq 'title' }">selected="selected"</c:if>
								>제목</option>
								<option value="content"
								<c:if test="${searchCondition eq 'content' }">selected="selected"</c:if>
								>내용</option>
								<option value="writer"
								<c:if test="${searchCondition eq 'writer' }">selected="selected"</c:if>
								>작성자</option>
							</select>
							<input type="text" name="searchKeyword" value="${searchKeyword }">
							<button type="button" id="btnSearch">검색</button>
						</td>
					</tr>
				</table>
			</form>
	     	
	     	
<!-- 기존 검색 메뉴  	     	
		     <div class="searchbar">
		     	  <select name="searchCondition" style="width:90px; height:35px; margin-right:5px;">
					<option value="all">전체</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="writer">작성자</option>
				 </select>
	              <form class="boardsearch">
	                  <input type="text" class="form" placeholder="검색어를 입력해 주세요." aria-label="Search" 
	                         style="width:350px; height:20px; padding:17px;
 	                                box-shadow: none;" > 
	                  <a href="#">
	                  	<img src="${pageContext.request.contextPath }/images/ico-search.png"alt="검색" 
	                  	     style="width:35px; height:30px; margin-top:6px;">
                  	  </a>
	              </form>
	          </div>
-->  

	         
	    	<div class="wrapper grid" style="display:grid; gap:15px;
	    									 grid-template-columns:repeat(auto-fit, minmax(30%, auto));
											 margin-top: 6%;
										     margin-bottom: 50px;">
				        <div class="item">
				            <img src="${pageContext.request.contextPath }/images/menu1.jpg" alt="메뉴1">
				            <span class="d-flex align-items-center loc mb-2">
								<span class="icon-room mr-3"></span>
								<span>수원 영통구</span>
							</span>
							<div class="d-flex align-items-center">
								<div>
									<h3><a href="#" style="font-weight:600">베이스7080라이브</a></h3>
									<div class="price ml-auto">
										<span style="font-weight:400;">- 라이브 카페</span>
									</div>
								</div>							
							</div>
				        </div>
				        <div class="item">
				            <img src="${pageContext.request.contextPath }/images/menu2.jpg" alt="메뉴2">
				             <span class="d-flex align-items-center loc mb-2">
								<span class="icon-room mr-3"></span>
								<span>수원 영통구</span>
							</span>
							<div class="d-flex align-items-center">
								<div>
									<h3><a href="#" style="font-weight:600">베이스7080라이브</a></h3>
									<div class="price ml-auto">
										<span style="font-weight:400;">- 라이브 카페</span>
									</div>
								</div>							
							</div>
				        </div>
				        <div class="item">
				            <img src="${pageContext.request.contextPath }/images/menu3.jpg" alt="메뉴3">
				             <span class="d-flex align-items-center loc mb-2">
								<span class="icon-room mr-3"></span>
								<span>수원 영통구</span>
							</span>
							<div class="d-flex align-items-center">
								<div>
									<h3><a href="#" style="font-weight:600">베이스7080라이브</a></h3>
									<div class="price ml-auto">
										<span style="font-weight:400;">- 라이브 카페</span>
									</div>
								</div>							
							</div>
				        </div>
				        <div class="item">
				            <img src="${pageContext.request.contextPath }/images/menu4.jpg" alt="메뉴4"">
				             <span class="d-flex align-items-center loc mb-2">
								<span class="icon-room mr-3"></span>
								<span>수원 영통구</span>
							</span>
							<div class="d-flex align-items-center">
								<div>
									<h3><a href="#" style="font-weight:600">베이스7080라이브</a></h3>
									<div class="price ml-auto">
										<span style="font-weight:400;">- 라이브 카페</span>
									</div>
								</div>							
							</div>
				        </div>
				        <div class="item">
				            <img src="${pageContext.request.contextPath }/images/menu5.jpg" alt="메뉴5" >
				             <span class="d-flex align-items-center loc mb-2">
								<span class="icon-room mr-3"></span>
								<span>수원 영통구</span>
							</span>
							<div class="d-flex align-items-center">
								<div>
									<h3><a href="#" style="font-weight:600">베이스7080라이브</a></h3>
									<div class="price ml-auto">
										<span style="font-weight:400;">- 라이브 카페</span>
									</div>
								</div>							
							</div>
				        </div>
				        <div class="item">
				            <img src="${pageContext.request.contextPath }/images/menu6.jpg" alt="메뉴6" >
				             <span class="d-flex align-items-center loc mb-2">
								<span class="icon-room mr-3"></span>
								<span>수원 영통구</span>
							</span>
							<div class="d-flex align-items-center">
								<div>
									<h3><a href="#" style="font-weight:600">베이스7080라이브</a></h3>
									<div class="price ml-auto">
										<span style="font-weight:400;">- 라이브 카페</span>
									</div>
								</div>							
							</div>
				        </div>
				        <div class="item">
				            <img src="${pageContext.request.contextPath }/images/menu7.jpg" alt="메뉴7" >
				             <span class="d-flex align-items-center loc mb-2">
								<span class="icon-room mr-3"></span>
								<span>수원 영통구</span>
							</span>
							<div class="d-flex align-items-center">
								<div>
									<h3><a href="#" style="font-weight:600">베이스7080라이브</a></h3>
									<div class="price ml-auto">
										<span style="font-weight:400;">- 라이브 카페</span>
									</div>
								</div>							
							</div>
				        </div>
				        <div class="item">
				            <img src="${pageContext.request.contextPath }/images/menu8.jpg" alt="메뉴8" >
				             <span class="d-flex align-items-center loc mb-2">
								<span class="icon-room mr-3"></span>
								<span>수원 영통구</span>
							</span>
							<div class="d-flex align-items-center">
								<div>
									<h3><a href="#" style="font-weight:600">베이스7080라이브</a></h3>
									<div class="price ml-auto">
										<span style="font-weight:400;">- 라이브 카페</span>
									</div>
								</div>							
							</div>
				        </div>
				        <div class="item">
				            <img src="${pageContext.request.contextPath }/images/menu9.jpg" alt="메뉴9" >
				             <span class="d-flex align-items-center loc mb-2">
								<span class="icon-room mr-3"></span>
								<span>수원 영통구</span>
							</span>
							<div class="d-flex align-items-center">
								<div>
									<h3><a href="#" style="font-weight:600">베이스7080라이브</a></h3>
									<div class="price ml-auto">
										<span style="font-weight:400;">- 라이브 카페</span>
									</div>
								</div>							
							</div>
				        </div>
				    </div>
			    </div>
		    </div>
     
       		<div>
                <ul class="pagination" style="display: flex; justify-content: center;">
                   <li class="page-item">
                     <a class="page-link" href="#" aria-label="Previous">
                       <span aria-hidden="true">&laquo;</span>
                     </a>
                   </li>
                   <li class="page-item"><a class="page-link" href="#">1</a></li>
                   <li class="page-item"><a class="page-link" href="#">2</a></li>
                   <li class="page-item"><a class="page-link" href="#">3</a></li>
                   <li class="page-item"><a class="page-link" href="#">4</a></li>
                   <li class="page-item">
                     <a class="page-link" href="#" aria-label="Next">
                       <span aria-hidden="true">&raquo;</span>
                     </a>
                   </li>
                </ul>
            </div>
            
            
<!--             글쓰기, 페이지네이션 추가 -->
				<div class="flex-right" style="margin-bottom:50px;">
				<!-- 글쓰기 화면에서도 일단 전부 input 만들어놓고 카테고리별로 필요 없는건 input에 disabled 주고 hide까지 줘야 한다.
					disabled만 주면 화면에는 보이기 때문에 -->
				<a href="/board/createRecBoard.do?boardCategory=${boardCategory }">
					<button type="button">
						글쓰기
					</button>
					</a>
				</div>
			

				<div >
					<ul class="pagination" style="display:flex; justify-content:center;">
						<c:if test="${pageMaker.prev }">
							<li class="pagination_button">
								<a href="${pageMaker.startPage - 1 }">Previous</a>
							</li>
						</c:if>
						
						<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
							<li class="pagination_button">
								<a href="${num }">${num }</a>
							</li>
						</c:forEach>
						
						<c:if test="${pageMaker.next }">
							<li class="pagination_button">
								<a href="${pageMaker.endPage + 1 }">Next</a>
							</li>
						</c:if>
					</ul>
				</div>
            
            
            
	<jsp:include page="${pageContext.request.contextPath }/footer.jsp"></jsp:include>
	
	
	<script>
	$(function() {
		//모든 컬럼 표시되도록 함수 하나 만들고 호출
		//showAll();
		
		//카테고리 분류별로 숨길 항목들을 숨기기
	  	if($("#boardCategory").val() == "F") {
	        $("#categoryName").text("자유 게시판");
	        
	        //$("#boardWriter").hide();
	     } else if($("#boardCategory").val() == "S") {
	        $("#categoryName").text("자랑 게시판");
	     } else if($("#boardCategory").val() == "R") {
	        $("#categoryName").text("추천 게시판");
	     }
		
		
	  	const searchForm = $("#searchForm");
		
		$(".pagination a").on("click", function(e) {
			e.preventDefault();
			
			$("input[name='pageNum']").val($(this).attr("href"));
			searchForm.submit();
		});
		
		$("#btnSearch").on("click", function() {
			$("input[name='pageNum']").val("1");
			searchForm.submit();
		});
	});
	
	</script>
	
</body>
</html>