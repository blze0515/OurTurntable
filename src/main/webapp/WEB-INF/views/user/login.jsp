<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath }/header.jsp"></jsp:include>
	
	<div class="untree_co-section">
    <div class="container my-5">
      <div class="row justify-content-center">

        <div class="col-lg-4">
          <div class="custom-block" data-aos="fade-up" data-aos-delay="100">
            <h2 class="section-title">로그인</h2>
			<form class="contact-form bg-brown2" id="loginForm">

				<div class="form-group">
					<input type="text" class="form-control" id="userId" name="userId" placeholder="아이디 입력" autofocus>
				</div>
				<div class="form-group">
					<input type="password" class="form-control" id="userPw"	 name="userPw" placeholder="비밀번호 입력">
				</div>
				
				<div class="form-group">
					<button type="button" class="btn btn-primary" style="width: 100%" id="btnLogin">
						로그인
					</button>
				</div>

				<div>
					<div class="sh_flex">
						<div class="sh_ratio_100 form-group">
							<button type="button" class="btn btn-primary naver-login" style="width: 100%">
								네이버 로그인
							</button>
						</div>
					</div>
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
			$("#btnLogin").on("click", function() {
				$.ajax({
					url: '/user/login.do',
					type: 'post',
//					jquery serialize 사용하는 이유
//					JQuery Ajax로 호출하기 전에 serialize를 해주면 form 안의 값들을
//					한 번에 전송 가능한 data로 만들 수 있어서 많은 data를 보낼때 유용하다.
//					(Ajax가 아닌 다른 상황에서도 사용 할 수 있음)
//					형태:  $("form id 또는 name").serialize();
//					정리 : id=loginForm 안에 있는 데이터 들을 묶어서 한 번에 받아오는 기능.
					data: $("#loginForm").serialize(),
					
//					obj는 임의로 정한 이름
					success: function(obj) {
						const data = JSON.parse(obj);

						//1. 아이디 체크
						if(data.message == 'idFail') {
							alert("존재하지 않는 아이디입니다.");
							return;
						} else if(data.message == 'pwFail') {
							
							//2. 비밀번호 체크
							alert("비밀번호가 틀렸습니다.");
							return;
						}
						
						//3. 로그인 처리
						location.href = "/index.jsp";
						console.log('login success');
//						document.write("data에 담긴 값 : " + JSON.stringi(data));    -> 출력 결과 : data에 담긴 값 : {"message":"loginSuccess"}
//						document.write("obj에 담긴 값 : " + JSON.stringi(data));    -> 출력 결과 : JSON.parse(obj)에 담긴 값 : "{\r\n \"message\" : \"loginSuccess\"\r\n}"
//	obj에 담긴 값 확인		obj는 "mesagge : loginSuccess" 담기 위해 사용
//						document.write("******************JSON.parse(obj)에 담긴 값 : " + JSON.stringify(obj));
					},
					error: function(e) {
						console.log(e);
					}
				});
			});
		});

	</script>
</body>
</html>