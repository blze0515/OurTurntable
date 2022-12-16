<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
/*form input::file-selector-button{
display:none;
}*/
</style>
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath }/header.jsp"></jsp:include>
	
	<div class="untree_co-section">
		<div class="container my-5">
	
			<div class="board-form" >
<!-- 게시판 제목 <script>로 표시함 / header에서 컨트롤러 타고 넘어온 페이지라 model에 boardCategory 담겨서 옴. -->
			<h3 class="section-title text-left" style="text-align-last:center;" id="categoryName"></h3>
			
			<form action="/board/createBoard.do" method="post" enctype="multipart/form-data">
			<!-- input hidden은 form 을 submit 하면 input들도 같이 넘어가는데 boardCategory 값을 넘겨주기 위해서 추가한 것임. -->
				<input type="hidden" name="boardCategory" id="boardCategory" value="${boardCategory }">
				<table border="1" style="border-collapse: collapse">
					<tbody>
						<tr>
							<td style="text-align:center;">
								<img src="/images/heart-empty.png">
							</td>
						</tr>
						<tr>
							<td style="background: orange; width: 70px;">
								제목
							</td>
							<td style="text-align: left;">
								<input type="text" name="boardTitle" id="boardTitle" required="">
							</td>
						</tr>
						<tr>
							<td style="background: orange;">
								작성자
							</td>
							<td style="text-align: left;">
								<input type="text" name="userId" value="${loginUser.userId }" readonly="">
							</td>
						</tr>
						<tr>
							<td style="background: orange; width: 70px;">
								내용
							</td>
							<td style="text-align: left;">
								<textarea name="boardContent" cols="40" rows="10" required=""></textarea>
							</td>
						</tr>
						<tr>
							<td style="background: orange; width: 70px;">
								업로드
							</td>
							<td align="left">
								<!-- 파일 선택 버튼 -->
								<label for="input-img"></label>
									<!--  multiple속성은 boolean 타입임. 속성을 명시하지 않으면 false값을 가지고, 명시하면 true 값을 가지게 된다. -->
									<input type="file" name="uploadFiles" multiple="multiple">
								
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<button type="submit">등록하기</button>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
			
			</div>
			
			
			<div style="height:20px; width:100%;"></div>
			<hr/>
			<h5 style="margin:10px 0 10px 0; text-align:center;">
				<a href="/board/readBoardList.do?boardCategory=${board.boardCategory }">글 목록 보기</a>
			</h5>
			<hr/>
		
		</div>
	</div>
		
		
	<jsp:include page="${pageContext.request.contextPath }/footer.jsp"></jsp:include>
	
	<script>
		$(function(){
			if($("#boardCategory").val()== "F"){
				$("#categoryName").text("자유게시판");
			} else if($("#boardCategory").val()=="S"){
				$("#categoryName").text("자랑게시판");
			} else if($("#boardCategory").val()=="R"){
				$("#categoryName").text("추천게시판");
			}
		});
	</script>
</body>
</html>