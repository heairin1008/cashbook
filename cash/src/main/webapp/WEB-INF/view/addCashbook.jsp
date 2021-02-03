<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수입 / 지출 입력</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
	#table{
		width:70%;
		margin:auto;
	}
	div{
		padding-bottom:30px;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div id="table">
		<div style="padding:20px 0px 20px 0px; text-align:center;" class="jumbotron">
			<span style="font-size:36px;" class="font-weight-bold">수입 / 지출 입력</span>
		</div>		
		<form id="cashForm" class="form-group" method="post" action="${pageContext.request.contextPath}/admin/addCashbook">
			<table class="table">
				<tr>
					<td>날짜</td>
					<td>
						<input class="form-control" type="text" name="cashbookDate" value="${currentYear}-${currentMonth}-${currentDay} " readonly="readonly">
					</td>
				</tr>
				<tr>
					<td>수입 / 지출</td>
					<td>
						<input type="radio" name="cashbookKind" value="지출">지출
						<input type="radio" name="cashbookKind" value="수입">수입
						<div id="checkKind" style="color:blue; margin-top:10px;"></div>
					</td>
				</tr>
				<tr>
					<td>카테고리</td>
					<td>
						<select style="width:100px;" class="form-control" name="categoryName">
							<c:forEach var="c" items="${categoryList}">
								<option value="${c.categoryName}">${c.categoryName}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>금액</td>
					<td>
						<input class="form-control" type="text" name="cashbookPrice" id="cashbookPrice">
						<div id="checkPrice" style="color:blue; margin-top:10px;"></div>
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<textarea class="form-control" style="resize:none;" rows="5" cols="50" name="cashbookContent" id="cashbookContent"></textarea>
						<div id="checkContent" style="color:blue; margin-top:10px;"></div>
					</td>
				</tr>
			</table>
			<button class="btn btn-info" id="addBtn" type="button">입력완료</button>
		</form>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		var checkPrice = /^[0-9]*$/;
		var kind = '';
		var content = '';
		var price = '';
		
		// 금액 입력했는지 확인
		// .on ~~ : 실시간으로 입력하는 값을 확인
		$('#cashbookPrice').on('propertychange change keyup paste input', function(){
			if(!checkPrice.test($('#cashbookPrice').val()) || $('#cashbookPrice').val() == ""){
				$('#checkPrice').text('금액을 입력해주세요.');
				price = '';
			}else{
				$('#checkPrice').text('');
				price = 'success';
				console.log('price : success');
			}
		});
		
		// 내용 입력했는지 확인
		$('#cashbookContent').on('propertychange change keyup paste input', function(){
			if($('#cashbookContent').val() == ""){
				$('#checkContent').text('내용을 입력해주세요.');
				content = '';
			}else{
				$('#checkContent').text('');
				content = 'success';
				console.log('content : success');
			}
		});
		
		$('#addBtn').click(function(){
			// 수입/지출 선택했는지 확인
			if($("input[name=cashbookKind]:radio:checked").length < 1){
				$('#checkKind').text('수입 또는 지출을 선택해주세요.');
				kind='';
			}else{
				$('#checkKind').text('');
				kind='success';
				console.log('kind : success');
			}
			
			if(kind == 'success' && price == 'success' && content == 'success'){
				$('#cashForm').submit();
			}else{
				alert('빈칸을 입력해주세요.');
			}
		});
		
		// 실시간으로 입력되는 값 확인
	</script>
</body>
</html>