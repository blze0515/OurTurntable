<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/notice-style.css">
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath }/header.jsp"></jsp:include>
	
	<div class="untree_co-section" style="margin-top:5%;">
	    <div class="container" style="max-width:1200px; padding:0; display:flex;">
	        <!--사이드바 부분-->
	        <div class="sidebar">
	            <dl>
	                <dt class="title">
	                    <a href="#">관리자</a>
	                </dt>
	                <dd>
	                    <ul class="menu">
	                        <li class="menuli"><a href="/admin/adminUser.do">회원 관리</a></li>
	                        <li class="menuli"><a href="/admin/adminGrade.do">등급 관리</a></li>
	                        <li class="endli"><a href="/admin/adminBoard.do">게시물 관리</a></li>
	                    </ul>
	                </dd>
	            </dl>
	        </div>
        
            <div>
	            <div>
	            	 <div>
	                    <strong class="big-tit">
	                        <a>등급 관리</a>
	                    </strong>
	                </div>
	            	<div class="searchbar">
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
			      </div>
                <table border="1" class="admintable">
                    <thead class="tablehead">
                        <tr>
                            <th>회원 번호</th>                          
                            <th>생성일</th>
                            <th>성명</th>
                            <th>관리</th>                           
                        </tr>
                    </thead>
                    <tbody class="tablebody">
                        <tr>
                            <td>10</td>                           
                            <td>"2022-11-04T16:57"</td>
                            <td>홍길동</td>
                            <td>
                                <div>
                                    <span >
                                        <img src="${pageContext.request.contextPath }/images/edit.png" alt="수정" id="edimg">
                                        <a href="#">
                                            <button type="button">수정</button>
                                        </a>
                                    </span>                            
                                </div>
                            </td>
                        </tr>
                       <tr>
                            <td>10</td>                           
                            <td>"2022-11-04T16:57"</td>
                            <td>홍길동</td>
                            <td>
                                <div>
                                    <span >
                                        <img src="${pageContext.request.contextPath }/images/edit.png" alt="수정" id="edimg">
                                        <a href="#">
                                            <button type="button">수정</button>
                                        </a>
                                    </span>                            
                                </div>
                            </td>
                        </tr>
                       <tr>
                            <td>10</td>                           
                            <td>"2022-11-04T16:57"</td>
                            <td>홍길동</td>
                            <td>
                                <div>
                                    <span >
                                        <img src="${pageContext.request.contextPath }/images/edit.png" alt="수정" id="edimg">
                                        <a href="#">
                                            <button type="button">수정</button>
                                        </a>
                                    </span>                            
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>10</td>                           
                            <td>"2022-11-04T16:57"</td>
                            <td>홍길동</td>
                            <td>
                                <div>
                                    <span >
                                        <img src="${pageContext.request.contextPath }/images/edit.png" alt="수정" id="edimg">
                                        <a href="#">
                                            <button type="button">수정</button>
                                        </a>
                                    </span>                            
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>10</td>                           
                            <td>"2022-11-04T16:57"</td>
                            <td>홍길동</td>
                            <td>
                                <div>
                                    <span >
                                        <img src="${pageContext.request.contextPath }/images/edit.png" alt="수정" id="edimg">
                                        <a href="#">
                                            <button type="button">수정</button>
                                        </a>
                                    </span>                            
                                </div>
                            </td>
                        </tr>
                       <tr>
                            <td>10</td>                           
                            <td>"2022-11-04T16:57"</td>
                            <td>홍길동</td>
                            <td>
                                <div>
                                    <span >
                                        <img src="${pageContext.request.contextPath }/images/edit.png" alt="수정" id="edimg">
                                        <a href="#">
                                            <button type="button">수정</button>
                                        </a>
                                    </span>                            
                                </div>
                            </td>
                        </tr>
                       <tr>
                            <td>10</td>                           
                            <td>"2022-11-04T16:57"</td>
                            <td>홍길동</td>
                            <td>
                                <div>
                                    <span >
                                        <img src="${pageContext.request.contextPath }/images/edit.png" alt="수정" id="edimg">
                                        <a href="#">
                                            <button type="button">수정</button>
                                        </a>
                                    </span>                            
                                </div>
                            </td>
                        </tr>
                      <tr>
                            <td>10</td>                           
                            <td>"2022-11-04T16:57"</td>
                            <td>홍길동</td>
                            <td>
                                <div>
                                    <span >
                                        <img src="${pageContext.request.contextPath }/images/edit.png" alt="수정" id="edimg">
                                        <a href="#">
                                            <button type="button">수정</button>
                                        </a>
                                    </span>                            
                                </div>
                            </td>
                        </tr>
                        <tr>
                           <td>10</td>                           
                            <td>"2022-11-04T16:57"</td>
                            <td>홍길동</td>
                            <td>
                                <div>
                                    <span >
                                        <img src="${pageContext.request.contextPath }/images/edit.png" alt="수정" id="edimg">
                                        <a href="#">
                                            <button type="button">수정</button>
                                        </a>
                                    </span>                            
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>10</td>                           
                            <td>"2022-11-04T16:57"</td>
                            <td>홍길동</td>
                            <td>
                                <div>
                                    <span >
                                        <img src="${pageContext.request.contextPath }/images/edit.png" alt="수정" id="edimg">
                                        <a href="#">
                                            <button type="button">수정</button>
                                        </a>
                                    </span>                            
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
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