<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateCashbook</title>
</head>
<body>
	<h1>가계부 수정</h1>
	<form method="post" action="/admin/updateCashbook/${cashbookId}/${currentYear}/${currentMonth}/${currentDay}">
	<table>
		<tr>
			<td>cashbook_id</td>
			<td><input type="text" name="cashbookId" value="${cashbook.cashbookId}" readonly="readonly"></td>
		</tr>
		<tr>
			<td>cashbook_kind</td>
			<td>
				<c:if test="${cashbook.cashbookKind == '수입'}">
					<input type="radio" name="cashbookKind" value="수입" checked="checked">수입
				</c:if>
				<c:if test="${cashbook.cashbookKind == '지출'}">
					<input type="radio" name="cashbookKind" value="지출" checked="checked">지출
				</c:if>
			</td>
		</tr>
		<tr>
			<td>category_name</td>
			<td>
				<select name="categoryName">
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
			<td><input type="text" name="cashbookPrice" value="${cashbook.cashbookPrice}"></td>
		</tr>
		<tr>
			<td>cashbook_content</td>
			<td><textarea rows="5" cols="50" name="cashbookContent">${cashbook.cashbookContent}</textarea></td>
		</tr>
		<tr>
			<td>cashbook_date</td>
			<td>
				<input type="text" name="cashbookDate" value="${cashbook.cashbookDate}" readonly="readonly">
			</td>
		</tr>
	</table>
	<div><button type="submit">수정</button></div>
	</form>
</body>
</html>