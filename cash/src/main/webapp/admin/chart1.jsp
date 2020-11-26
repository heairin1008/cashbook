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
			<span style="font-size:36px;" class="font-weight-bold">연도별 수입 / 지출</span>
		</div>
		<div style="margin-left:35%">
			<div class="form-inline">
				<h4 class="font-weight-bold">연도 검색</h4>
				<input class="form-control" type="text" id="year">
				<span>&nbsp;</span>
				<button id="totalOutAndInByYear" class="btn btn-info" type="button">검색</button>
			</div>
		</div>
		<!-- 테이블 보여지는 부분 -->
		<div>
			<span id="totalOfMonthByYearTableResult"></span>
		</div>
			<!-- chart 보여지는 부분 -->
		<div>
			<!-- 차트 중복을 막기 위한 삭제 아이디 -->
			<div id="newChart">
				<canvas id="chart1"></canvas>
			</div>
		</div>
	</div>	
</body>
<script>
//페이지 클릭 후 바로 보이는 차트 / 테이블 default값 = 2020
$('#chart1').remove();
$('#newChart').append('<canvas id="chart1"></canvas>');
$.ajax({
	url:'${pageContext.request.contextPath}/totalOutAndInByYear/'+2020,
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

$.ajax({
	url:'${pageContext.request.contextPath}/totalOutAndInByYear/'+2020,
	type:'get',
	success:function(data){
		console.log(data);
		let html = `
			<table id="table" class="table table-striped table-bordered text-center">
				<tr>
					<th>연도</th>
					<th>수입</th>
					<th>지출</th>
				</tr>
				<tr>
					<td>2020</td>
					<td>\${data.수입}</td>
					<td>\${data.지출}</td>
				</tr>
			</table>
		`;
		$('#totalOfMonthByYearTableResult').html(html);
	}
});

// 연도 값을 넣고 버튼을 클릭했을 때 나오는 차트 / 테이블
$('#totalOutAndInByYear').click(function(){
	$('#chart1').remove();
	$('#newChart').append('<canvas id="chart1"></canvas>');
	$.ajax({
		url:'${pageContext.request.contextPath}/totalOutAndInByYear/'+$('#year').val(),
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

$('#totalOutAndInByYear').click(function(){
	// $('#totalOfMonthByYearTableResult').html('totalOfMonthByYearTableResult');
	$.ajax({
		url:'${pageContext.request.contextPath}/totalOutAndInByYear/'+$('#year').val(),
		type:'get',
		success:function(data){
			console.log(data);
			let html = `
				<table id="table" class="table table-striped table-bordered text-center">
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