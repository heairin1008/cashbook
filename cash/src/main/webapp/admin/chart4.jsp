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
	#chartTable{
		font-size:65%;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/inc/chartMenu.jsp"></jsp:include>
	<div id="table">
		<div style="padding:20px 0px 20px 0px; text-align:center;" class="jumbotron">
			<span style="font-size:36px;" class="font-weight-bold">연도별 카테고리 지출 내역</span>
		</div>
		<div style="margin-left:35%">
			<div class="form-inline">
				<h4 class="font-weight-bold">연도 검색</h4>
				<input class="form-control" type="text" id="year">
				<span>&nbsp;</span>
				<button id="totalOfCategoryByYear" class="btn btn-info" type="button">검색</button>
			</div>
		</div>
		<div id="chartTable"><span id="totalOfCategoryByYearTableResult"></span></div>
		<div>
			<div id="newChart">
				<canvas id="chart4"></canvas>
			</div>
		</div>
	</div>
</body>
<script>
$('#totalOfCategoryByYear').click(function(){
	$('#chart4').remove();
	$('#newChart').append('<canvas id="chart4"></canvas>');
	$.ajax({
		url:'/totalOfCategoryByYear/'+$('#year').val(),
		type:'get',
		success:function(data){
			console.log(data);
			let polarCtx = $('#chart4');
			let polarChart = new Chart(polarCtx, {
			    data: data,
			    type: 'polarArea',
			    data:{
					labels:['간식','생활','식비','의료'],
					datasets:[{
						backgroundColor:['rgba(255, 99, 132, 0.2)','rgba(54, 162, 235, 0.2)', 'rgba(153, 102, 255, 0.2)', 'rgba(255, 159, 64, 0.2)'], // a는 투명도
						borderColor:['rgba(255, 206, 86, 0.2)','rgba(75, 192, 192, 0.2)', 'rgba(153, 102, 255, 0.2)', 'rgba(255, 159, 64, 0.2)'],
						data:[data.간식, data.생활, data.식비, data.의료] // 데이터
					}]
				},
				options:{}
			});
			
		}
	})
});

$('#totalOfCategoryByYear').click(function(){
	$.ajax({
		url:'/totalOfCategoryByYear/'+$('#year').val(),
		type:'get',
		success:function(data){
			console.log(data);
			let html=`
				<table class="table table-striped table-bordered text-center">
					<tr>
						<th>연도</th>
						<th>간식</th>
						<th>생활</th>
						<th>식비</th>
						<th>의료</th>
					</tr>
					<tr>
						<td>\${$('#year').val()}</td>
						<td>\${data.간식}</td>
						<td>\${data.생활}</td>
						<td>\${data.식비}</td>
						<td>\${data.의료}</td>
					</tr>
				</table>
			`;
			$('#totalOfCategoryByYearTableResult').html(html);
		}
	})
})
</script>
</html>