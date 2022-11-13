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
			<div class="row justify-content-center">
	
			<div class="board-form" >
								<!-- 노션 메모에 enctype form-data 메모(form-data는 파일 등록할때 주로 쓴다고함) -->
			<form action="/board/createFBoard.do" method="post" enctype="multipart/form-data">
				<table border="1" style="border-collapse: collapse">
					<tbody><tr>
						<td style="background: orange; width: 70px;">
							제목
						</td>
						<td style="text-align: left;">
							<input type="text" name="boardTitle" required="">
						</td>
					</tr>
					<tr>
						<td style="background: orange;">
							작성자
						</td>
						<td style="text-align: left;">
							<input type="text" name="boardWriter" value="sh" readonly="">
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
							<input type="file" name="uploadFiles" multiple="multiple">
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<button type="submit">새 글 등록</button>
						</td>
					</tr>
				</tbody></table>
			</form>
			</div>
			<hr/>
			
			
			<h5 style="margin-top:30px;">
				<a href="/board/readFBoardList.do">글 목록 보기</a>
			</h5>
		
		
			</div>
		</div>
	</div>
		
		
	<jsp:include page="${pageContext.request.contextPath }/footer.jsp"></jsp:include>
</body>
</html>