<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
						<h2 class="section-title">회원정보 수정</h2>
						
						
						
						<form id="updateForm" action="/user/updateUser.do" method="post" class="contact-form bg-brown2">

							<div class="form-group-join">
								<img src="/images/person_1.jpg" width="150px">
							</div>

							<div class="form-group">
								<label class="text-black" for="userId">아이디</label>
								<div class="sh_flex">	 
									<div class="sh_ratio_100">	
										<input type="text" class="form-control" id="userId" name="userId" name="${_csrf.parameterName}" 
										value="${loginUser.userId}" placeholder="${loginUser.userId }" readonly required>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="text-black" for="userName">이름</label> 
								<input type="text" class="form-control" id="userName" name="userName" name="${_csrf.parameterName}" 
										value="${loginUser.userName}" placeholder="${loginUser.userName }" readonly required>
							</div>
							<div class="form-group">
								<label class="text-black" for="userNickName">닉네임</label> 
								<input type="text" class="form-control" id="userNickname" name="userNickname" name="${_csrf.parameterName}"
										 value="${loginUser.userNickname }" placeholder="${loginUser.userNickname }" required>
							</div>
							<div class="form-group">
								<label class="text-black" for="email">Email</label> 
								<input type="email" class="form-control" id="userEmail" name="userEmail" 
										name="userEmail" value="${loginUser.userEmail }" placeholder="${loginUser.userEmail }" 
										aria-describedby="emailHelp" required> 
									<small name="userEmail"	class="form-text text-muted">
										Email 정보는 타인에게 공유 되지 않습니다.
									</small>
							</div>
							<div class="form-group">
								<label class="text-black" for="userTel">전화번호</label> 
								<input type="text" class="form-control" id="userTel" name="userTel" name="${_csrf.parameterName}" 
										value="${loginUser.userTel }" placeholder="${loginUser.userTel }" required>
							</div>
							<div class="form-group">
								<label class="text-black" for="userAddress">주소</label> 
								<input type="text" class="form-control" id="userAddress"  name="userAddress" name="${_csrf.parameterName}" 
										value="${loginUser.userAddress}" placeholder="${loginUser.userAddress }" required> 
							</div>
							
							<button type="submit" class="btn btn-primary" id="btnComplete" style="width: 100%">정보 수정 완료하기</button>
						</form>
							<button type="button" class="btn btn-primary margin-tb15" id="btnCancel" style="width: 100%">마이페이지로 돌아가기</button>
						
						
						
					</div>
				</div>
			</div>
		</div>
	</div>


	<jsp:include page="${pageContext.request.contextPath }/footer.jsp"></jsp:include>
	
	
	<script>
	$(function(){
		$("#btnCancel").on("click", function(){
			location.href="/mypage/readMypage.do";
		})
		
		$("#btnComplete").on("click", function(){
			$.ajax({
				url: '/user/updateUser.do',
				type: 'post',
				data: $("#updateForm").serialize(),
				success: function(obj){
					alert("변경 되었습니다.");
					location.href="/mypage/readMypage.do";
				},
				error: function(e){
					console.log(e);
				}
			})
		})
		
	});
	</script>
	
	
</body>
</html>