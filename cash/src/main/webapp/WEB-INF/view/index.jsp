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
		width:60%;
		margin:auto;
	}
	div{
		padding-bottom:10px;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1 style="padding-top:20px;" class="text-center">HOME</h1>
	<div style="padding-left:330px;">
		<span style="font-size:24px;" class="font-weight-bold">공지사항</span> 
		<a class="btn btn-small btn-info" href="/admin/noticeList">more</a>
	</div>
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
	<div>
		<!-- 수입/지출/합계 -->
		<table id="table" class="table table-bordered text-center">
			<thead>
				<tr>
					<th>날짜</th>
					<th>수입</th>
					<th>지출</th>
					<th>합계</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="io" items="${inOutList}">
					<tr>
						<td>${io["날짜"]}</td>
						<td>${io["수입"]}</td>
						<td>${io["지출"]}</td>
						<td>${io["합계"]}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>