<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeList</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1>공지사항</h1>
	<div><a href="/admin/addNotice"><button type="button">등록</button></a></div>
	<table border="1">
		<thead>
			<tr>
				<th>notice_id</th>
				<th>notice_title</th>
				<th>notice_date</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="c" items="${noticeList}">
				<tr>
					<td>${c.noticeId}</td>
					<td><a href="/admin/noticeOne/${c.noticeId}">${c.noticeTitle}</a></td>
					<td>${c.noticeDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div>
		<c:if test="${currentPage > 1}">
			<a href="/admin/noticeList/1">[처음]</a>
			<a href="/admin/noticeList/${currentPage - 1}">[이전]</a>
			<span>${currentPage}</span>
		</c:if>
		<c:if test="${currentPage < lastPage}">
			<span>${currentPage}</span>
			<a href="/admin/noticeList/${currentPage + 1}">[다음]</a>
			<a href="/admin/noticeList/${lastPage}">[마지막]</a>
		</c:if>
		
	</div>
</body>
</html>