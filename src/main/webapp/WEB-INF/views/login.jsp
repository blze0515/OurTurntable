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
            <h2 class="section-title">로그인</h2>
            <form class="contact-form bg-brown2">
            
              <div class="form-group">
                <input type="text" class="form-control" id="userId" placeholder="아이디 입력" autofocus>
              </div>
              <div class="form-group">
                <input type="password" class="form-control" id="userPw" placeholder="비밀번호 입력">
              </div>
              <div>
              <button type="submit" class="btn btn-primary" style="width:100%">Submit</button>
              </div>
            </form>
          </div>
          
          <div>
          	<div class="sh_1">
          		<div class="sh_ratio_100">
          			<button type="submit" class="btn btn-primary naver-login" style="width:100%">네이버 로그인</button>
          		</div>
          	</div>	
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