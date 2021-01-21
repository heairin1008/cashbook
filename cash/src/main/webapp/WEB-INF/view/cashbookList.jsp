<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cashbookList</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
	#table{
		width:70%;
		margin:auto;
	}
	div{
		padding-bottom:10px;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div id="table">
		<div style="padding:20px 0px 20px 0px; text-align:center;" class="jumbotron">
			<span style="font-size:36px;" class="font-weight-bold">전체 내역</span>
		</div>
		<div>
		<a class="btn btn-info" href="${pageContext.request.contextPath}/admin/cashbookListExcel">전체 리스트 엑셀파일 다운</a>
		</div>
		<table class="table table-striped text-center">
			<thead>
				<tr>
					<th>수입 / 지출</th>
					<th>카테고리</th>
					<th>금액</th>
					<th>내용</th>
					<th>날짜</th>
					<th>등록일</th>
					<th>수정일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="c" items="${cashbookList}">
					<tr>
						<td>${c.cashbookKind}</td>
						<td>${c.categoryName}</td>
						<td>${c.cashbookPrice}</td>
						<td>${c.cashbookContent}</td>
						<td>${c.cashbookDate}</td>
						<td>${c.createDate}</td>
						<td>${c.updateDate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- 페이징 -->
		<ul class="pagination justify-content-center">
		<!-- 처음 / 이전 버튼 -->
			<c:choose>
				<c:when test="${currentPage > 1}">
					<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/admin/cashbookList/1">처음</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/admin/cashbookList/${currentPage - 1}">이전</a>
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
								<a class="page-link" href="${pageContext.request.contextPath}/admin/cashbookList/${i}">${i}</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:if>
			</c:forEach>
               <!-- 마지막 / 다음 페이징 버튼 -->
            <c:choose>
				<c:when test="${currentPage < lastPage}">
					<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/admin/cashbookList/${currentPage + 1}">다음</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/admin/cashbookList/${lastPage}">마지막</a>
					</li>
				</c:when>
			</c:choose>
		</ul>
	</div>
</body>
</html>