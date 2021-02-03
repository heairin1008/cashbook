<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일별 가계부</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
	#table{
		width:70%;
		margin:auto;
	}
	div{
		padding-bottom:20px;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div id="table">
		<div style="padding:20px 0px 20px 0px; text-align:center;" class="jumbotron">
			<span style="font-size:36px;" class="font-weight-bold">일일 수입 / 지출</span>
		</div>
		<div style="padding-top:10px;">
			<h3 class="text-center font-weight-bold">
				<a style="text-decoration:none;" class="text-secondary" href="${pageContext.request.contextPath}/admin/cashbookByDay/pre/${currentYear}/${currentMonth}/${currentDay}"> << </a>
				${currentYear}년${currentMonth}월${currentDay}일
				<a style="text-decoration:none;" class="text-secondary" href="${pageContext.request.contextPath}/admin/cashbookByDay/next/${currentYear}/${currentMonth}/${currentDay}"> >> </a>
			</h3>
		</div>
		<a style="margin-bottom:5px;" class="btn btn-sm btn-info font-weight-bold" href = "${pageContext.request.contextPath}/admin/addCashbook/now/${currentYear}/${currentMonth}/${currentDay}">수입/지출 입력</a>
		<table class="table table-border text-center">
			<thead>
				<tr>
					<th>번호</th>
					<th>수입 / 지출</th>
					<th>카테고리</th>
					<th>금액</th>
					<th>내용</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${!empty cashbookList}">
				<c:forEach var="c" items="${cashbookList}">
					<tr>	
						<td>${c.cashbookId}</td>
						<td>${c.cashbookKind}</td>
						<td>${c.categoryName}</td>
						<td>${c.cashbookPrice}</td>
						<td>${c.cashbookContent}</td>
						<td><a class="btn btn-outline-info" href="${pageContext.request.contextPath}/admin/updateCashbook/${c.cashbookId}/${currentYear}/${currentMonth}/${currentDay}">수정</a></td>
						<td><a class="btn btn-outline-danger" href="${pageContext.request.contextPath}/admin/deleteCashbook/${c.cashbookId}/${currentYear}/${currentMonth}/${currentDay}">삭제</a></td>
					</tr>
				</c:forEach>
				</c:if>
				<c:if test="${empty cashbookList}">
					<tr>
						<td colspan="7">내역이 없습니다.</td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</div>
</body>
</html>