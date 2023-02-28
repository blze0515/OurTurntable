<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>.uInput{padding:10px 0 10px 0;}</style>
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath }/header.jsp"></jsp:include>
	
	<div class="untree_co-section">
    <div class="container my-5">
      <div class="row justify-content-center">

        <div class="col-lg-4">
          <div class="custom-block" data-aos="fade-up" data-aos-delay="100">
            <h2 class="section-title">회원정보 수정</h2>
            
            
			<form class="contact-form bg-brown2" id="updateForm">
				<div class="form-group">
					<input type="text" class="form-control" id="userId" name="userId" placeholder="${loginUser.userId }" readonly value="${loginUser.userId }">
				</div>
				<div class="form-group">
					<input type="password" class="form-control uInput" id="userPw" name="userPw" placeholder="비밀번호" autofocus>
				</div>
				
				<div class="form-group">
					<button type="button" class="btn btn-primary" style="width: 100%" id="btnUpdate">
						정보 수정하기
					</button>
				</div>
				
				<div class="form-group">
				<a href="/mypage/readMypage.do">
					<button type="button" class="btn btn-primary" style="width: 100%" id="btnCancel">
						취소
					</button>
				</a>
				</div>
			</form>
			
			
			</div>
        </div>
      </div>



    </div>
  </div>

	
	<jsp:include page="${pageContext.request.contextPath }/footer.jsp"></jsp:include>
	
	
	<script>
	
	
	//로그인 시 아이디나 비밀번호가 틀렸을 경우를
	//대비하여 폼을 서브밋 하지 않고
	//후 처리를 위해 ajax로 처리
	$(function() {
		$("#btnUpdate").on("click", function() {
			$.ajax({
				url: '/user/updateUserCheck.do',
				type: 'post',
//				jquery serialize 사용하는 이유
//				JQuery Ajax로 호출하기 전에 serialize를 해주면 form 안의 값들을
//				한 번에 전송 가능한 data로 만들 수 있어서 많은 data를 보낼때 유용하다.
//				(Ajax가 아닌 다른 상황에서도 사용 할 수 있음)
//				형태:  $("form id 또는 name").serialize();
//				정리 : (이 상황에서는)id=updateForm 안에 있는 데이터 들을 묶어서 한 번에 보내고 처리한 리턴값을 받아오는 기능.
				data: $("#updateForm").serialize(),
				
//				obj는 임의로 정한 이름. (data:(보낼 데이터))를 updateUserCheck.do로 보내고 json을 리턴받았다. 매개변수의 obj는 그 객체임. 
				success: function(obj) {
					const data = JSON.parse(obj);
					//1. id 체크
					if(data.message == 'idFail'){
						alert("id가 틀렸습니다.");
						return;
					} else if(data.message == 'pwFail') {
						//2. 비밀번호 체크
						alert("비밀번호가 틀렸습니다.");
						return;
					}
					
					//2. 수정화면으로 이동.
					location.href="/user/updateUser.do";
					console.log('updateCheck Success');
				},
				error: function(e) {
					console.log(e);
				}
			}); //ajax E
			
		});
	});
	</script>
		
		
</body>
</html>