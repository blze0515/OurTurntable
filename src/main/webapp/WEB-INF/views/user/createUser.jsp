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
						<h2 class="section-title">회원가입</h2>
						<form id="joinForm" action="/user/createUser.do" method="post" class="contact-form bg-brown2">

							<div class="form-group-join">
								<img src="/images/person_1.jpg" width="150px">
							</div>

							<div class="form-group">
								<label class="text-black" for="userId">아이디</label>
								<div class="sh_flex">	 
									<div class="sh_ratio_7">	
										<input type="text" class="form-control" id="userId" name="userId" name="${_csrf.parameterName}" value="${_csrf.token}" required>
									</div>
									<div class="sh_ratio_3">
										<button type="button" id="btnIdCheck" class="btn btn-primary" style="padding:10px 23px 11px 23px;">
											중복확인
										</button>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="text-black" for="userPw">비밀번호</label> 
								<input type="password" class="form-control" id="userPw" name="userPw" name="${_csrf.parameterName}" value="${_csrf.token}" required>
								<p id="pwValidation" style="color: red; font-size: 0.8rem">비밀번호는 영문자, 숫자, 특수문자 조합의 9자리 이상으로 설정해주세요.</p>
							</div>
							<div class="form-group">
								<label class="text-black" for="userPwCheck">비밀번호 확인</label> 
								<input type="password" class="form-control" id="userPwCheck" name="${_csrf.parameterName}" value="${_csrf.token}" required>
								<p id="pwCheckResult" style="font-size: 0.8rem"></p>
							</div>
							<div class="form-group">
								<label class="text-black" for="userName">이름</label> 
								<input type="text" class="form-control" id="userName" name="userName" name="${_csrf.parameterName}" value="${_csrf.token}" required>
							</div>
							<div class="form-group">
								<label class="text-black" for="userNickName">닉네임</label> 
								<input type="text" class="form-control" id="userNickname" name="userNickname" name="${_csrf.parameterName}" value="${_csrf.token}" required>
							</div>
							<div class="form-group">
								<label class="text-black" for="email">Email</label> 
								<input type="email" class="form-control" id="userEmail" name="userEmail" name="${_csrf.parameterName}" value="${_csrf.token}" 
									aria-describedby="emailHelp" required> 
									<small name="userEmail"	class="form-text text-muted">
										Email 정보는 타인에게 공유 되지 않습니다.
									</small>
							</div>
							<div class="form-group">
								<label class="text-black" for="userTel">전화번호</label> 
								<input type="text" class="form-control" id="userTel" name="userTel" name="${_csrf.parameterName}" value="${_csrf.token}" required>
							</div>
							<div class="form-group">
								<label class="text-black" for="userAddress">주소</label> 
								<input type="text" class="form-control"id="userAddress"  name="userAddress" name="${_csrf.parameterName}" value="${_csrf.token}" required> 
							</div>
							
							<button type="submit" class="btn btn-primary" style="width: 100%">가입하기</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<jsp:include page="${pageContext.request.contextPath }/footer.jsp"></jsp:include>
	
	
	<script>
	$(function() {
		let checkId = false;
		let pwValidation = false;
		let pwCheck = false;
		
		$("#pwValidation").hide();
		$("#pwCheckResult").hide();
		
		//id중복확인
		$("#btnIdCheck").on("click", function(){
			if($("#userId").val() == null || $("#userId").val() == '') {
				alert("아이디를 입력하세요.");
				return;
			}
		
			$.ajax({
				url: '/user/idCheck.do',
				type: 'post',
				data: $("#joinForm").serialize(),
				success: function(obj){
					console.log(obj);
					
					const data = JSON.parse(obj);
					console.log(data);
 					console.log("console.log(data.resultIdCheck) === " + data.resultIdCheck);
					
					if(data.resultIdCheck < 1){
						if(confirm("사용가능한 아이디입니다. " + $("#userId").val() + "를(을) 사용하시겠습니까?")) {
							checkId = true;
							//id중복체크 하고 사용하기로 선택하면 중복확인 버튼 비활성화
							$("#btnIdCheck").attr("disabled", true);
						}
					} else {
						checkId = false;
						alert("이미 사용중인 id입니다.");
						$("#userId").focus();
						return;
					}
				},
				error: function(e){
					console.log(e);
				}
			}); //ajax End
		});  //id중복확인 End
	
		//id 입력창 수정되면 중복체크 버튼 다시 활성화
		$("#userId").on("change", function(){
			checkId = false;
			$("#btnIdCheck").attr("disabled", false);
		});
		
//비밀번호 유효성 검사 S
		function validatePassword(character) {
			return /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{9,}$/.test(character);
		}
		
		$("#userPw").on("change", function() {
            if(!validatePassword($("#userPw").val())) {
                pwValidation = false;
                $("#pwValidation").show();
                $("#userPw").focus();
            } else {
                pwValidation = true;
                $("#pwValidation").hide();
            }
        });
//비밀번호 유효성 검사 E
		
		//비밀번호 확인
		$("#userPwCheck").on("change", function() {
			$("#pwCheckResult").show();
			
			if($("#userPw").val() == $("#userPwCheck").val()) {
				pwCheck = true;
				$("#pwCheckResult").css("color", "green");
				$("#pwCheckResult").text("비밀번호가 일치합니다.");
			} else {
				pwCheck = false;
				$("#pwCheckResult").css("color", "red");
				$("#pwCheckResult").text("비밀번호가 일치하지 않습니다.");
			}
		});
		
		//회원가입 form -> submit 할 때에 마지막 유효성 검사
		$("#joinForm").on("submit", function(e){
			if(!checkId){
				alert("아이디 중복체크를 진행해주세요.");
				$("#userId").focus();
				e.preventDefault();
				return;
			}
			
			if(!pwValidation){
				alert("비밀번호는 특수문자, 영문자, 숫자 조합의 9자리 이상으로 설정 해주세요.")
				$("#userPw").focus();
				e.preventDefault();
				return;
			}
			
			if(!pwCheck){
				alert("비밀번호가 일치하지 않습니다.");
				$("#userPwCheck").focus();
				e.preventDefault();
				return;
			}
		});
	}); //최초 $(function(){ ~~ }) End
	
	</script>
	
	
</body>
</html>