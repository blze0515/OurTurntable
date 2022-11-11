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
		<div class="container my-5">
	<h3 style="text-align:center;">게시글 상세</h3>
			<div style="display:block; justify-content: center; align-items: center;">
				
				<div style="display:flex; justify-content:center; width:100%;">
					<form action="/board/updateBoard.do" method="post" enctype="multipart/form-data">
						<input type="hidden" name="boardSeq" value="${board.boardSeq }">
						<table border="1" style="border-collapse: collapse;">
							<tr>
								<td style="background: orange; width: 70px">
									제목
								</td>
								<td style="text-align: left">
									<input type="text" name="boardTitle" id="boardTitle" value="${board.boardTitle }">
								</td>
							</tr>
							<tr>
								<td style="background: orange;">
									작성자
								</td>
								<td style="text-align: left">
									<input type="text" name="userId" id="userId" value="${board.userId }" readonly>
								</td>
							</tr>
							<tr>
								<td style="background: orange;">
									내용
								</td>
								<td style="text-align: left">
									<textarea name="boardContent" id="boardContent" cols="40" rows="10">${board.boardContent }</textarea>
								</td>
							</tr>
							<tr>
								<td style="background: orange;">
									작성일
								</td>
								<td style="text-align: left">
									${board.boardRgstdate }
								</td>
							</tr>
							<tr>
								<td style="background: orange;">
									조회수
								</td>
								<td style="text-align: left">
									${board.boardViewcount }
								</td>
							</tr>
							<tr>
								<td style="background: orange; width: 70px;">
									첨부파일
								</td>
								<td>
									<c:forEach items="${fileList }" var="file">
										<a class="downlink" id="${file.fileSeq }" href="${file.fileName }">
											${file.originalFileName }
										</a>
<!-- 										<button type="button" onclick="deleteBoardFile('${file.fileSeq}')">삭제</button>
 -->
										<!-- <img src="/upload/${file.fileName }"> -->
										<br/>
									</c:forEach>
								</td>
							</tr>
							<tr>
								<td style="background: orange; width: 70px;">
									업로드
								</td>
								<td align="left">
									<input type="file" name="uploadFiles" multiple="multiple">
								</td>
							</tr>
							<tr id="btnWrap">
								<td colspan="2" align="center">
									<button type="submit" id="btnUpdate">수정</button> 
								</td>
							</tr>
						</table>
					</form>
				</div>
				
				
				<hr/>
				<h5 style="margin-top:30px;">
					<a href="/board/insertFBoardList.do">글 쓰기</a><br>
<!--********** ***************************************************
	id="btnDelete"를 놔두면 버튼이 hide 됨(script에는 로그인유저가 열면 삭제가 보여야 되는데 숨겨짐)
					<a id="btnDelete" href="/board/deleteBoard.do?boardSeq=${board.boardSeq }">글 삭제</a>
 -->					
					<a href="/board/deleteBoard.do?boardSeq=${board.boardSeq }">글 삭제</a>
					<a href="/board/readFBoardList.do">글 목록 보기</a><br>
				</h5>
					
				</div>
			
				<hr/>

		
		
		</div>
	</div>
		
		
	<jsp:include page="${pageContext.request.contextPath }/footer.jsp"></jsp:include>
	
	
	
	
	<script>
		function deleteBoardFile(fileSeq) {
			$.ajax({
				url: '/board/deleteBoardFile.do',
				type: 'post',
				data: {
						"boardSeq" : $("input[name='boardSeq']").val(),
						"fileSeq" : fileSeq
					  },
				success: function() {
					location.reload();
				},
				error: function(e) {
					console.log(e);
				}
			});
		}
		
		$(function() {
			const loginUserId = '${loginUser.userId}';
			const boardWriter = '${board.userId}';
			
			if(loginUserId !== userId) {
				$("#btnWrap").hide();
				$("#btnDelete").hide();
				$("#boardTitle").attr("readonly", true);
				$("#boardContent").attr("readonly", true);
			}
			
			$(".downlink").on("click", function(e) {
				e.preventDefault();
				
				const fileName = $(this).attr("href");
				window.location = "/board/fileDown.do?fileName=" + fileName;
			});
		});
	</script>
</body>
</html>