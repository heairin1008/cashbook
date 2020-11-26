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
	#newChart{
		width:60%;
		margin:auto;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/inc/chartMenu.jsp"></jsp:include>
	<div id="table">
		<div style="padding:20px 0px 20px 0px; text-align:center;" class="jumbotron">
			<span style="font-size:36px;" class="font-weight-bold">카테고리별 연간 수입 내역</span>
		</div>
		<div style="margin-left:35%">
			<div class="form-inline">
				<h4 class="font-weight-bold">연도 검색</h4>
				<input class="form-control" type="text" id="year">
				<span>&nbsp;</span>
				<button id="totalOfInCategoryByYear" class="btn btn-info" type="button">검색</button>
			</div>
		</div>
		<div><span id="totalOfInCategoryByYearTableResult"></span></div>
		<div>
			<div id="newChart">
				<canvas id="chart5"></canvas>
			</div>
		</div>
	</div>
</body>
<script>
//페이지 클릭 후 바로 보이는 차트 / 테이블 default값 = 2020
$('#chart5').remove();
	$('#newChart').append('<canvas id="chart5"></canvas>');
	$.ajax({
		url:'${pageContext.request.contextPath}/totalOfInCategoryByYear/'+2020,
		type:'get',
		success:function(data){
			console.log(data);
			let polarCtx = $('#chart5');
			let polarChart = new Chart(polarCtx, {
			    data: data,
			    type: 'polarArea',
			    data:{
					labels:['월급','용돈'],
					datasets:[{
						backgroundColor:['rgba(255, 99, 132, 0.2)','rgba(54, 162, 235, 0.2)'], // a는 투명도
						data:[data.월급, data.용돈] // 데이터
					}]
				},
				options:{}
			});
			
		}
	})

$.ajax({
		url:'${pageContext.request.contextPath}/totalOfInCategoryByYear/'+2020,
		type:'get',
		success:function(data){
			console.log(data);
			let html=`
				<table id="table" class="table table-striped table-bordered text-center">
					<tr>
						<th>연도</th>
						<th>월급</th>
						<th>용돈</th>
					</tr>
					<tr>
						<td>2020</td>
						<td>\${data.월급}</td>
						<td>\${data.용돈}</td>
					</tr>
				</table>
			`;
			$('#totalOfInCategoryByYearTableResult').html(html);
		}
	})
// 값 입력 후 버튼 클릭 시 보이는 차트 / 테이블
$('#totalOfInCategoryByYear').click(function(){
	$('#chart5').remove();
	$('#newChart').append('<canvas id="chart5"></canvas>');
	$.ajax({
		url:'${pageContext.request.contextPath}/totalOfInCategoryByYear/'+$('#year').val(),
		type:'get',
		success:function(data){
			console.log(data);
			let polarCtx = $('#chart5');
			let polarChart = new Chart(polarCtx, {
			    data: data,
			    type: 'polarArea',
			    data:{
					labels:['월급','용돈'],
					datasets:[{
						backgroundColor:['rgba(255, 99, 132, 0.2)','rgba(54, 162, 235, 0.2)'], // a는 투명도
						data:[data.월급, data.용돈] // 데이터
					}]
				},
				options:{}
			});
			
		}
	})
});

$('#totalOfInCategoryByYear').click(function(){
	$.ajax({
		url:'${pageContext.request.contextPath}/totalOfInCategoryByYear/'+$('#year').val(),
		type:'get',
		success:function(data){
			console.log(data);
			let html=`
				<table id="table" class="table table-striped table-bordered text-center">
					<tr>
						<th>연도</th>
						<th>월급</th>
						<th>용돈</th>
					</tr>
					<tr>
						<td>\${$('#year').val()}</td>
						<td>\${data.월급}</td>
						<td>\${data.용돈}</td>
					</tr>
				</table>
			`;
			$('#totalOfInCategoryByYearTableResult').html(html);
		}
	})
})
</script>
</html>