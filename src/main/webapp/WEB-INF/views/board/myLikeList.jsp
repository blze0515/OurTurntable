<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
	.pagination {
		list-style: none;
		width: 100%;
		display: inline-block;
	}
	
	.pagination_button {
		float: left;
		margin: 0 5px 0 5px;
	}
</style>
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath }/header.jsp"></jsp:include>

	<div class="untree_co-section">
		<div class="container" style="width:75%;">
			<div class="row text-left justify-content-center mb-5" style="margin-bottom: -1rem!important;">
				<h3 class="section-title text-left" style="text-align-last:center;" id="categoryName"></h3>
			</div>

<!-- 검색메뉴 -->
			<form id="searchForm" action="/board/readBoardList.do" method="post">
				<input type="hidden" name="boardCategory" id="boardCategory" value="${boardCategory }">
								<!-- 키 값으로 객체를 꺼낸 뒤, 객체의 값을 꺼내는데 항상 field 이름으로 꺼낸다. -->
<!-- boardController의 "sh 예시" 부분 확인 -->
<%-- 				<input type="hidden" name="userId" id="userId" value="${user.userId }"> --%>
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
				<table border="1" style="width: 100%; border-collapse: collapse;">
					<tr>
						<td align="right">
						<!-- 검색기능 -->
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
			<table class="tr-table-border">
					<tr class="tr-head tr-center tr-table-border">
						<th class="tr-seq th-padding">글번호</th>
						<th class="tr-seq2 th-padding">카테고리</th>
						<th class="tr-title th-padding">제 목</th>
						<th class="tr-nick th-padding tr-left">작성자</th>
						<th class="tr-date th-padding">작성일</th>
						<th class="tr-view th-padding">조회수</th>
						<th class="tr-like th-padding">좋아요</th>
						<th class="tr-donation">후원금액</th>
					</tr>
					
			 	    <c:forEach var="board" items="${boardList }">
						<tr class="tr-content tr-center tr-table-border">
							<td class="tr-seq td-padding">${board.rownum }</td>
							<td class="tr-seq td-padding">${board.boardCategory == 'F' ? '자유' : 'R' ? '추천' : '자랑' }</td>
							<td class="tr-title td-padding tr-left">
								<div>
									<a href="/board/readBoard.do?boardSeq=${board.boardSeq }&boardCategory=${board.boardCategory}">${board.boardTitle }</a>
								</div>
							</td>
							<td class="tr-nick td-padding tr-left">
								<div>
									<a href="#">${board.userId }</a>
								</div>
							</td>
							<td class="tr-date td-padding">${board.boardRgstdate }</td>
							<td class="tr-like td-padding">${board.boardViewcount }</td>
							<td class="tr-view td-padding">좋아요</td>
							<td class="tr-like td-padding">후원금액</td>
							<td class="tr-donation"></td>
							</tr>
					</c:forEach>
			</table>
			
			
				<div class="flex-right" style="margin-bottom:50px;">
				<!-- 글쓰기 화면에서도 일단 전부 input 만들어놓고 카테고리별로 필요 없는건 input에 disabled 주고 hide까지 줘야 한다.
					disabled만 주면 화면에는 보이기 때문에 -->
				<a href="/board/createBoard.do?boardCategory=${boardCategory }">
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
		</div>
	</div>
	
	
	
	<jsp:include page="${pageContext.request.contextPath }/footer.jsp"></jsp:include>
  
  <div id="overlayer"></div>
  <div class="loader">
    <div class="spinner-border" role="status">
      <span class="sr-only">Loading...</span>
    </div>
  </div>
  
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
		     } else if($("#boardCategory").val() == "L"){
		    	 $("#categoryName").text("좋아요 모음 페이지");
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