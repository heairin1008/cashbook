<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
	#table{
		width:50%;
		margin:auto;
	}
	
	#login{
		width:40%;
		margin:auto;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div style="padding-bottom:20px;"></div>
	<h1 class="text-center">Login</h1>
	<div id="login" class="form-group">
	<form method="post" action="/login">
		<table id="login">
			<tr>
				<td><input class="form-control" type="text" name="id" placeholder="ID"></td>
			</tr>
			<tr>
				<td><input class="form-control" type="password" name="pw" placeholder="PW"></td>
			</tr>
			<tr>
				<td><button class="form-control btn btn-success" type="submit">로그인</button></td>
			</tr>
		</table>
	</form>
	</div>
	<div style="padding-bottom:10px;"></div>
	<h4 id="table" class="font-weight-bold">공지사항</h4>
	<div>
		<!-- 공지 -->
		<table id="table" class="table table-bordered text-center">
			<thead>
				<tr>
					<th>notice_id</th>
					<th>notice_title</th>
					<th>notice_date</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="n" items="${noticeList}">
					<tr>
						<td>${n.noticeId}</td>
						<td>${n.noticeTitle}</td>
						<td>${n.noticeDate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>
</html>