<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
</style>
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath }/header.jsp"></jsp:include>
	
	<div class="content-wrap">
		<h1>채팅</h1>
		<div class="chat-space" style="width: 100%; display: flex;">
			<div class="chat-space-left" style="width: 30%; background: green;">
				<h1>채팅방목록</h1>
				<ul class="list-group">
				  <li class="list-group-item">
					  <p>상대방 아이디</p>
					  <p>최근 메세지 내용</p>
				  </li>
				</ul>
			</div>
			<div class="chat-space-right" style="width: 70%; background: blue;">				
				<div class="chat-message-space">
					<h1>채팅방 이름</h1>
					<p style="text-align: left;">
						<span style="background: gray;">안녕하세요.</span>
					</p>
					<p style="text-align: right;">
						<span style="background: gray;">안녕하세요.</span>
					</p>
				</div>
				<div class="chat-input-space" style="width: 70%" >
					<form action="/chat/createChat.do" method="post">
						<textarea name="chatContent" required></textarea>
						<button type="submit">ENTER</button>	
					</form>
				</div>
				
				
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