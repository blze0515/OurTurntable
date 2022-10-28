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
	    <div>
	    	<div class="wrapper grid" style="display:grid; gap:26px;
	    									 grid-template-columns: repeat(3, 1fr);
											 margin-top: 6%;
										     margin-bottom: 50px;">
		        <div class="item">
		            <img src="${pageContext.request.contextPath }/images/menu1.jpg" alt="메뉴1">
		            <p>사진과 이름</p>
		        </div>
		        <div class="item">
		            <img src="${pageContext.request.contextPath }/images/menu2.jpg" alt="메뉴2">
		            <p>사진과 이름</p>
		        </div>
		        <div class="item">
		            <img src="${pageContext.request.contextPath }/images/menu3.jpg" alt="메뉴3">
		            <p>사진과 이름</p>
		        </div>
		        <div class="item">
		            <img src="${pageContext.request.contextPath }/images/menu4.jpg" alt="메뉴4">
		            <p>사진과 이름</p>
		        </div>
		        <div class="item">
		            <img src="${pageContext.request.contextPath }/images/menu5.jpg" alt="메뉴5">
		            <p>사진과 이름</p>
		        </div>
		        <div class="item">
		            <img src="${pageContext.request.contextPath }/images/menu6.jpg" alt="메뉴6">
		            <p>사진과 이름</p>
		        </div>
		        <div class="item">
		            <img src="${pageContext.request.contextPath }/images/menu7.jpg" alt="메뉴7">
		            <p>사진과 이름</p>
		        </div>
		        <div class="item">
		            <img src="${pageContext.request.contextPath }/images/menu8.jpg" alt="메뉴8">
		            <p>사진과 이름</p>
		        </div>
		        <div class="item">
		            <img src="${pageContext.request.contextPath }/images/menu9.jpg" alt="메뉴9">
		            <p>사진과 이름</p>
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