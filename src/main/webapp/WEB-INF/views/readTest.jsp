<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/sh-donation.css">
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath }/header.jsp"></jsp:include>

	<div class="untree_co-section">
		<div class="container" style="width:75%;">
			<div class="row text-left justify-content-center mb-5" style="margin-bottom: -1rem!important;">
			<div style="height:500px;width:100%;">
<!-- 콘텐츠 영역 -->
	
	<h3 style="text-align:center;">테스트 페이지</h3>
	<button id="show">팝업열기</button>
    <div class="background">
      <div class="window">
        <div class="popup">
          <button id="close">팝업닫기</button>
        </div>
        <div>
          <div></div>
        </div>
      </div>
    </div>

    <script>
      function show() {
        document.querySelector(".background").className = "background show";
      }

      function close() {
        document.querySelector(".background").className = "background";
      }

      document.querySelector("#show").addEventListener("click", show);
      document.querySelector("#close").addEventListener("click", close);
    </script>















<!-- /콘텐츠 영역 -->
			</div>
			</div>
		</div>
	</div>
			
	
	
	<jsp:include page="${pageContext.request.contextPath }/footer.jsp"></jsp:include>
  
  
	
	
</body>
</html>