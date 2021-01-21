<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Kalam&display=swap" rel="stylesheet">
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
	
	#font{
		font-family: 'Kalam', cursive;
		width:50%;
		margin:auto;
		padding-top:10px;
	}
</style>
</head>
<body>
	<h2 id="font">CASHBOOK</h2>
	
	<div style="margin-top:3%;"></div>
	<h1 class="text-center">Login</h1>
	<div id="login" class="form-group">
	<form method="post" action="${pageContext.request.contextPath}/login">
		<table id="login">
			<tr>
				<td><input class="form-control" type="text" name="id" placeholder="ID" value="goodee"></td>
			</tr>
			<tr>
				<td><input class="form-control" type="password" name="pw" placeholder="PW" value="1234"></td>
			</tr>
			<tr>
				<td><button class="form-control btn btn-success" type="submit">로그인</button></td>
			</tr>
		</table>
	</form>
	</div>
	<div style="margin-top:50px;"></div>
	<h4 id="table" style="margin-bottom:10px;" class="font-weight-bold">공지사항</h4>
	<div>
		<!-- 공지 -->
		<table id="table" class="table table-bordered text-center">
			<thead>
				<tr>
					<th>공지번호</th>
					<th>제목</th>
					<th>등록일</th>
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