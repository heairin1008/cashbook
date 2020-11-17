<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script><!-- jQuery -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script><!-- chart.js -->
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/inc/chartMenu.jsp"></jsp:include>
	<h1>chart2</h1>
	<!-- table -->
		<h3>연도에 따른 월별 지출</h3>
		<div>
			<input type="text" id="year">
			<button id="totalOfMonthByYearTable" type="button">table</button>
			<button id="totalOfMonthByYearChart" type="button">chart</button>
		</div>
	<div>
		<table>
		</table>
	</div>
		<!-- chart -->
	<div>
		<canvas id="chart2"></canvas>
	</div>
</body>

<script>
$('#totalOfMonthByYearChart').click(function(){
	$.ajax({
		url:'/totalOfMonthByYear/'+$('#year').val(),
		type:'get',
		success:function(data){
			// 차트 구현 코드
			var ctx = document.getElementById('chart2').getContext('2d');
			var chart = new Chart(ctx, {
				type:'bar', // chart 종류
				data:{
					labels:['1','2','3','4','5','6','7','8','9','10','11','12'], // x축, y축
					datasets:[{
						label:'연도에 따른 월별 지출',
						 backgroundColor: [
				                'rgba(255, 99, 132, 0.2)',
				                'rgba(54, 162, 235, 0.2)',
				                'rgba(255, 206, 86, 0.2)',
				                'rgba(75, 192, 192, 0.2)',
				                'rgba(153, 102, 255, 0.2)',
				                'rgba(255, 159, 64, 0.2)',
				                'rgba(255, 99, 132, 0.2)',
				                'rgba(54, 162, 235, 0.2)',
				                'rgba(255, 206, 86, 0.2)',
				                'rgba(75, 192, 192, 0.2)',
				                'rgba(153, 102, 255, 0.2)',
				                'rgba(255, 159, 64, 0.2)'
				            ],
				            borderColor: [
				                'rgba(255, 99, 132, 1)',
				                'rgba(54, 162, 235, 1)',
				                'rgba(255, 206, 86, 1)',
				                'rgba(75, 192, 192, 1)',
				                'rgba(153, 102, 255, 1)',
				                'rgba(255, 159, 64, 1)',
				                'rgba(255, 99, 132, 1)',
				                'rgba(54, 162, 235, 1)',
				                'rgba(255, 206, 86, 1)',
				                'rgba(75, 192, 192, 1)',
				                'rgba(153, 102, 255, 1)',
				                'rgba(255, 159, 64, 1)'
				            ],
				            // data속성의 배열값은 ajax 호출 후 결과값으로 채워야함.
						data:[data.january, data.february, data.march, data.april, data.may, data.june, 
							data.july, data.august,data.september,data.october,data.november,data.december],
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