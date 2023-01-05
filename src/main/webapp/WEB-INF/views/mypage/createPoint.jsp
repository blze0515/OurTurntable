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
			<form action="/point/createPoint.do" name="chargeForm" method="post" id="moneyForm">
			
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
						<!-- radio버튼은 name 속성이 같은 것들끼리 중복되지 않고 하나씩 클릭된다. -->
						<tr>
							<td><input type="radio" value="100" name="lp" checked="checked"></td>
							<td>100포인트</td>
							<td><span>Bonus</span> &nbsp;5 포인트</td>
						</tr>
						<tr>
							<td><input type="radio" value="500" name="lp" ></td>
							<td>500포인트</td>
							<td><span>Bonus</span> &nbsp;35 포인트</td>
						</tr>
						<tr>
							<td>
								<input type="radio" id="doublePoint" name="lp">
							</td>
							<td>1000포인트
								<select id="slt">
	                                <option value="1000" selected>x1</option>
	                                <option value="2000">x2</option>
	                                <option value="3000">x3</option>
	                                <option value="5000">x5</option>
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
					<input type="submit" value="충전하기">
				</div>
				<!-- 선택한 값을 컨트롤러에 넘기기 위해 input 추가 -->
				<input type="hidden" name="pointMoney" id="pointMoney">
			</form>
		
			</div>
		</div>
		
<!-- 	input 에 값 들어가는지 테스트하는 버튼 -->		
		<div style="text-align:center">
		<input type="button" onclick="test()" value="test"  style="width:300px; height:100px; font-size:50px;">
		</div>
		
	<jsp:include page="${pageContext.request.contextPath }/footer.jsp"></jsp:include>
	<script>
	$(function(){
		//기본값을 처음에 주지 않으면 클릭 이벤트가 발생하지 않는다고 하셨던 것 같음
		//readDonation.jsp에 script 부분에 on("click") 관련 예시 적혀있음
//			$("#pointMoney").val(100)
//			$("input[name='lp']").on("click", function(){
//				$("#pointMoney").val($(this).val());
//			});
		
		
		$("#pointMoney").val(100)
		$("input[name='lp']").on("click", function(){
			if($(this).val() < 1000){
//if 구분 제대로 되는지 test
// 				alert("test");
				$("#pointMoney").val($(this).val());
// 				alert( $("#pointMoney").val() );
			} else if(1000 <= $("#slt").val()){
//if 구분 제대로 되는지 test2222
//				alert("test2222");
                $("#pointMoney").val($("#slt").val());
// 				alert("pointMoney : "+ $("#pointMoney").val() );
			}
		});
        $("#slt").on("change", function(){
            $("#pointMoney").val($(this).val());
            // alert($("#pointMoney").val());
        });
	});
	
	
	//input 에 값 들어가는지 테스트하는 버튼
	function test(){
		
// 		alert("#slt : " + $("#slt").val() + " #poinMoney : " + $("#pointMoney").val());
		alert(" #poinMoney : " + $("#pointMoney").val());
		
	}
	</script>

</body>
</html>