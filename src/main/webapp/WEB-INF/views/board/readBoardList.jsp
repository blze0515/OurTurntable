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
		margin-left: 5px;
	}
</style>
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath }/header.jsp"></jsp:include>

	<div class="untree_co-section">
		<div class="container" style="width:75%;">
			<div class="row text-left justify-content-center mb-5" style="margin-bottom: -1rem!important;">
				<div class="col-lg-12"><h3 class="section-title text-left" style="text-align-last:center;">자랑 게시판</h3></div>
			</div>
			<div class="flex-right" style="height:20px; margin-top:20px; text-align:end!important;">
				<a href="#">
					더 보기<img src="/images/img_logo.jpg" style="height:20px;">
				</a>
			</div>
			
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
			<table class="tr-table-border">
					<tr class="tr-head tr-center tr-table-border">
						<td class="tr-seq th-padding">글번호</td>
						<td class="tr-title th-padding">제 목</td>
						<td class="tr-nick th-padding tr-left">작성자</td>
						<td class="tr-date th-padding">작성일</td>
						<td class="tr-view th-padding">조회수</td>
						<td class="tr-like th-padding">좋아요</td>
						<td class="tr-donation">후원금액</td>
					</tr>
					
					<!-- 
					<tr class="tr-content tr-center tr-table-border">
						<td class="tr-seq td-padding">100</td>
						<td class="tr-title td-padding tr-left">
							<div>
								<a href="#">노래자랑 100번째 자랑글</a>
							</div>
						</td>
						<td class="tr-nick td-padding tr-left">
							<div>
								<a href="#">콘서트7080</a>
							</div>
						</td>
						<td class="tr-date td-padding">2022-10-31</td>
						<td class="tr-view td-padding">100</td>
						<td class="tr-like td-padding">90</td>
						<td class="tr-donation">100,000</td>
					</tr>
					 -->
			 	    <c:forEach var="board" items="${boardList }">
						<tr class="tr-content tr-center tr-table-border">
							<td class="tr-seq td-padding">${board.boardSeq }</td>
							<td class="tr-title td-padding tr-left">
								<div>
									<a href="#">${board.boardTitle }</a>
								</div>
							</td>
							<td class="tr-nick td-padding tr-left">
								<div>
									<a href="#">${board.userId }</a>
								</div>
							</td>
							<td class="tr-date td-padding">${board.boardRgstdate }</td>
							<td class="tr-view td-padding">좋아요</td>
							<td class="tr-like td-padding">후원금액</td>
							<td class="tr-donation"></td>
							</tr>
					</c:forEach>
					 
				
			</table>
			
			
				<div class="flex-right" style="margin-bottom:50px;">
				<a href="/board/insertBoard.do">
					<button type="button">
						글쓰기
					</button>
					</a>
				</div>
			

			
			<div style="text-align: center;">
				<ul class="pagination">
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