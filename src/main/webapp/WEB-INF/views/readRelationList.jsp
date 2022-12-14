<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath }/header.jsp"></jsp:include>
	
	
	<div class="untree_co-section" style="margin-top:5%;">
	    <div class="container" style="max-width:1200px; padding:0; display:flex;">
	    	<jsp:include page="${pageContext.request.contextPath }/mySide.jsp"></jsp:include>        
       		<div class="container-content" style="width: 950px; margin-left: 5%">
		        <c:choose>
					<c:when test="${relationCondition eq 'following'}">
						<h1>팔로잉 리스트(내가 팔로우한 회원)</h1>
					</c:when>
					<c:when test="${relationCondition eq 'follower'}">
						<h1>팔로워 리스트(나를 팔로우한 회원)</h1>
					</c:when>
					<c:when test="${relationCondition eq 'block'}">
						<h1>내가 블락한 회원 리스트</h1>
					</c:when>
					<c:when test="${relationCondition eq 'mystar'}">
						<h1>내가 후원한 회원 리스트(My Star)</h1>
					</c:when>
					<c:when test="${relationCondition eq 'myfan'}">
						<h1>나에게 후원한 회원 리스트(My Fan)</h1>
					</c:when>
			       	<c:otherwise>
			       		<h1>${relationCondition } </h1>
			        	<h1>리스트</h1>
			        </c:otherwise>
				</c:choose>
		
				<table class="table table-striped">
				  <thead>
				    <tr>
				      <th scope="col">#</th>
				      <th scope="col">프로필 사진</th>
				      <th scope="col">아이디</th>
				      <th scope="col">등록 시간</th>
			     	  <th scope="col">상태 변경</th>
				    </tr>
				  </thead>
				  <tbody>
	  					<tr>
							<th scope="row">1</th>
							<td><img src="/../images_img_1.jpg" width="150px"> </td>
							<td>팔로워</td>
							<td>2022-12-11</td>
							<td><button type="button" class="btn btn-secondary">해제</button></td>
						</tr>
				    <c:forEach var="relationUser" items="${relationUserList }">
						<tr>
							<th scope="row">1</th>
							<td><img src="/upload/${relationUser.userProfileImg }" width="150px"> </td>
							<td>${relationUser.relationPartner }</td>
							<td>${relationUser.relationDate }</td>
							<td><button type="button" class="btn btn-secondary">해제</button></td>
						</tr>
					</c:forEach>
				  </tbody>
				</table>
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

	</script>
</body>
</html>