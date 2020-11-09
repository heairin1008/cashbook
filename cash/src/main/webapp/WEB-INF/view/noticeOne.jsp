<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeOne</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1>공지 상세보기</h1>
	<table border="1">
		<tr>
			<td>notice_id</td>
			<td>${noticeOne.noticeId}</td>
		</tr>
		<tr>
			<td>notice_title</td>
			<td>${noticeOne.noticeTitle}</td>
		</tr>
		<tr>
			<td>notice_content</td>
			<td>${noticeOne.noticeContent}</td>
		</tr>
		<tr>
			<td>notice_date</td>
			<td>${noticeOne.noticeDate}</td>
		</tr>
		<tr>
			<td colspan="2">
				<a href="/admin/modifyNotice/${noticeOne.noticeId}"><button>수정</button></a>
				<a href="/admin/removeNotice/${noticeOne.noticeId}"><button>삭제</button></a>
			</td>
		</tr>
	</table>
	<div><a href="/admin/noticeList"><button>목록</button></a></div>
</body>
</html>