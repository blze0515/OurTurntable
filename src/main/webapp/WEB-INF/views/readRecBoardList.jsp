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
	    <div class="container" style="max-width:1200px; padding:0;">
	     <h1>추천 게시판</h1>
		     <div class="searchbar" style="margin-bottom:5%;">
	              <form class="boardsearch" style="display: flex; justify-content:flex-end;">
	                  <input type="text" class="form" placeholder="검색어를 입력해 주세요." aria-label="Search" 
	                         style="width:500px; height:20px; padding:17px;
	                                box-shadow: none;" >
	                  <a href="#">
	                  	<img src="${pageContext.request.contextPath }/images/ico-search.png"alt="검색" 
	                  	     style="width:35px; height:30px; margin-top:6px;">
                  	  </a>
	              </form>
	          </div>
	          
		      <div>
		         <table border=1 class="tg">
	                <thead class="tb-head">
	                    <tr>
	                        <th>좋아요 갯수</th>
	                        <th>댓글 갯수</th>
	                        <th>제목</th>
	                        <th>등록일</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr>
	                        <td>100</td>
	                        <td>20</td>
	                        <td style="cursor:pointer;">시스템 점검에 따른 이용제한 안내</td>
	                        <td>2022-11-01</td>
	                    </tr>
	                    <tr>
	                        <td>80</td>
	                        <td>10</td>
	                        <td style="cursor:pointer;">시스템 점검에 따른 이용제한 안내</td>
	                        <td>2022-11-01</td>
	                    </tr>
	                    <tr>
	                        <td>140</td>
	                        <td>30</td>
	                        <td style="cursor:pointer;">시스템 점검에 따른 이용제한 안내</td>
	                        <td>2022-11-01</td>
	                    </tr>
	                </tbody>
               </table>
	        </div>
	    	<div class="wrapper grid" style="display:grid; gap:15px;
	    									 grid-template-columns:repeat(auto-fit, minmax(30%, auto));
											 margin-top: 6%;
										     margin-bottom: 50px;">
		        <div class="item">
		            <img src="${pageContext.request.contextPath }/images/menu1.jpg" alt="메뉴1" style="width:390px;">
		            <p>사진과 이름</p>
		        </div>
		        <div class="item">
		            <img src="${pageContext.request.contextPath }/images/menu2.jpg" alt="메뉴2" style="width:390px;">
		            <p>사진과 이름</p>
		        </div>
		        <div class="item">
		            <img src="${pageContext.request.contextPath }/images/menu3.jpg" alt="메뉴3"style="width:390px;">
		            <p>사진과 이름</p>
		        </div>
		        <div class="item">
		            <img src="${pageContext.request.contextPath }/images/menu4.jpg" alt="메뉴4" style="width:390px;">
		            <p>사진과 이름</p>
		        </div>
		        <div class="item">
		            <img src="${pageContext.request.contextPath }/images/menu5.jpg" alt="메뉴5" style="width:390px;">
		            <p>사진과 이름</p>
		        </div>
		        <div class="item">
		            <img src="${pageContext.request.contextPath }/images/menu6.jpg" alt="메뉴6" style="width:390px;">
		            <p>사진과 이름</p>
		        </div>
		        <div class="item">
		            <img src="${pageContext.request.contextPath }/images/menu7.jpg" alt="메뉴7" style="width:390px;">
		            <p>사진과 이름</p>
		        </div>
		        <div class="item">
		            <img src="${pageContext.request.contextPath }/images/menu8.jpg" alt="메뉴8" style="width:390px;">
		            <p>사진과 이름</p>
		        </div>
		        <div class="item">
		            <img src="${pageContext.request.contextPath }/images/menu9.jpg" alt="메뉴9" style="width:390px;">
		            <p>사진과 이름</p>
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