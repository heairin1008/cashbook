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
		<form class="form-group" method="post" action="${pageContext.request.contextPath}/admin/addCashbook">
			<table class="table">
				<tr>
					<td>cashbook_date</td>
					<td>
						<input class="form-control" type="text" name="cashbookDate" value="${currentYear}-${currentMonth}-${currentDay} " readonly="readonly">
					</td>
				</tr>
				<tr>
					<td>cashbook_kind</td>
					<td>
						<input type="radio" name="cashbookKind" value="지출">지출
						<input type="radio" name="cashbookKind" value="수입">수입
					</td>
				</tr>
				<tr>
					<td>category_name</td>
					<td>
						<select style="width:100px;" class="form-control" name="categoryName">
							<c:forEach var="c" items="${categoryList}">
								<option value="${c.categoryName}">${c.categoryName}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>cashbook_price</td>
					<td>
						<input class="form-control" type="text" name="cashbookPrice">
					</td>
				</tr>
				<tr>
					<td>cashbook_content</td>
					<td>
						<textarea class="form-control" rows="5" cols="50" name="cashbookContent"></textarea>
					</td>
				</tr>
			</table>
			<button class="btn btn-info" type="submit">입력완료</button>
		</form>
	</div>
</body>
</html>