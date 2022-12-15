<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/sh-board.css">
<style>
	table{
	display:table;
	}
</style>

</head>
<body>
	<jsp:include page="${pageContext.request.contextPath }/header.jsp"></jsp:include>
		<div class="untree_co-section">
			<div class="container" style="width:75%;">
		<form action="/point/createChargePoint.do" name="chargeForm" method="post" >
		
		<div class="charge-style01">
			<p style="margin-bottom:5px;">LP를 구매하여 친구에게 선물하기, 후원을 할 수 있습니다.</p>
		</div>
		
		<div class="charge-style02">
			<table>
				<colgroup>
					<col>
					<col>
					<col>
				</colgroup>
				<tr>
					<th> 선택 </th>
					<th> 충전 포인트 </th>
					<th> 추가 혜택 </th>
				</tr>
				<tr>
					<td><input type="radio" id="p100" value="100" name="lp" checked="checked"></td>
					<td>100포인트</td>
					<td><span>Bonus</span> &nbsp;5 포인트</td>
				</tr>
				<tr>
					<td><input type="radio" id="p500" value="500" name="lp" ></td>
					<td>500포인트</td>
					<td><span>Bonus</span> &nbsp;35 포인트</td>
				</tr>
				<tr>
					<td><input type="radio" id="p1000" value="1000" name="lp" ></td>
					<td>1000포인트<select>
							<option value="x1">x1</option>
							<option value="x2">x2</option>
							<option value="x3">x3</option>
							<option value="x5">x5</option>
						</select>
					</td>
					<td><span>Bonus</span> &nbsp;100 포인트</td>	
			</table>
		</div>
		
		<div class="charge-style03">
			적립되는 포인트는 <strong>~~ 포인트</strong> + <strong>~~ 포인트</strong>이며<br>
			결제시 부가세 10%를 포함한 <strong>~~ 원</strong>이 결제됩니다.
		</div>
		
		
		<div class="charge-style04">
			<input type="button" value="충전하기">
		</div>
		</form>
		
		
		
		
		
		
			</div>
		</div>
	<jsp:include page="${pageContext.request.contextPath }/footer.jsp"></jsp:include>
</body>
</html>