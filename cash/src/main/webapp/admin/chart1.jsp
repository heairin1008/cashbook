<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chart1</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script><!-- jQuery -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script><!-- chart.js -->
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/inc/chartMenu.jsp"></jsp:include>
	<h1>chart1</h1>
	<!-- table -->
	<div>
		<table>
			<tr>
				<td></td>
			</tr>
		</table>
	</div>
	<!-- chart -->
	<div>
		<div>
			<select id="year" name="year">
				<c:forEach var="c" items="${year}">
					<option value="${c.year}">${c.year}</option>
				</c:forEach>
			</select>
		</div>
		<div>
			<button id="totalOutAndInByYearChart" type="button"></button>
		</div>
		<div>
			<canvas id="chart1"></canvas>
		</div>
	</div>
</body>
<script>
$('#totalOutAndInByYearChart').click(function(){
	$.ajax({
		url:'/totalOutAndInByYear',
		type:'get',
		success:function(data){
			// 차트 구현 코드
			var ctx = document.getElementById('chart1').getContext('2d');
			var chart = new Chart(ctx, {
				type:'bar', // chart 종류
				data:{
					labels:['수입','지출'], // x축, y축
					datasets:[{
						label:$('#year')+'년 수입 / 지출',
						 backgroundColor: [
				                'rgba(255, 99, 132, 0.2)',
				                'rgba(54, 162, 235, 0.2)'
				            ],
				            borderColor: [
				                'rgba(255, 99, 132, 1)',
				                'rgba(54, 162, 235, 1)',
				            ],
				            // data속성의 배열값은 ajax 호출 후 결과값으로 채워야함.
						data:[data.수입, data.지출],
						borderWidth: 1
					}]
				}, // chart 안에 사용되는 모든 데이터
				options:{}
			});
		}
	});
});
</script>
</html>