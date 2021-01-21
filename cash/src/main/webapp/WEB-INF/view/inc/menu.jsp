<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Kalam&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style type="text/css">
	li{font-size:17px;}
</style>
<nav class="navbar navbar-custom navbar-expand-sm bg-dark navbar-dark"> 
	<ul class="navbar-nav">
		<li class="nav-item active">
			<a class="navbar-brand" href="" style="font-family: 'Kalam', cursive;">Cashbook</a>
		</li>
		<li class="nav-item">
			<a class="nav-link"  href="${pageContext.request.contextPath}/admin/index">HOME</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="${pageContext.request.contextPath}/admin/cashbookByMonth/-1/-1">가계부</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="${pageContext.request.contextPath}/admin/cashbookList/1">전체내역</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="${pageContext.request.contextPath}/admin/chart1.jsp">통계자료</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="${pageContext.request.contextPath}/admin/noticeList/1">공지사항</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="${pageContext.request.contextPath}/admin/addMember">사용자 추가</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="${pageContext.request.contextPath}/admin/logout">LogOut</a>
		</li>
	</ul>
</nav>