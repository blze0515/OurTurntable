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
<%-- 	즐겨찾기 대신 좋아요로 통일	<button class="bookMark"><img src="${pageContext.request.contextPath }/images/bookmark-empty.png" alt="북마크"></button> --%>
							<c:if test="${likeCnt == 0 }">
								<input type="image" src="${pageContext.request.contextPath }/images/heart-empty.png" class="likeBtn" >
							</c:if>
							<c:if test="${likeCnt != 0 }">
								<input type="image" src="${pageContext.request.contextPath }/images/heart-like.png" class="likeBtn active">
							</c:if>
								<span id="boardLikeCnt" style="padding-left:3px;">${board.boardLikeCount }</span>
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
			
	//좋아요 버튼
			$(".likeBtn").on("click", function(e) {
				//$(".likeBtn")은 서브밋 되지 않게 만듦.
				e.preventDefault();
				
				if(!$(this).hasClass('active')) {
 					addLike();
				} else {
					deleteLike();
 				}
			});
		});
		//게시글 접근 권한 설정 E
		
		
		//https://eunbc-2020.tistory.com/118 여기(servlet) 따라하다가 강사님한테 질문함.
		//01.08 강사님 팁 
		//addlike(), deletelike() 호출에 따라서 컨트롤러에서 기능 실행
		//(controller에서)해당 게시글에 좋아요 눌렀으면 
		//jstl - 로 좋아요 누른 게시글이면 빨간하트 띄우고 안 누른 게시글이면 빈 하트 띄움. 눌렀는지 여부는 db 데이터로 확인
		function addLike(){
	        var query = {idx : ${board.boardSeq}}
	        $.ajax({
	            url : "/board/insertBoardLike.do",
	            type: "get",
	            data: {
	            	boardSeq : ${board.boardSeq},
	            	boardCategory : "${board.boardCategory}",
	            	loginUser : "${loginUser.userId}"
	            },
	            success:function(data) {
	            	console.log(data);
	                //addLike() 호출되면 좋아요 버튼에 'active' 클래스를 만든다.
	                //(내가 좋아요 누른 페이지인지 표시하는거)
	                //addClass() <- jquery 메서드
	                //location.reload();
//  	                $(".likeBtn").addClass('active');
				var jsonData = JSON.parse(data);
				console.log(jsonData);
	            
				if(jsonData.likeYn==1){
            		$(".likeBtn").attr("src", "/images/heart-like.png");
            		$(".likeBtn").addClass("active");
            	} else{
            		$(".likeBtn").attr("src", "/images/heart-empty.png")
            		$(".likeBtn").removeClass("active");
            	}
				
				$("#boardLikeCnt").text(jsonData.boardLikeCnt);
	            }
	        });
		}
		
		function deleteLike(){
	        var query = {idx : ${board.boardSeq}}
	        
	        $.ajax({
	            url : "/board/deleteBoardLike.do",
	            type: "get",
	            data: {
	            	boardSeq : ${board.boardSeq},
	            	boardCategory : "${board.boardCategory}",
	            	loginUser : "${loginUser.userId}"
	            },
	            success:function(data) {  //좋아요 개수와 좋아요 여부가 String으로 돌아온다.
	            	console.log(data);
	            	//JSON.parse() : JSON을 객체로 바꿔준다.
	            	//JSON.stringify() : 객체를 JSON으로 바꿔준다.
	            	var jsonData = JSON.parse(data)  //String이면 속성값을 . 으로 꺼내서 쓸 수가 없기 때문에 객체로 바꾼다.
	                //deleteLike() 호출되면 좋아요 버튼에 'active' 클래스를 지운다.
	                //(내가 좋아요 누른 페이지인지 표시하는거)
	                //removeClass <- jquery 메서드
// 	                $(".likeBtn").removeClass('active');
	            	console.log(jsonData);  //JS에서 데이터 주고 받을 떄는 그냥 JSON객체로 하는게 편하고, 일단 이것만 알고있자.
	            	
	            	if(jsonData.likeYn==0){
	            		$(".likeBtn").attr("src", "/images/heart-empty.png");
	            		$(".likeBtn").removeClass("active");
	            	} else{
	            		$(".likeBtn").attr("src", "/images/heart-like.png")
	            		$(".likeBtn").addClass("active");
	            	}
	            	
// 	                location.reload();
					
					$("#boardLikeCnt").text(jsonData.boardLikeCnt);
	            }
	        });
		}
		
		
		//후원하기 버튼 클릭시 /mypage/donation.do 요청
// 		$.ajax({
// 			url: '/mypage/donation.do',
// 			type: 'post',
//		 키 값은 문자열로 묶을 필요 없다.(알아서 문자열로 들어감, 써도 되고 안써도 됨) / data는 중괄호로 묶어서 보내야함
// 			data: {
// 				boardCategory: $("input[name='boardCategory']").val(),
// 				boardSeq : $("input[name='boardSeq']").val(),
// 				"receiver" : $("input[name='userId']").val()
//					},
//		요청을 보내서 처리까지 완료(성공)하고 나면 success 부분 실행, 여기나 controller에서 처리 중에 에러가 발생하면 error부분이 실행됨
//		아래 function(매개변수) <- 매개변수 부분은 controller에서 처리 끝난 후 리턴값을 매개변수로 받아오는 것임.
// 			success: function(매개변수){
				
// 			},

//			error : ~~~
				
// 		})
		
	</script>
</body>
</html>