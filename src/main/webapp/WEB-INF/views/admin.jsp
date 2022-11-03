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
	     <div class="All-Wrapper"  style="margin-top: 20px;">
        <!--사이드바 부분-->
        <div id="snb" class="snb">
            <dl>
                <dt class="sub-title">
                    <a href="#">관리자</a>
                </dt>
                <dd>
                    <ul class="sub-menu">
                        <li><a href="Admin-product.html">상품 관리</a></li>
                        <li id="product"><a href="Admin-reserve.html">예약 관리</a></li>
                    </ul>
                </dd>
            </dl>
        </div>
        <!--본문 부분-->
        <div class="Contents-wrap.fix">
            <div class="txt-title">
                <div>
                    <strong class="big-tit">
                        <p>상품 관리</p>
                    </strong>
                </div>
                <div class="BD-search">
                    <form class="admin-bd-search">
                        <input type="text" class="form" placeholder="검색어를 입력해 주세요." aria-label="Search">
                        <a href="#"><img src="images/ico-search.png" id="bd-sc-img" alt="검색"></a>
                    </form>
                </div>

            </div>
            
            <div>
                <table border=1 class="tg">
                    <thead class="tb-head">
                        <tr>
                            <th class="tb-num">상품 번호</th>                          
                            <th class="tb-name">상품명</th>
                            <th class="tb-pri">판매가</th>
                            <th class="tb-man" style="width:250px">관리</th>                           
                        </tr>
                    </thead>
                    <tbody>
                        <tr id="asdf">
                            <td class="tb-sub-sum">10</td>                           
                            <td>전주 #한옥마을 #베스트웨스턴 #1박 #한복체험</td>
                            <td>150,000</td>
                            <td class="tb-man">
                                <div class="ed-dl-wrap">
                                    <span id="ed-dl-span">
                                        <img src="images/edit.png" alt="수정" id="ed-dl">
                                        <a href="#">
                                            <button type="button" class="btn-ad-pro">수정</button>
                                        </a>
                                    </span>
                                    <span id="ed-dl-span1">
                                        <img src="images/delete.png" alt="수정" id="ed-dl">
                                        <button type="button" class="btn-ad-pro1">삭제</button>  
                                    </span>                              
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="tb-sub-sum">9</td>                          
                            <td>고창 #라벤더 #수국 #꽃잔치 #청농원 #선운사</td>
                            <td>250,000</td>
                            <td class="tb-man">
                                <div class="ed-dl-wrap">
                                    <span id="ed-dl-span">
                                        <img src="images/edit.png" alt="수정" id="ed-dl">
                                        <a href="#">
                                            <button type="button" class="btn-ad-pro">수정</button>
                                        </a>
                                    </span>
                                    <span id="ed-dl-span1">
                                        <img src="images/delete.png" alt="수정" id="ed-dl">                      
                                        <button type="button" class="btn-ad-pro1">삭제</button>                              
                                    </span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="tb-sub-sum">8</td>                          
                            <td>제주 #우도관광 #제주특식 #실속여행 #섬여행</td>
                            <td>450,000</td>
                            <td class="tb-man">
                                <div class="ed-dl-wrap">
                                    <span id="ed-dl-span">
                                        <img src="images/edit.png" alt="수정" id="ed-dl">
                                        <a href="#">
                                            <button type="button" class="btn-ad-pro">수정</button>
                                        </a>
                                    </span>
                                    <span id="ed-dl-span1">
                                        <img src="images/delete.png" alt="수정" id="ed-dl">
                                        <button type="button" class="btn-ad-pro1">삭제</button>  
                                    </span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="tb-sub-sum">7</td>                            
                            <td>여수 #여수해상케이블카 #오동도 #향일암</td>
                            <td>300,000</td>
                            <td class="tb-man">
                                <div class="ed-dl-wrap">
                                    <span id="ed-dl-span">
                                        <img src="images/edit.png" alt="수정" id="ed-dl">
                                        <a href="#">
                                            <button type="button" class="btn-ad-pro">수정</button>
                                        </a>
                                    </span>
                                    <span id="ed-dl-span1">
                                        <img src="images/delete.png" alt="수정" id="ed-dl">
                                        <button type="button" class="btn-ad-pro1">삭제</button>  
                                    </span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="tb-sub-sum">6</td>                            
                            <td>영주 #2일 #한옥스테이 1박 #의관댁 별채 #막걸리빚기</td>
                            <td>210,000</td>
                            <td class="tb-man">
                                <div class="ed-dl-wrap">
                                    <span id="ed-dl-span">
                                        <img src="images/edit.png" alt="수정" id="ed-dl">
                                        <a href="#">
                                            <button type="button" class="btn-ad-pro">수정</button>
                                        </a>
                                    </span>
                                    <span id="ed-dl-span1">
                                        <img src="images/delete.png" alt="수정" id="ed-dl">
                                        <button type="button" class="btn-ad-pro1">삭제</button>  
                                    </span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="tb-sub-sum">5</td>                           
                            <td>울릉도 #독도포함 #강릉쾌속선 #육로버스투어</td>
                            <td>240,000</td>
                            <td class="tb-man">
                                <div class="ed-dl-wrap">
                                    <span id="ed-dl-span">
                                        <img src="images/edit.png" alt="수정" id="ed-dl">
                                        <a href="#">
                                            <button type="button" class="btn-ad-pro">수정</button>
                                        </a>
                                    </span>
                                    <span id="ed-dl-span1">
                                        <img src="images/delete.png" alt="수정" id="ed-dl">
                                        <button type="button" class="btn-ad-pro1">삭제</button>  
                                    </span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="tb-sub-sum">4</td>                           
                            <td>춘천 #레고랜드 #이색체험 #가족여행 </td>
                            <td>170,000</td>
                            <td class="tb-man">
                                <div class="ed-dl-wrap">
                                    <span id="ed-dl-span">
                                        <img src="images/edit.png" alt="수정" id="ed-dl">
                                        <a href="#">
                                            <button type="button" class="btn-ad-pro">수정</button>
                                        </a>
                                    </span>
                                    <span id="ed-dl-span1">
                                        <img src="images/delete.png" alt="수정" id="ed-dl">
                                        <button type="button" class="btn-ad-pro1">삭제</button>  
                                    </span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="tb-sub-sum">3</td>                            
                            <td>제주 #신화월드 랜딩관 #무민랜드 #뮤즈티켓</td>
                            <td>1,200,000</td>
                            <td class="tb-man">
                                <div class="ed-dl-wrap">
                                    <span id="ed-dl-span">
                                        <img src="images/edit.png" alt="수정" id="ed-dl">
                                        <a href="#">
                                            <button type="button" class="btn-ad-pro">수정</button>
                                        </a>
                                    </span>
                                    <span id="ed-dl-span1">
                                        <img src="images/delete.png" alt="수정" id="ed-dl">
                                        <button type="button" class="btn-ad-pro1">삭제</button>  
                                    </span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="tb-sub-sum">2</td>                           
                            <td>울주 #반려견동반 #1박 2일 #독채펜션 #영남알프스</td>
                            <td>1,000,000</td>
                            <td class="tb-man">
                                <div class="ed-dl-wrap">
                                    <span id="ed-dl-span">
                                        <img src="images/edit.png" alt="수정" id="ed-dl">
                                        <a href="#">
                                            <button type="button" class="btn-ad-pro">수정</button>
                                        </a>
                                    </span>
                                    <span id="ed-dl-span1">
                                        <img src="images/delete.png" alt="수정" id="ed-dl">
                                        <button type="button" class="btn-ad-pro1">삭제</button>  
                                    </span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="tb-sub-sum">1</td>                           
                            <td>부산 #송도 #송도케이블카 #오륙도스카이워크</td>
                            <td>39,800</td>
                            <td class="tb-man">
                                <div class="ed-dl-wrap">
                                    <span id="ed-dl-span">
                                        <img src="images/edit.png" alt="수정" id="ed-dl">
                                        <a href="#">
                                            <button type="button" class="btn-ad-pro">수정</button>
                                        </a>
                                    </span>
                                    <span id="ed-dl-span1">
                                        <img src="images/delete.png" alt="수정" id="ed-dl">
                                        <button type="button" class="btn-ad-pro1">삭제</button>  
                                    </span>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div>
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
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
                  </nav>
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