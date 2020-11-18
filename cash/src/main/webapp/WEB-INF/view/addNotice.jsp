<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addNotice</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
	#table{
		width:70%;
		margin:auto;
	}
	
	#form{
		width:50%;
		margin:auto;
	}
	
	div{
		padding-bottom:30px;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div id="table">
		<div style="padding:20px 0px 20px 0px; text-align:center;" class="jumbotron">
			<span style="font-size:36px;" class="font-weight-bold">공지사항 입력</span>
		</div>
		<form class="form-group" method="post" action="/admin/addNotice">
			<table id="table" class="table table-borderless text-center">
				<tr>
					<td><span class="font-weight-bold">제목</span></td>
					<td><input class="form-control" type="text" size="48" name="noticeTitle" id="noticeTitle"></td>
				</tr>
				<tr>
					<td><span class="font-weight-bold">내용</span></td>
					<td><textarea class="form-control" rows="5" cols="50" name="noticeContent" id="noticeContent"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" class="text-right"><button class="btn btn-success" type="submit">등록</button></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>