<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
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
			
			
			<!-- 
			<table class="board-table">
					<tr class="mtr-head">
						<td class="mboard-seq board-table">글번호</td>
						<td class="mboard-title board-table" style="text-align:center;">제 목</td>
						<td class="mboard-nick board-table">작성자</td>
						<td class="mboard-date board-table">작성일</td>
						<td class="mboard-view board-table">조회수</td>
						<td class="mboard-like board-table">좋아요</td>
						<td class="mboard-donation board-table">후원금액</td>
					</tr>
					<tr class="mtr-content">
						<td class="mboard-seq board-table">100</td>
						<td class="mboard-title board-table">
							<div>
								<a href="#">노래자랑 100번째 자랑글</a>
							</div>
						</td>
						<td class="mboard-nick board-table">
							<div>
								<a href="#">콘서트7080</a>
							</div>
						</td>
						<td class="mboard-date board-table">2022-10-31</td>
						<td class="mboard-view board-table">100</td>
						<td class="mboard-like board-table">90</td>
						<td class="mboard-donation board-table">100,000</td>
					</tr>
					<tr class="mtr-content">
						<td class="mboard-seq board-table">99</td>
						<td class="mboard-title board-table">
							<div>
								<a href="#">노래자랑 99번째 자랑글</a>
							</div>
						</td>
						<td class="mboard-nick board-table">
							<div>
								<a href="#">콘서트7080</a>
							</div>
						</td>
						<td class="mboard-date board-table">2022-10-31</td>
						<td class="mboard-view board-table">5</td>
						<td class="mboard-like board-table">5</td>
						<td class="mboard-donation board-table">5,000</td>
					</tr>
				
			</table>
			 -->
			
			
			
			
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
				
			</table>
			
			
			<div class="flex-right" style="margin-bottom:50px;">
				<button type="submit" action="#">
					글쓰기
				</button>
			</div>
			
			
			
			<div style="text-align: center;">
				<ul class="pagination">
					<li class="pagination_button">
						<a href="#">1</a>
					</li>
					<li class="pagination_button">
						<a href="#">2</a>
					</li>
					<li class="pagination_button">
						<a href="#">Next</a>
					</li>
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
</body>
</html>