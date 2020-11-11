<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chart1</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script><!-- jQuery -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script><!-- chart.js -->
<script>
$(document).ready(function(){
	$.ajax({
		url:'',
		type:'',
		data:{},
		success:function(data){
			/*
				data(json문자열) -> dataset(chart.js가 원하는 것으로) -> chart
			*/
		}
	});
});
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/inc/chartMenu.jsp"></jsp:include>
	<h1>chart1</h1>
	<!-- chart -->
	<div>
		<canvas id="chart1"></canvas>
	</div>
	<!-- table -->
	<div>
		<table>
		</table>
	</div>
</body>
</html>