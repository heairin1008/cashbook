<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<ul class="nav nav-tabs">
	<li class="nav-item">
		<a class="nav-link text-info" href="${pageContext.request.contextPath}/admin/chart1.jsp">연도별 수입 / 지출</a>
	</li>
	<li class="nav-item dropdown">
	      <a class="nav-link dropdown-toggle text-info" href="#" id="navbardrop" data-toggle="dropdown">
	        연도별 월 수입 / 지출
	      </a>
	      <div class="dropdown-menu">
	        <a class="dropdown-item text-info" href="${pageContext.request.contextPath}/admin/chart2.jsp">연도별 월 지출내역</a>
	        <a class="dropdown-item text-info" href="${pageContext.request.contextPath}/admin/chart3.jsp">연도별 월 수입내역</a>
	      </div>
	</li>
		<li class="nav-item dropdown">
	      <a class="nav-link dropdown-toggle text-info" href="#" id="navbardrop" data-toggle="dropdown">
	        카테고리별 연간 수입 / 지출
	      </a>
	      <div class="dropdown-menu">
	        <a class="dropdown-item text-info" href="${pageContext.request.contextPath}/admin/chart4.jsp">카테고리별 연간 지출내역</a>
	        <a class="dropdown-item text-info" href="${pageContext.request.contextPath}/admin/chart5.jsp">카테고리별 연간 수입내역</a>
	      </div>
	</li>
	<li class="nav-item">
		<a class="nav-link text-info" href="${pageContext.request.contextPath}/admin/chart6.jsp">연도별 월 수입 / 지출 합계</a>
	</li>
	<li class="nav-item">
		<a class="nav-link text-info" href="${pageContext.request.contextPath}/admin/chart7.jsp">chart7</a>
	</li>
	<li class="nav-item">
		<a class="nav-link text-info" href="${pageContext.request.contextPath}/admin/chart8.jsp">chart8</a>
	</li>
	<li class="nav-item">
		<a class="nav-link text-info" href="${pageContext.request.contextPath}/admin/chart9.jsp">chart9</a>
	</li>
</ul>