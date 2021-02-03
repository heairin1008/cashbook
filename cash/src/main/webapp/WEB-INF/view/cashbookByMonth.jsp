<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style type="text/css">
	#sunday {color: red;}
	#saturday{color: blue;}
	#table{
		width:70%;
		margin:auto;
	}
	#sumIn{
		width:70%;
		margin:auto;
		color:blue;
		font-size:18px;
	}
	#sumOut{
		width:70%;
		margin:auto;
		color:red;
		font-size:18px;
	}
	
	td{
		width:130px;
		height:130px;
		vertical-align:top;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div id="table" style="padding:20px 0px 20px 0px; text-align:center;" class="jumbotron">
		<span style="font-size:36px;" class="font-weight-bold">가계부</span>
	</div>
	<div style="padding-bottom:10px;"></div>
	<!-- 다이어리 -->
	<h3 class="text-center font-weight-bold">
		<a style="text-decoration:none;" class="text-info" href="${pageContext.request.contextPath}/admin/cashbookByMonth/${currentYear}/${currentMonth-1}">[이전달]</a>
		${currentYear}년 ${currentMonth} 월
		<a style="text-decoration:none;" class="text-info" href="${pageContext.request.contextPath}/admin/cashbookByMonth/${currentYear}/${currentMonth+1}">[다음달]</a>
	</h3>
	<div id="sumIn" class="font-weight-bold">
		이번달 수입 합계 : ${sumIn}
	</div>
	<div id="sumOut" class="font-weight-bold">
		이번달 지출 합계 : ${sumOut}
	</div>
	<div>
		<table id="table" class="table table-bordered font-weight-bold">
			<thead>
				<tr class="text-center">
					<th id="sunday">일</th>
					<th>월</th>
					<th>화</th>
					<th>수</th>
					<th>목</th>
					<th>금</th>
					<th id="saturday">토</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<c:forEach var="i" begin="1" end="${lastDay+(firstDayOfWeek-1)}" step="1">
						<c:if test="${i-(firstDayOfWeek-1) <1 }">
							<td>&nbsp;</td>
						</c:if>
						<c:if test="${i-(firstDayOfWeek-1) >0 }">
							<td>
								<!--  <div><a href="/admin/cashbookByDay?currentYear=${currentYear}&currentMonth=${currentMonth}&currentDay=${i-(firstDayOfWeek-1)}">${i-(firstDayOfWeek-1)}</a></div>-->
								<div><a class="btn-block" style="text-decoration:none;" href="${pageContext.request.contextPath}/admin/cashbookByDay/now/${currentYear}/${currentMonth}/${i-(firstDayOfWeek-1)}">${i-(firstDayOfWeek-1)}</a></div>
								<c:forEach var="c" items="${cashList}">
									<c:if test="${i-(firstDayOfWeek-1) == c.dday}">
										<div>
											<c:if test="${c.cashbookKind == '수입'}">
												<div style="color:blue;">수입 : ${c.cashbookPrice}</div>
											</c:if>
											<c:if test="${c.cashbookKind == '지출'}">
												<div style="color:red;">지출 : ${c.cashbookPrice}</div>
											</c:if>
										</div>
									</c:if>
								</c:forEach>
							</td>
						</c:if>
						<c:if test="${i%7 == 0}">
							<tr></tr>
						</c:if>
					</c:forEach>
					
					<c:if test="${(lastDay+(firstDayOfWeek-1)) %7 !=0 }">
						<c:forEach begin="1" end="${7-((lastDay+(firstDayOfWeek-1)) %7)}" step="1">
								<td>&nbsp;</td>
						</c:forEach>
					</c:if>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>