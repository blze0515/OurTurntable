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
						<form class="contact-form bg-brown2" action="/user/createUser.do" method="post">

							<div class="form-group-join">
									<img src="/images/person_1.jpg" width="150px">
							</div>

							<div class="form-group">
								<label class="text-black" for="userId">아이디</label>
								<div class="sh_flex">	 
									<div class="sh_ratio_7">	
										<input type="text" class="form-control" id="userId" name="userId" required>
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
								<input type="password" class="form-control" id="userPw" name="userPw" required>
							</div>
							<div class="form-group">
								<label class="text-black" for="userPwCheck">비밀번호 확인</label> 
								<input type="password" class="form-control" id="userPwCheck" required>
							</div>
							<div class="form-group">
								<label class="text-black" for="userName">이름</label> 
								<input type="text" class="form-control" id="userName" name="userName" required>
							</div>
							<div class="form-group">
								<label class="text-black" for="userNickName">닉네임</label> 
								<input type="text" class="form-control" id="userNickname" name="userNickname" required>
							</div>
							<div class="form-group">
								<label class="text-black" for="email">Email</label> 
								<input type="email" class="form-control" id="userEmail" name="userEmail"
									aria-describedby="emailHelp" required> 
									<small name="userEmail"	class="form-text text-muted">
										Email 정보는 타인에게 공유 되지 않습니다.
									</small>
							</div>
							<div class="form-group">
								<label class="text-black" for="userTel">전화번호</label> 
								<input type="text" class="form-control" id="userTel" name="userTel" required>
							</div>
							<div class="form-group">
								<label class="text-black" for="adress">주소</label> 
								<input type="text" class="form-control"id="userAddress"  name="userAddress" required> 
							</div>
							
							<button type="submit" class="btn btn-primary" style="width: 100%">가입하기</button>
						</form>
					</div>

					<!--  
          <div class="custom-block" data-aos="fade-up" data-aos-delay="100">
            <div class="text-center">
              <h2 class="section-title text-center">Slider</h2>
            </div>
            <div class="owl-single owl-carousel no-nav">
              <div class="testimonial mx-auto">
                <figure class="img-wrap">
                  <img src="${pageContext.request.contextPath }/images/person_2.jpg" alt="Image" class="img-fluid">
                </figure>
                <h3 class="name">Adam Aderson</h3>
                <blockquote>
                  <p>&ldquo;There live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.&rdquo;</p>
                </blockquote>
              </div>

              <div class="testimonial mx-auto">
                <figure class="img-wrap">
                  <img src="${pageContext.request.contextPath }/images/person_3.jpg" alt="Image" class="img-fluid">
                </figure>
                <h3 class="name">Lukas Devlin</h3>
                <blockquote>
                  <p>&ldquo;There live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.&rdquo;</p>
                </blockquote>
              </div>

              <div class="testimonial mx-auto">
                <figure class="img-wrap">
                  <img src="${pageContext.request.contextPath }/images/person_4.jpg" alt="Image" class="img-fluid">
                </figure>
                <h3 class="name">Kayla Bryant</h3>
                <blockquote>
                  <p>&ldquo;There live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.&rdquo;</p>
                </blockquote>
              </div>

            </div>
          </div>	-->

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