<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>newNoticeList</title>
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
		<div></div>
		<table class="table table-hover text-center">
			<thead>
				<tr>
					<th>공지번호</th>
					<th>제목</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="c" items="${noticeList}">
					<tr>
						<td>${c.noticeId}</td>
						<td><a class="btn-block" style="text-decoration:none;" href="${pageContext.request.contextPath}/admin/noticeOne?noticeId=${c.noticeId}">${c.noticeTitle}</a></td>
						<td>${c.noticeDate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div style="text-align:right;">
			<span style="padding-left:10px;"><a class="btn btn-small btn-success" href="${pageContext.request.contextPath}/admin/addNotice">등록</a></span>
		</div>
		<ul class="pagination justify-content-center">
		<!-- 처음 / 이전 버튼 -->
			<c:choose>
				<c:when test="${currentPage > 1}">
					<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/admin/noticeList/1">처음</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/admin/noticeList/${currentPage - 1}">이전</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item disabled">
						<a class="page-link" href="#">처음</a>
					</li>
					<li class="page-item disabled">
						<a class="page-link" href="#">이전</a>
					</li>
				</c:otherwise>
			</c:choose>
			<!-- 페이지 수 -->
			<c:forEach var="i" begin="${navbarFirst}" end="${navbarLast}">
				<c:if test="${i <= lastPage}">
					<c:choose>
						<c:when test="${i == currentPage}">
							<li class="page-item disabled">
								<a class="page-link" href="#">${i}</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
								<a class="page-link" href="${pageContext.request.contextPath}/admin/noticeList/${i}">${i}</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:if>
			</c:forEach>
               <!-- 마지막 / 다음 페이징 버튼 -->
            <c:choose>
				<c:when test="${currentPage < lastPage}">
					<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/admin/noticeList/${currentPage + 1}">다음</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/admin/noticeList/${lastPage}">마지막</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item disabled">
						<a class="page-link" href="#">다음</a>
					</li>
					<li class="page-item disabled">
						<a class="page-link" href="#">마지막</a>
					</li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</body>
</html>