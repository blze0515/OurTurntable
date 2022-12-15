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
	    <div class="container" style="max-width:1140px; padding:0; display:flex;">
	    	<jsp:include page="${pageContext.request.contextPath }/mySide.jsp"></jsp:include>  
	    	
	    	      
       		<div class="container-content" style="width: 890px; margin-left: 5%">
       			<h1>포인트 충전 및 사용내역 확인</h1>
		
				<table class="table table-striped">
				  <thead>
				    <tr>
				      <th scope="col">날짜 및 시간</th>
				      <th scope="col">충전 포인트</th>
					  <!-- 사용내역은 구분코드(1, 2, 3,...)에 따라 조건문 돌려서 다른 메세지가 나오게 하기 -->
				      <th scope="col">금액(+, -)</th>
				      <th scope="col">상대</th>
				      <!-- 회원은 포인트를 후원했거나 후원 받았을 경우에만 아이디 표기하기 -->
				    </tr>
				  </thead>
				  <tbody>
				    <c:forEach var="pointHistory" items="${pointHistoryList }">
						<tr>
							<th scope="row">${pointHistory.pointRgstdate }</th>
							
							<c:choose>
						        <c:when test="${pointHistory.pointCommonCode == '1'}">
									<td>포인트 충전 </td>
						        </c:when>
						        <c:when test="${pointHistory.pointCommonCode == '2'}">
									<td>포인트 환전 </td>
						        </c:when>
						        <c:when test="${pointHistory.pointCommonCode == '3'}">
									<td>후원 해줌 </td>
						        </c:when>
						        <c:when test="${pointHistory.pointCommonCode == '4'}">
									<td>후원 받음 </td>
						        </c:when>
						        <c:when test="${pointHistory.pointCommonCode == '5'}">
									<td>상품 구매 </td>
						        </c:when>
						        <c:when test="${pointHistory.pointCommonCode == '6'}">
									<td>정기후원 해줌 </td>
						        </c:when>
						        <c:when test="${pointHistory.pointCommonCode == '7'}">
									<td>정기후원 받음 </td>
						        </c:when>        
						        <c:otherwise>
						        	<td>? </td>
						        </c:otherwise>
						    </c:choose>
							
							
							<c:choose>
						        <c:when test="${pointHistory.pointCommonCode == '1' || pointHistory.pointCommonCode == '4' || pointHistory.pointCommonCode == '7'}">
									<td>+ ${pointHistory.pointMoney }</td>
						        </c:when>   
						        <c:otherwise>
						        	<td>- ${pointHistory.pointMoney } </td>
						        </c:otherwise>
						    </c:choose>
							
							<td>${pointHistory.pointReceiver }</td>
			
						</tr>
					</c:forEach> 
					
				  </tbody>
				</table>
		
				<h3>잔액: ${pointBalance }</h3>
			</div>
        </div>
    </div>
	
	<jsp:include page="${pageContext.request.contextPath }/footer.jsp"></jsp:include>
  	<script>
	</script>
</body>
</html>