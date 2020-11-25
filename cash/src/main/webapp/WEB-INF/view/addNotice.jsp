<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addNotice</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#addBtn').click(function(){
			//alert('test');
			let html = '<div><input type="file" name="noticefile" class="noticefile form-control"></div>';
			$('#fileinput').append(html);
		});
		$('#delBtn').click(function(){
			$('#fileinput').children().last().remove();
		});		
		$('#submitBtn').click(function(){
			let ck = true;
			$('.noticefile').each(function(index,item){
				if($(item).val()==''){
					ck=false;
					}
				});
				if(ck==false){
					alert('선택하지 않은 파일이 있습니다.');
				}else{
					$('#fileuploadForm').submit();
				}
		});
	});
</script>
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
		margin-bottom:5px;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div id="table">
		<div style="padding:20px 0px 20px 0px; text-align:center;" class="jumbotron">
			<span style="font-size:36px;" class="font-weight-bold">공지사항 입력</span>
		</div>
		<form id="fileuploadForm" class="form-group" method="post" action="/admin/addNotice" enctype="multipart/form-data">
			<table id="table" class="table text-center">
				<tr>
					<td><span class="font-weight-bold">제목</span></td>
					<td><input class="form-control" type="text" size="48" name="noticeTitle" id="noticeTitle"></td>
				</tr>
				<tr>
					<td><span class="font-weight-bold">내용</span></td>
					<td><textarea class="form-control" rows="5" cols="50" name="noticeContent" id="noticeContent"></textarea></td>
				</tr>
				<tr>
					<td>첨부파일</td>
					<td>
						<div id="fileinput">
							<button class="btn btn-secondary" type="button" id="addBtn">파일추가</button>
							<button class="btn btn-secondary" type="button" id="delBtn">파일삭제</button>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="text-right"><button type="button" id="submitBtn" class="btn btn-success">등록</button></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>