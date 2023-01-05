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
	<!-- form 으로 만들어서 action으로 보내는 게 좋겠다. -->
	<h3 style="text-align:center;">도네이션 페이지</h3>
	<button id="show">팝업열기</button>
    <div class="background">
      <div class="window">
        <div class="popup">
			<div style="text-align:right; padding:2px 2px 0 0;">
				<button id="close" >팝업닫기</button>
			</div>
<!-- 팝업 영역 S-->
          <div class="donationContainer">
          <form action="/mypage/donation.do" method="POST" id="donationForm">
	          <p style="text-align:center;">후원할 금액</p>
	          	
                <input type="radio" name="lp" id="lp100" value="100"></input>
                <label for="lp100">100포인트</label><br>
	          	<input type="radio" name="lp" id="lp200" value="200"></input>
                  <label for="lp200">200포인트</label><br>
	          	<input type="radio" name="lp" id="lp300" value="300"></input>
                  <label for="lp300">300포인트</label><br>
                  <p style="margin-block-end: 2px;">직접입력</p>
	          <input type="text" name="donation" id="donation" autofocus> <span>&nbsp;포인트</span>
	          <button type="submit" id="donationBtn">후원하기</button>
          </form>
          </div>
          <!-- 팝업 영역 E-->
        </div>
      </div>
    </div>
<!-- /콘텐츠 영역 -->
			</div>
			</div>
		</div>
	</div>
			
	
	
	<jsp:include page="${pageContext.request.contextPath }/footer.jsp"></jsp:include>
  
  
	
    <script>
    
    //팝업창 열고 닫기
      function show(event) {
        document.querySelector(".background").className = "background show";
      }

      function close() {
        document.querySelector(".background").className = "background";
      }
															//왜 show()가 아니고 show로 써야 되는지?
      document.querySelector("#show").addEventListener("click", show);
      document.querySelector("#close").addEventListener("click", close);
      
      //입력값을 value에 저장하고 신호 보내기

      
      
      /* 12.27강사님 설명 부분*/
      //input(type="text") value는 버튼 누르면 자동으로 입력한 텍스트가 value로 입력됨 
      //********************DOM 객체 생성 후에 동작 -> $(function~~) == $(document).ready(function(){ ~~ }) 옛날에는 이런식으로 썼었음.
//       $(function() {
//     	 $("#donationBtn").on("click", function() {
//     		console.log($("#donation").val()); 
//     	 });

		/********************************/
// 		1. onclick 이벤트를 동적 요소에 만들때 이렇게함.
// 		$(document).on("click", "button[type='button']", function() {
// 			alert(1111);
// 		})
// // 		2. onclick  이벤트를 이렇게 적용하면 동적 요소에 반응을 못 함.
// // 		$("button[type='button']").on("click", function(){
// // 			alert(1111);
// // 		})
		
// 		let htmlStr = `<button type="button" id="testBtn">test</button>`;
// 		$("#donationForm").append(htmlStr);
// 		/********************************/
      
    </script>
</body>
</html>