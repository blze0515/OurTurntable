<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath }/header.jsp"></jsp:include>
	
	<div class="untree_co-section">
		<div class="container my-5">
		
			<h3 style="text-align:center;" id="categoryName"> </h3>
			
			<div style="display:block; justify-content: center; align-items: center;">
				
				<div style="display:flex; justify-content:center; width:100%;">
					<form action="/board/updateBoard.do" method="post" enctype="multipart/form-data">
					<input type="hidden" name="boardCategory" id="boardCategory" value="${board.boardCategory }">
						<input type="hidden" name="boardSeq" value="${board.boardSeq }">
						<div class="like" style="margin-top:15px;">
							<button class="donation-btn"><img src="/images/donation.png" alt="후원하기"></button>
							<button class="like-btn"><img src="/images/bookmark-empty.png" alt="북마크"></button>
							<button class="like-btn"><img src="/images/heart-empty.png" alt="북마크"></button>
						</div>
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
										<a class="downlink" id="${file.imgSeq }" href="${file.imgFile }">
											${file.imgFile }
										</a>
 									<button type="button" onclick="deleteBoardFile('${file.imgSeq}')">삭제</button>	
 
										<img src="/upload/${file.imgFile }" style="width: 100px; height: 100px;">
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
				
				
				<div style="height:20px; width:100%;"></div>
				<hr/>
				<h5 style="margin-top:10px; text-align:center;">
					<a href="/board/createBoard.do?boardCategory=${board.boardCategory }" }>글 쓰기</a><br>
					<a id="btnDelete" href="/board/deleteBoard.do?boardSeq=${board.boardSeq }&boardCategory=${board.boardCategory}">글 삭제</a><br>
					<a href="/board/readBoardList.do?boardCategory=${board.boardCategory }">글 목록 보기</a><br>
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
		
		//후원하기 버튼 숨김
	  	if($("#boardCategory").val() == "F" ) {
	        $(".donation-btn").hide();
	        
	        //$("#boardWriter").hide();
	     } else if($("#boardCategory").val() == "R") {
	    	 $(".donation-btn").hide();
	     } 
		
		$(function() {
			//상단 게시판 이름 표시 ("#id~") <- Jquery 문법
			if($("#boardCategory").val()=="F"){
				$("#categoryName").text("자유게시판");
			} else if ($("#boardCategory").val()=="S"){
				$("#categoryName").text("자랑게시판");
			} else if ($("#boardCategory").val()=="R"){
				$("#categoryName").text("추천게시판");
			}
			
			
			const loginUserId = '${loginUser.userId}';
			const boardWriter = '${board.userId}';
			
			if(loginUserId !== boardWriter) {
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