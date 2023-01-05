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
						<div class="co-btn" style="margin-top:15px;">
<!-- 후원하기 버튼 -->			<button type="button" class="donationBtn" id="donationBtn" name="donationBtn" onclick="location.href='/mypage/donation.do'"><img src="${pageContext.request.contextPath }/images/donation.png" alt="후원하기"></button>
<!-- 팝업 또는 모달 창으로 후원할 금액 입력하는 창 열고 후원하기 취소버튼과 후원하기 버튼 삽입 -->							

						    <div class="background">
						      <div class="window">
						        <div class="popup">
						          <button id="close" >팝업닫기</button>
						          
						          <!-- 팝업 영역 S-->
						          
						          <p stype="text-align:center;">후원할 금액</p>
						          <p><input type="text" > &nbsp;원</p>
						          
						          
						          
						          
						          
						          
						          
						          
						          <!-- 팝업 영역 E-->
						        </div>
						      </div>
						    </div>





<%-- 	즐겨찾기 대신 좋아요로 통일	<button class="likeBtn"><img src="${pageContext.request.contextPath }/images/bookmark-empty.png" alt="북마크"></button> --%>
							<button class="likeBtn"><img src="${pageContext.request.contextPath }/images/heart-empty.png" alt="북마크"></button>
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
				
				
				<div style="height:20px; width:100%;"></div> <!-- body, footer 간 간격 조정을 위해 삽입 -->
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
	  	if($("#boardCategory").val() == "S" ) {
	        $(".donationBtn").show();
	        //$("#boardWriter").hide();
	     } else {
	    	 $(".donationBtn").hide();
	     } 
		
		//게시글 접근 권한 설정 S
		//상단 게시판 이름 표시 ("#id~") <- Jquery 문법
		$(function() {
			if($("#boardCategory").val()=="F"){
				$("#categoryName").text("자유게시판");
			} else if ($("#boardCategory").val()=="S"){
				$("#categoryName").text("자랑게시판");
			} else if ($("#boardCategory").val()=="R"){
				$("#categoryName").text("추천게시판");
			}
			
			
			//작성자 외에 제목, 콘텐츠 읽기만 가능하게 만들기
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
		//게시글 접근 권한 설정 E
		
		
		
		//후원하기 버튼 클릭시 /mypage/donation.do 요청
// 		$.ajax({
// 			url: '/mypage/donation.do';
// 			type: 'post';
//		 키 값은 문자열로 묶을 필요 없다.(알아서 문자열로 들어감, 써도 되고 안써도 됨) / data는 중괄호로 묶어서 보내야함
// 			data: {
// 				boardCategory: $("input[name='boardCategory']").val(),
// 				boardSeq : $("input[name='boardSeq']").val(),
// 				"receiver" : $("input[name='userId']").val()
//					}
//		요청을 보내서 처리까지 완료(성공)하고 나면 success 부분 실행, 여기나 controller에서 처리 중에 에러가 발생하면 error부분이 실행됨
//		아래 function(매개변수) <- 매개변수 부분은 controller에서 처리 끝난 후 리턴값을 매개변수로 받아오는 것임.
// 			success: function(매개변수){
				
// 			}

//			error : ~~~
				
// 		})
		
		
	</script>
</body>
</html>