<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
					<c:forEach var="chatRoom" items="${chatroomList }">					
						
							<li class="list-group-item" style="cursor: pointer;">
							  <span class="d-block">${chatRoom.chatroomSeq}</span>
							  <span><img src="/upload/${chatRoom.userProfileImg }" width="150px"></span>
							  <span>${chatRoom.chatroomMember}</span>
							  <span>${chatRoom.chatContent}</span>
							  <span>${chatRoom.cntReadn}</span>
						  	</li>
					</c:forEach>
				</ul>
			</div>
			<div class="chat-space-right" style="width: 70%; background: blue;">				
				<div class="chat-message-space">
					<h1>채팅방 이름</h1>
					
					<c:forEach var="chat" items="${chatList }">
					    <c:choose>
					        <c:when test="${chat.userId == 'gogo'}">
					            <p style="text-align: right;">
									<span style="background: gray;">${chat.chatContent} </span>
								</p>
					        </c:when>         
					        <c:otherwise>
					        	<p style="text-align: left;">
									<span style="background: gray;">${chat.chatContent }</span>
								</p>
					        </c:otherwise>
					    </c:choose>
					</c:forEach>
					
				</div>
				<div class="chat-input-space" style="width: 70%" >
					<form action="/chat/createChat.do" method="post">
						<input type="hidden" name="chatroomSeq" value="${chat.chatroomSeq }">
						<input type="hidden" name="userId" value="gogo">
						<input type="hidden" name="chatReceiveId" value="dkjdkj">
						<textarea name="chatContent" required></textarea>
						<button type="submit" id="createChatMessageBtn">ENTER</button>
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
  
  <script>
	let chatroomMember;
	
  	$(function() {
  		$(".list-group-item").on('click', function(e) {
  			const chatroomSeq = parseInt($(e.target).first().text());
  			console.log(chatroomSeq);
  			readChatList(chatroomSeq);
  		});
  		
  		//엔터 클릭시 이벤트생성
  		/*
  			$.ajax({
  				type:'post',
  				url: '',
  				data: {
  					chatroomSeq: chatroomSeq,
  					chatReceiveId: chatroomMemeber,
  					chatContent: $("textarea[name="chatContent"]").val()
  				}
  			})
  		
  		*/
  	});
  	
  	function readChatList(chatroomSeq) {
  		console.log(chatroomSeq);
  		$.ajax({
				type: 'get',
				url: '/chat/readChatList.do?chatroomSeq='+chatroomSeq,
				success: function(data) {
					const strData = JSON.parse(data);
					const chatList = strData.chatList;
					
					console.log(chatList[0].userId);
					
					if(chatList[0].userId === 'gogo')
						chatroomMember = chatList[0].chatReceiveId;
					else
						chatroomMember = chatList[0].userId;
					
					let chatListTag = "<h1>" + chatroomMember + "와의 대화방</h1>";
					
					for(let i = 0; i < chatList.length; i++) {
						console.log(chatList[i]);
						if(chatList[i].userId === 'gogo') {
							chatListTag += "<p style='text-align: right;'>";
							chatListTag += "	<span style='background: gray;'>" + chatList[i].chatContent + "</span>";
							chatListTag += "</p>";
						} else {
							chatListTag += "<p style='text-align: left;'>";
							chatListTag += "	<span style='background: gray;'>" + chatList[i].chatContent + "</span>";
							chatListTag += "</p>";
						}
					}
					
					$(".chat-message-space").html("");
					$(".chat-message-space").html(chatListTag);
				},
				error: function(e) {
					console.log(e);	
				}
			});
  	}
  </script>
</body>
</html>