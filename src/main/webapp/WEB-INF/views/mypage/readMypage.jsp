<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/mypage.css">
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath }/header.jsp"></jsp:include>
	
	<div class="untree_co-section" style="margin-top:5%;">
	    <div class="container" style="max-width:1200px; padding:0; display:flex;">
	     <jsp:include page="${pageContext.request.contextPath }/mySide.jsp"></jsp:include>   
        
            
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