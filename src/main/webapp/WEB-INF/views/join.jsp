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
            <form class="contact-form bg-white">
            
              <div class="form-group-join" >
                <button type="button" class="text-black" for="img">
                <img src="/images/person_1.jpg" width="150px">
                </button>
               
              </div>
            
              <div class="form-group">
                <label class="text-black" for="userId">아이디</label>
                <input type="text" class="form-control" id="userId" autofocus>
              </div>
              <div class="form-group">
                <label class="text-black" for="userPw">비밀번호</label>
                <input type="password" class="form-control" id="userPw">
              </div>
              <div class="form-group">
                <label class="text-black" for="userPwCheck">비밀번호 확인</label>
                <input type="password" class="form-control" id="userPwCheck">
              </div>
              <div class="form-group">
                <label class="text-black" for="userName">이름</label>
                <input type="text" class="form-control" id="userName">
              </div>
              <div class="form-group">
                <label class="text-black" for="userNickName">닉네임</label>
                <input type="text" class="form-control" id="userNickName">
              </div>
              <div class="form-group">
                <label class="text-black" for="email">Email</label>
                <input type="email" class="form-control" id="email" aria-describedby="emailHelp">
                <small id="emailHelp" class="form-text text-muted">Email 정보는 타인에게 공유 되지 않습니다.</small>
              </div>
              <div class="form-group">
                <label class="text-black" for="adress">주소</label>
                <input type="text" class="form-control" id="adress">
              </div>
              <div class="form-group">
                <label class="text-black" for="message">소개글</label>
                <textarea name="" class="form-control" id="message" cols="30" rows="5"></textarea>
              </div>
              <button type="submit" class="btn btn-primary" style="width:100%">가입하기</button>
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