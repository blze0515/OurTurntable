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
		<div class="chatSpace" style="width: 100%; display: flex;">
			<div class="chatSpaceLeft" style="width: 30%; background: green;">
				<h1>채팅방목록</h1>
				<ul class="list-group">
				  <li class="list-group-item">Cras justo odio</li>
				  <li class="list-group-item">Dapibus ac facilisis in</li>
				  <li class="list-group-item">Morbi leo risus</li>
				  <li class="list-group-item">Porta ac consectetur ac</li>
				  <li class="list-group-item">Vestibulum at eros</li>
				</ul>
			</div>
			<div class="chatSpaceLeft" style="width: 70%; background: blue;">
				<h1>채팅방 이름</h1>
				<p style="text-align: left;">
					<span style="background: gray;">안녕하세요.</span>
				</p>
				<p style="text-align: right;">
					<span style="background: gray;">안녕하세요.</span>
				</p>
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