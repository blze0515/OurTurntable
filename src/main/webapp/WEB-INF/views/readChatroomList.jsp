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
		<div class="chat-space" style="width: 100%; display: flex;">
			<div class="chat-space-left" style="width: 30%;">
				<h1>대화방 목록</h1>
				<ul class="list-group">
					<c:forEach var="chatRoom" items="${chatroomList }">
						<li class="list-group-item" style="cursor: pointer;" onclick="onClickLi(this)">
						  <span class="d-block">${chatRoom.chatroomSeq}</span>
						  <span class="d-block"><img src="/upload/${chatRoom.userProfileImg }" width="150px"></span>
						  <span class="d-block">${chatRoom.chatroomMember}</span>
						  <span class="d-block">${chatRoom.chatContent}</span>
						  <span class="d-block">${chatRoom.cntReadn}</span>
					  	</li>
					  	<button onclick="onClickDelBtn(this)">대화방 삭제</button>
					  	<input type="hidden">
					</c:forEach>
				</ul>
			</div>
			<div class="chat-space-right" style="width: 70%;">				
				<div class="chat-message-space">
					<h1>대화방 이름</h1>
					
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
					<form id="createChatForm" action="/chat/createChat.do" method="post">
						<input type="hidden" name="chatroomSeq" id="chatroomSeq">
						<input type="hidden" name="userId" id="userId">
						<input type="hidden" name="chatReceiveId" id="chatReceiveId">
						<textarea name="chatContent" id="formChatContent" required style="display: none;"></textarea>
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
	let chatroomSeq;

  	$(function() {
  		var jsdom = require('jsdom');
  		$ = require('jquery')(new jsdom.JSDOM().window);
  	});
  	
  	function onClickDelBtn(obj) {
  		console.log($(obj).prev()[0].firstElementChild.innerHTML); //이거 어떻게 선택해야할지 모르겠다.
  		chatroomSeq = parseInt($(obj).prev()[0].firstElementChild.innerHTML); 
	
  		$.ajax({
			type: 'get',
			url: '/chat/deleteChatroom.do?chatroomSeq='+chatroomSeq,
			success: function(obj) {
				const data = JSON.parse(obj);
				if(data.message == 'ok') {
					alert('채팅방이 삭제되었습니다.');
					window.location.href = '/chat/readChatroomList.do';
				} else if(data.message !== 'ok') {
					console.log('chatroom delete fail');
				}
			},
			error: function(e) {
				console.log(e);	
			}
		});
  		
  	}
  	
  	function onClickEnterBtn() {
		$("#chatroomSeq").val(chatroomSeq);
		$("#chatReceiveId").val(chatroomMember);
		$("#formChatContent").val($("#chatContent").val());
		
		$.ajax({
			type:'post',
			url: '/chat/createChat.do',
			data: $("#createChatForm").serialize(),
			success: function(obj) {
				const data = JSON.parse(obj);
				if(data.message == 'ok') {
					readChatList(chatroomSeq);
				} else if(data.message !== 'ok') {
					console.log('chat message fail');
				}
			},
			error: function(e) {
				console.log(e);
			}
		}); 
  	}
  	
  	function onClickLi(obj) {
  		//console.log(obj);
  		chatroomSeq = parseInt($(obj).first().text());
		readChatList(chatroomSeq);
  	}
  	
  	function readChatList(chatroomSeq) {
  		//console.log(chatroomSeq);
  		$.ajax({
				type: 'get',
				url: '/chat/readChatList.do?chatroomSeq='+chatroomSeq,
				success: function(data) {
					const strData = JSON.parse(data);
					const chatList = strData.chatList;
					
					//console.log(chatList[0].userId);
					
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
					
					chatListTag += "<textarea name='chatContent' id='chatContent' required></textarea>";
					chatListTag += "<button id='create-chat-message-btn' onclick='onClickEnterBtn()'>ENTER</button>";
					
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