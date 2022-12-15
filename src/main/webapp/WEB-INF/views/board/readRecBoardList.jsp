<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
  .page-item a{
    color:black;
  }
  .searchbar{
    margin-bottom:5%;
    display: flex;
    justify-content:flex-end;
  }
</style>
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath }/header.jsp"></jsp:include>
	
	<div class="untree_co-section" style="margin-top:5%;">
	    <div class="container" style="max-width:1200px; padding:0;">
	     <h1>추천 게시판</h1>
		     <div class="searchbar">
		     	  <select name="searchCondition" style="width:90px; height:35px; margin-right:5px;">
					<option value="all">전체</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="writer">작성자</option>
				 </select>
	              <form class="boardsearch">
	                  <input type="text" class="form" placeholder="검색어를 입력해 주세요." aria-label="Search" 
	                         style="width:350px; height:20px; padding:17px;
	                                box-shadow: none;" >
	                  <a href="#">
	                  	<img src="${pageContext.request.contextPath }/images/ico-search.png"alt="검색" 
	                  	     style="width:35px; height:30px; margin-top:6px;">
                  	  </a>
	              </form>
	          </div>
	         
	    	<div class="wrapper grid" style="display:grid; gap:15px;
	    									 grid-template-columns:repeat(auto-fit, minmax(30%, auto));
											 margin-top: 6%;
										     margin-bottom: 50px;">
				        <div class="item">
				            <img src="${pageContext.request.contextPath }/images/menu1.jpg" alt="메뉴1" style="width:390px;">
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
				        <div class="item">
				            <img src="${pageContext.request.contextPath }/images/menu2.jpg" alt="메뉴2" style="width:390px;">
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
				        <div class="item">
				            <img src="${pageContext.request.contextPath }/images/menu3.jpg" alt="메뉴3"style="width:390px;">
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
				        <div class="item">
				            <img src="${pageContext.request.contextPath }/images/menu4.jpg" alt="메뉴4" style="width:390px;">
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
				        <div class="item">
				            <img src="${pageContext.request.contextPath }/images/menu5.jpg" alt="메뉴5" style="width:390px;">
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
				        <div class="item">
				            <img src="${pageContext.request.contextPath }/images/menu6.jpg" alt="메뉴6" style="width:390px;">
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
				        <div class="item">
				            <img src="${pageContext.request.contextPath }/images/menu7.jpg" alt="메뉴7" style="width:390px;">
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
				        <div class="item">
				            <img src="${pageContext.request.contextPath }/images/menu8.jpg" alt="메뉴8" style="width:390px;">
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
				        <div class="item">
				            <img src="${pageContext.request.contextPath }/images/menu9.jpg" alt="메뉴9" style="width:390px;">
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
			    </div>
		    </div>
     
       		<div>
                <ul class="pagination" style="display: flex; justify-content: center;">
                   <li class="page-item">
                     <a class="page-link" href="#" aria-label="Previous">
                       <span aria-hidden="true">&laquo;</span>
                     </a>
                   </li>
                   <li class="page-item"><a class="page-link" href="#">1</a></li>
                   <li class="page-item"><a class="page-link" href="#">2</a></li>
                   <li class="page-item"><a class="page-link" href="#">3</a></li>
                   <li class="page-item"><a class="page-link" href="#">4</a></li>
                   <li class="page-item">
                     <a class="page-link" href="#" aria-label="Next">
                       <span aria-hidden="true">&raquo;</span>
                     </a>
                   </li>
                </ul>
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