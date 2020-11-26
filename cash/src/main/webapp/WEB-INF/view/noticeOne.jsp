<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeOne</title>
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
			<span style="font-size:36px;" class="font-weight-bold">공지사항</span>
		</div>
		<table class="table table-bordered">
			<tr>
				<td>번호</td>
				<td>${noticeOne.noticeId}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>${noticeOne.noticeTitle}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>${noticeOne.noticeContent}</td>
			</tr>
			<tr>
				<td>작성시간</td>
				<td>${noticeOne.noticeDate}</td>
			</tr>
		</table>
		
		<h4 class="font-weight-bold">첨부파일</h4>
		<table class="table">
			<c:forEach var="nf" items="${noticeOne.noticefile}">
				<tr>
					<td><a style="text-decoration:none;" href="${pageContext.request.contextPath}/upload/${nf.noticefileName}">${nf.noticefileName}</a></td>
				</tr>
			</c:forEach>
		</table>
		<div>
			<a class="btn btn-success" href="${pageContext.request.contextPath}/admin/noticeList/1">목록</a>
			<a class="btn btn-info" href="${pageContext.request.contextPath}/admin/modifyNotice?noticeId=${noticeOne.noticeId}">수정</a>
			<a class="btn btn-danger" href="${pageContext.request.contextPath}/admin/removeNotice?noticeId=${noticeOne.noticeId}">삭제</a>
		</div>
		
		<table class="table">
			<tr>
				<th>번호</th>
				<th>내용</th>
				<th>작성일자</th>
				<th>삭제</th>
			</tr>
			<tr>
				<c:forEach var="c" items="${noticeOne.commentList}">
					<c:if test="${!empty c.commentContent}">
						<td>${c.commentId}</td>
						<td>${c.commentContent}</td>
						<td>${c.commentDate}</td>
						<td><a class="btn btn-danger" href="${pageContext.request.contextPath}/admin/removeComment?noticeId=${c.noticeId}&commentId=${c.commentId}">삭제</a></td>
					</c:if>
				</c:forEach>
			</tr>
		</table>
		
		<form action="/admin/addComment" method="post">
			<input type="hidden" name="noticeId" value="${noticeOne.noticeId}">
			<div style="text-align:right;">
				<textarea class="form-control" rows="5" cols="50" name="commentContent">댓글을 입력해주세요</textarea>
				<button style="margin-top:5px;" type="submit" class="btn btn-info">등록</button>
			</div>
		</form>
	</div>
</body>
</html>