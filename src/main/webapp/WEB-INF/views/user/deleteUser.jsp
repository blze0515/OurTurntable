<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	.dCenter{ 
         /* display:flex;
         justify-content: center; */
         text-align: center;
     }
     .bg{
         width:1200px;
         height:280px;
         background-color: aliceblue;
     }
     .lnk{
         background-color: rgb(213, 213, 213);
     }
     button{
     height:30px;
     }
</style>
</head>

<body>
	<jsp:include page="${pageContext.request.contextPath }/header.jsp"></jsp:include>

	<div class="untree_co-section">
		<div class="container my-5">
			<div class="row justify-content-center">
				
				
			<form action="/user/deleteUser.do" method="post">
				<div class="bg" style="position:relative">
			        <div style="position:absolute; top:50%; left:50%; transform:translateX(-50%) translateY(-50%)">
			            <h3>정말 탈퇴하시겠습니까?</h3><div style="height:50px;"></div>
			            <button type="submit">탈퇴하기</button><div style="display:inline-block;width:120px;"></div><button>취소</button>
			        </div>      
			    </div>
			</form>



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