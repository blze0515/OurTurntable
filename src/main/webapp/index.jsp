<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<title>OurTurntable</title>
<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="author" content="Untree.co">
	<meta name="description" content="" />
	<meta name="keywords" content="bootstrap, bootstrap4" />
</head>
<body class="bodycolor">
	<jsp:include page="header.jsp"></jsp:include>





	<div class="untree_co-section">
		<div class="container">
			<div class="row text-center justify-content-center mb-5" style="margin-bottom:0rem!important;">
				<div class="col-lg-7"><h2 class="section-title text-center">인기글 Top5</h2></div>
			</div>
			<div class="sh-flex">
			<table class="mboard-table sh-container">

				<tbody class="">
						<tr class="mtr-head">
							<td class="mboard-seq mboard-table">글번호</td>
							<td class="mboard-title mboard-table">제  목</td>
							<td class="mboard-nick mboard-table">작성자</td>
							<td class="mboard-date mboard-table">작성일</td>
							<td class="mboard-view mboard-table">조회수</td>
							<td class="mboard-like mboard-table">좋아요</td>
							<td class="mboard-donation mboard-table">후원금액</td>
						</tr>
						<tr class="mtr-content">
							<td class="mboard-seq mboard-table">100</td>
							<td class="mboard-title mboard-table">
								<div>
									<a href="#">노래자랑 100번째 자랑글</a>
								</div>
							</td>
							<td class="mboard-nick mboard-table">
								<div>
									<a href="#">콘서트7080</a>
								</div>
							</td>
							<td class="mboard-date mboard-table">2022-10-31</td>
							<td class="mboard-view mboard-table">100</td>
							<td class="mboard-like mboard-table">90</td>
							<td class="mboard-donation mboard-table">100,000</td>
						</tr>
						<tr class="mtr-content">
							<td class="mboard-seq mboard-table">99</td>
							<td class="mboard-title mboard-table">
								<div>
									<a href="#">노래자랑 99번째 자랑글</a>
								</div>
							</td>
							<td class="mboard-nick mboard-table">
								<div>
									<a href="#">콘서트7080</a>
								</div>
							</td>
							<td class="mboard-date mboard-table">2022-10-31</td>
							<td class="mboard-view mboard-table">5</td>
							<td class="mboard-like mboard-table">5</td>
							<td class="mboard-donation mboard-table">5,000</td>
						</tr>
						<tr class="mtr-content">
							<td class="mboard-seq mboard-table">98</td>
							<td class="mboard-title mboard-table">
								<div>
									<a href="#">노래자랑 98번째 자랑글</a>
								</div>
							</td>
							<td class="mboard-nick mboard-table">
								<div>
									<a href="#">콘서트7080</a>
								</div>
							</td>
							<td class="mboard-date mboard-table">2022-10-31</td>
							<td class="mboard-view mboard-table">5</td>
							<td class="mboard-like mboard-table">5</td>
							<td class="mboard-donation mboard-table">5,000</td>
						</tr>
						<tr class="mtr-content">
							<td class="mboard-seq mboard-table">97</td>
							<td class="mboard-title mboard-table">
								<div>
									<a href="#">노래자랑 97번째 자랑글</a>
								</div>
							</td>
							<td class="mboard-nick mboard-table">
								<div>
									<a href="#">콘서트7080</a>
								</div>
							</td>
							<td class="mboard-date mboard-table">2022-10-31</td>
							<td class="mboard-view mboard-table">5</td>
							<td class="mboard-like mboard-table">5</td>
							<td class="mboard-donation mboard-table">5,000</td>
						</tr>
						<tr class="mtr-content">
							<td class="mboard-seq mboard-table">97</td>
							<td class="mboard-title mboard-table">
								<div>
									<a href="#">노래자랑 97번째 자랑글</a>
								</div>
							</td>
							<td class="mboard-nick mboard-table">
								<div>
									<a href="#">콘서트7080</a>
								</div>
							</td>
							<td class="mboard-date mboard-table">2022-10-31</td>
							<td class="mboard-view mboard-table">5</td>
							<td class="mboard-like mboard-table">5</td>
							<td class="mboard-donation mboard-table">5,000</td>
						</tr>
						<tr class="mtr-content">
							<td class="mboard-seq mboard-table">97</td>
							<td class="mboard-title mboard-table">
								<div>
									<a href="#">노래자랑 97번째 자랑글</a>
								</div>
							</td>
							<td class="mboard-nick mboard-table">
								<div>
									<a href="#">콘서트7080</a>
								</div>
							</td>
							<td class="mboard-date mboard-table">2022-10-31</td>
							<td class="mboard-view mboard-table">5</td>
							<td class="mboard-like mboard-table">5</td>
							<td class="mboard-donation mboard-table">5,000</td>
						</tr>
						<tr class="mtr-content">
							<td class="mboard-seq mboard-table">97</td>
							<td class="mboard-title mboard-table">
								<div>
									<a href="#">노래자랑 97번째 자랑글</a>
								</div>
							</td>
							<td class="mboard-nick mboard-table">
								<div>
									<a href="#">콘서트7080</a>
								</div>
							</td>
							<td class="mboard-date mboard-table">2022-10-31</td>
							<td class="mboard-view mboard-table">5</td>
							<td class="mboard-like mboard-table">5</td>
							<td class="mboard-donation mboard-table">5,000</td>
						</tr>
			
				</tbody>
			</table>
			</div>

			<!-- S CAROUTSEL -->
			<!-- <div class="owl-carousel owl-3-slider">

				<div class="item">
					<a class="media-thumb" href="${pageContext.request.contextPath }/images/hero-slider-1.jpg" data-fancybox="gallery">
						<div class="media-text">
							<h3>Pragser Wildsee</h3>
							<span class="location">Italy</span>
						</div>
						<img src="${pageContext.request.contextPath }/images/hero-slider-1.jpg" alt="Image" class="img-fluid">
					</a> 
				</div>

				<div class="item">
					<a class="media-thumb" href="${pageContext.request.contextPath }/images/hero-slider-2.jpg" data-fancybox="gallery">
						<div class="media-text">
							<h3>Oia</h3>
							<span class="location">Greece</span>
						</div>
						<img src="${pageContext.request.contextPath }/images/hero-slider-2.jpg" alt="Image" class="img-fluid">
					</a> 
				</div>

				<div class="item">
					<a class="media-thumb" href="${pageContext.request.contextPath }/images/hero-slider-3.jpg" data-fancybox="gallery">
						<div class="media-text">
							<h3>Perhentian Islands</h3>
							<span class="location">Malaysia</span>
						</div>
						<img src="${pageContext.request.contextPath }/images/hero-slider-3.jpg" alt="Image" class="img-fluid">
					</a> 
				</div>

				<div class="item">
					<a class="media-thumb" href="${pageContext.request.contextPath }/images/hero-slider-4.jpg" data-fancybox="gallery">
						<div class="media-text">
							<h3>Rialto Bridge</h3>
							<span class="location">Italy</span>
						</div>
						<img src="${pageContext.request.contextPath }/images/hero-slider-4.jpg" alt="Image" class="img-fluid">
					</a> 
				</div>

				<div class="item">
					<a class="media-thumb" href="${pageContext.request.contextPath }/images/hero-slider-5.jpg" data-fancybox="gallery">
						<div class="media-text">
							<h3>San Francisco, United States</h3>
							<span class="location">United States</span>
						</div>
						<img src="${pageContext.request.contextPath }/images/hero-slider-5.jpg" alt="Image" class="img-fluid">
					</a> 
				</div>

				<div class="item">
					<a class="media-thumb" href="${pageContext.request.contextPath }/images/hero-slider-1.jpg" data-fancybox="gallery">
						<div class="media-text">
							<h3>Lake Thun</h3>
							<span class="location">Switzerland</span>
						</div>
						<img src="${pageContext.request.contextPath }/images/hero-slider-2.jpg" alt="Image" class="img-fluid">
					</a> 
				</div>

			</div> -->
			<!-- /E CAROUTSEL -->
		


		</div>
	</div>


	<div class="untree_co-section testimonial-section mt-5" style="margin-top:6rem!important; background:rgb(248,244,242);">
	</div>


	<div class="untree_co-section">
		<div class="container">
			<div class="row justify-content-center text-center">
				<div class="col-lg-6">
					<h2 class="section-title text-center mb-3">인기추천 장소</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-6 col-sm-6 col-md-6 col-lg-3 mb-4 mb-lg-0">
					<div class="media-1">
						<a href="#" class="d-block mb-3"><img src="${pageContext.request.contextPath }/images/hero-slider-1.jpg" alt="Image" class="img-fluid"></a>
						<span class="d-flex align-items-center loc mb-2">
							<span class="icon-room mr-3"></span>
							<span>수원 영통구</span>
						</span>
						<div class="d-flex align-items-center">
							<div>
								<h3><a href="#" style="font-weight:600">베이스7080라이브</a></h3>
								<div class="price ml-auto">
									<span style="font-weight:400;">- 라이브 카페</span>
								</div>
							</div>
							
						</div>
						
					</div>
				</div>
				<div class="col-6 col-sm-6 col-md-6 col-lg-3 mb-4 mb-lg-0">
					<div class="media-1">
						<a href="#" class="d-block mb-3"><img src="${pageContext.request.contextPath }/images/hero-slider-2.jpg" alt="Image" class="img-fluid"></a>
						<span class="d-flex align-items-center loc mb-2">
							<span class="icon-room mr-3"></span>
							<span>경기 의정부</span>
						</span>
						<div class="d-flex align-items-center">
							<div>
								<h3><a href="#">Luna Brew</a></h3>
								<div class="price ml-auto">
									<span style="font-weight:400;">- 분위기가 좋은 카페</span>
								</div>
							</div>
							
						</div>
						
					</div>
				</div>
				<div class="col-6 col-sm-6 col-md-6 col-lg-3 mb-4 mb-lg-0">
					<div class="media-1">
						<a href="#" class="d-block mb-3"><img src="${pageContext.request.contextPath }/images/hero-slider-3.jpg" alt="Image" class="img-fluid"></a>
						<span class="d-flex align-items-center loc mb-2">
							<span class="icon-room mr-3"></span>
							<span>부산 해운대</span>
						</span>
						<div class="d-flex align-items-center">
							<div>
								<h3><a href="#">BBAAAM</a></h3>
								<div class="price ml-auto">
									<span style="font-weight:400">- 뮤지컬 동호회 정기공연</span>
								</div>
							</div>
							
						</div>
						
					</div>
				</div>
				<div class="col-6 col-sm-6 col-md-6 col-lg-3 mb-4 mb-lg-0">
					<div class="media-1">
						<a href="#" class="d-block mb-3"><img src="${pageContext.request.contextPath }/images/hero-slider-4.jpg" alt="Image" class="img-fluid"></a>

						<span class="d-flex align-items-center loc mb-2">
							<span class="icon-room mr-3"></span>
							<span>Switzerland</span>
						</span>

						<div class="d-flex align-items-center">
							<div>
								<h3><a href="#">Lake Thun</a></h3>
								<div class="price ml-auto">
									<span>$520.00</span>
								</div>
							</div>
							
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="untree_co-section testimonial-section mt-5" style="background:rgb(248,244,242);">
	</div>
	
	
	<div class="untree_co-section" style="margin-bottom:50px;">
		<div class="container">
			<div class="row justify-content-between align-items-center">
				
				<div class="col-lg-6">
					<figure class="img-play-video">
						<a id="play-video" class="video-play-button" href="https://www.youtube.com/watch?v=mwtbEGNABWU" data-fancybox>
							<span></span>
						</a>
						<img src="${pageContext.request.contextPath }/images/hero-slider-2.jpg" alt="Image" class="img-fluid rounded-20">
					</figure>
				</div>

				<div class="col-lg-5">
					<h2 class="section-title text-left mb-4">여기 이벤트 페이지 같은걸로..</h2>
					<p>이벤트 같은 거 올리고 img파일로 링크</p>

					<p class="mb-4">텍스트 쓸 내용 있으먼 추가</p>

					<ul class="list-unstyled two-col clearfix">
						<li>Outdoor recreation activities</li>
						<li>Airlines</li>
						<li>Car Rentals</li>
						<li>Cruise Lines</li>
						<li>Hotels</li>
						<li>Railways</li>
						<li>Travel Insurance</li>
						<li>Package Tours</li>
						<li>Insurance</li>
						<li>Guide Books</li>
					</ul>

					<p><a href="#" class="btn btn-primary">Get Started</a></p>
				</div>
			</div>
		</div>
	</div>
	
	<div id="overlayer"></div>
	<div class="loader">
		<div class="spinner-border" role="status">
			<span class="sr-only">Loading...</span>
		</div>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
	
	<script>
		$(function() {
			var slides = $('.slides'),
			images = slides.find('img');

			images.each(function(i) {
				$(this).attr('data-id', i + 1);
			})

			var typed = new Typed('.typed-words', {
				strings: ["San Francisco."," Paris."," New Zealand.", " Maui.", " London."],
				typeSpeed: 80,
				backSpeed: 80,
				backDelay: 4000,
				startDelay: 1000,
				loop: true,
				showCursor: true,
				preStringTyped: (arrayPos, self) => {
					arrayPos++;
					console.log(arrayPos);
					$('.slides img').removeClass('active');
					$('.slides img[data-id="'+arrayPos+'"]').addClass('active');
				}

			});
		})
	</script>
</body>
</html>