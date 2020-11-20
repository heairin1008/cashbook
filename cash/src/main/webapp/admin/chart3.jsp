<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script><!-- jQuery -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script><!-- chart.js -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
	#table{
		width:70%;
		margin:auto;
	}
	div{
		text-align:center;
		padding-bottom:30px;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/inc/chartMenu.jsp"></jsp:include>
	<div id="table">
		<div style="padding:20px 0px 20px 0px; text-align:center;" class="jumbotron">
			<span style="font-size:36px;" class="font-weight-bold">연도별 월 수입내역</span>
		</div>
		<!-- table -->
		<div style="margin-left:35%">
			<div class="form-inline">
				<h4 class="font-weight-bold">연도 검색</h4>
				<input class="form-control" type="text" id="year">
				<span>&nbsp;</span>
				<button id="totalOfInOfMonthByYear" class="btn btn-info" type="button">검색</button>
			</div>
		</div>
		<div>
			<span id="totalOfInOfMonthByYearTableResult"></span>
		</div>
			<!-- chart -->
		<div>
			<div id="newChart">
				<canvas id="chart3"></canvas>
			</div>
		</div>
	</div>	
</body>
<script>
$('#totalOfInOfMonthByYear').click(function(){
	$('#chart3').remove();
	$('#newChart').append('<canvas id="chart3"></canvas>');
	$.ajax({
		url:'/totalOfInOfMonthByYear/'+$('#year').val(),
		type:'get',
		success:function(data){
			console.log(data);
			// 차트 구현 코드
			var ctx = document.getElementById('chart3').getContext('2d');
			var chart = new Chart(ctx, {
				type:'bar', // chart 종류
				data:{
					labels:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], // x축, y축
					datasets:[{
						label:'연도별 월 수입내역',
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

$('#totalOfInOfMonthByYear').click(function(){
	$.ajax({
		url:'/totalOfInOfMonthByYear/'+$('#year').val(),
		type:'get',
		success:function(data){
			console.log(data);
			let html = `
				<table id="table" class="table table-striped table-bordered text-center">
					<tr>
						<th>연도</th>
						<th>1월</th>
						<th>2월</th>
						<th>3월</th>
						<th>4월</th>
						<th>5월</th>
					</tr>
					<tr>
						<td>\${$('#year').val()}</td>
						<td>\${data.january}</td>
						<td>\${data.february}</td>
						<td>\${data.march}</td>
						<td>\${data.april}</td>
						<td>\${data.may}</td>
					</tr>
				</table>
				<br>
				<table id="table" class="table table-striped table-bordered text-center">
				<tr>
					<th>6월</th>
					<th>7월</th>
					<th>8월</th>
					<th>9월</th>
					<th>10월</th>
					<th>11월</th>
					<th>12월</th>
				</tr>
				<tr>
					<td>\${data.june}</td>
					<td>\${data.july}</td>
					<td>\${data.august}</td>
					<td>\${data.september}</td>
					<td>\${data.october}</td>
					<td>\${data.november}</td>
					<td>\${data.december}</td>
				</tr>
			</table>
			`;
			$('#totalOfInOfMonthByYearTableResult').html(html);
		}
	});
});
</script>
</html>