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
		<div class="container my-5">
			<div class="row justify-content-center">

				<div class="col-lg-4">
					<div class="custom-block" data-aos="fade-up" data-aos-delay="100">
						<h2 class="section-title">회원가입</h2>
						<form action="/user/createUser.do" method="post" class="contact-form bg-brown2">

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
										<button type="button" class="btn btn-primary" style="padding:10px 23px 11px 23px;">
											중복확인
										</button>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="text-black" for="userPw">비밀번호</label> 
								<input type="password" class="form-control" id="userPw" name="userPw" name="${_csrf.parameterName}" value="${_csrf.token}" required>
							</div>
							<div class="form-group">
								<label class="text-black" for="userPwCheck">비밀번호 확인</label> 
								<input type="password" class="form-control" id="userPwCheck" name="${_csrf.parameterName}" value="${_csrf.token}" required>
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
								<label class="text-black" for="adress">주소</label> 
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

	<div id="overlayer"></div>
	<div class="loader">
		<div class="spinner-border" role="status">
			<span class="sr-only">Loading...</span>
		</div>
	</div>
</body>
</html>