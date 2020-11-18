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
		<h3>연도별 수입 / 지출</h3>
		<div>
			<span>연도 : </span>
			<input type="text" id="year">
			<button id="totalOutAndInByYearTable" type="button">table</button>
			<button id="totalOutAndInByYearChart" type="button">chart</button>
		</div>
		<div>
			<span id="totalOfMonthByYearTableResult"></span>
		</div>
		</div>
		<!-- chart -->
		<div>
			<div>
				<canvas id="chart1"></canvas>
			</div>
		</div>
</body>
<script>
$('#totalOutAndInByYearChart').click(function(){
	$.ajax({
		url:'/totalOutAndInByYear/'+$('#year').val(),
		type:'get',
		success:function(data){
			console.log(data);
			let pieCtx = $('#chart1');
			let pieChart = new Chart(pieCtx, {
				type:'pie',
				data:{
					labels:['수입', '지출'], // 항목들
					datasets:[{
						backgroundColor:['rgba(255, 99, 132, 0.2)','rgba(54, 162, 235, 0.2)'], // a는 투명도
						borderColor:['rgba(255, 206, 86, 0.2)','rgba(75, 192, 192, 0.2)'],
						data:[data.수입, data.지출] // 데이터
					}]
				},
				options:{}
			});
		}
	});
});

$('#totalOutAndInByYearTable').click(function(){
	// $('#totalOfMonthByYearTableResult').html('totalOfMonthByYearTableResult');
	$.ajax({
		url:'/totalOutAndInByYear/'+$('#year').val(),
		type:'get',
		success:function(data){
			console.log(data);
			let html = `
				<table border="1">
					<tr>
						<th>연도</th>
						<th>수입</th>
						<th>지출</th>
					</tr>
					<tr>
						<td>\${$('#year').val()}</td>
						<td>\${data.수입}</td>
						<td>\${data.지출}</td>
					</tr>
				</table>
			`;
			$('#totalOfMonthByYearTableResult').html(html);
		}
	});
});
</script>
</html>