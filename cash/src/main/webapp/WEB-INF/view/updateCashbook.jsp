<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateCashbook</title>
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
			<span style="font-size:36px;" class="font-weight-bold">가계부 수정</span>
		</div>
		<form id="cashForm" class="form-group" method="post" action="${pageContext.request.contextPath}/admin/updateCashbook/${cashbookId}/${currentYear}/${currentMonth}/${currentDay}">
		<table class="table">
			<tr>
				<td>cashbook_id</td>
				<td><input class="form-control" type="text" name="cashbookId" value="${cashbook.cashbookId}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>cashbook_kind</td>
				<td>
					<c:if test="${cashbook.cashbookKind == '수입'}">
						<input type="radio" name="cashbookKind" value="수입" checked="checked">수입
						<input type="radio" name="cashbookKind" value="지출">지출
					</c:if>
					<c:if test="${cashbook.cashbookKind == '지출'}">
						<input type="radio" name="cashbookKind" value="수입">수입
						<input type="radio" name="cashbookKind" value="지출" checked="checked">지출
					</c:if>
				</td>
			</tr>
			<tr>
				<td>category_name</td>
				<td>
					<select style="width:100px;" class="form-control" name="categoryName">
						<c:forEach var="c" items="${category}">
							<c:if test="${cashbook.categoryName == c.categoryName}">
								<option value="${c.categoryName}" selected="selected">${cashbook.categoryName}</option>
							</c:if>
							<c:if test="${cashbook.categoryName != c.categoryName}">
								<option value="${c.categoryName}">${c.categoryName}</option>
							</c:if>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>cashbook_price</td>
				<td>
					<input class="form-control" type="text" name="cashbookPrice" id="cashbookPrice" value="${cashbook.cashbookPrice}">
					<div id="checkPrice" style="color:blue; margin-top:10px;"></div>
				</td>
			</tr>
			<tr>
				<td>cashbook_content</td>
				<td>
					<textarea class="form-control" rows="5" cols="50" name="cashbookContent" id="cashbookContent">${cashbook.cashbookContent}</textarea>
					<div id="checkContent" style="color:blue; margin-top:10px;"></div>
				</td>
			</tr>
			<tr>
				<td>cashbook_date</td>
				<td>
					<input class="form-control" type="text" name="cashbookDate" value="${cashbook.cashbookDate}" readonly="readonly">
				</td>
			</tr>
		</table>
		<div><button class="btn btn-info" id="updateBtn" type="button">수정</button></div>
		</form>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		var price = 'success';
		var content = 'success';
		
		var checkPrice = /^[0-9]*$/;
		
		// 금액 입력했는지 확인
		$('#cashbookPrice').on('propertychange change keyup paste input', function(){
			if(!checkPrice.test($('#cashbookPrice').val() || $('#cashbookPrice').val() == "")){
				$('#checkPrice').text('금액을 입력하세요.');
				price = '';
			}else{
				$('#checkPrice').text('');
				price = 'success';
			}
		});
		
		// 내용 입력했는지 확인
		$('#cashbookContent').on('propertychange change keyup paste input', function(){
			if($('#cashbookContent').val() == ""){
				$('#checkContent').text('내용을 입력하세요.');
				content = '';
			}else{
				$('#checkContent').text('');
				content = 'success';
			}
		});
		
		$('#updateBtn').click(function(){
			if(price == 'success' && content == 'success'){
				$('#cashForm').submit();
			}else{
				alert('빈칸을 입력해주세요.');
			}
		});
	</script>
</body>
</html>