<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addMember</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script><!-- jQuery -->
<script>
$(document).ready(function(){
	$('#id').focus();
	$('#id').blur(function(){
		// 비동기 요청으로 #'id'값을 서버에 보내고 이 아이디값이 중복인지 아닌지
		if($('#id').val() == ''){
			$('#id').focus();
			return;	
		}
		$.ajax({
			url:'/admin/idCheck',
			type:'post',
			data:{id:$('#id').val()},
			success:function(data){ // data가 yes -> 사용가능 / data가 no -> 사용불가능
				if(data == 'yes'){
					alert($('#id').val() + '는 사용가능한 ID입니다.');
					$('#pw').focus();
				}else{
					alert($('#id').val() + '는 사용중인 ID입니다.');
					$('#id').select();
					$('#id').focus();
				}
			}
		});
		
	});
});
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1>addMember</h1>
	<form method="post" action="/admin/addMember">
		<table>
			<tr>
				<td>ID</td>
				<td><input type="text" id="id" name="id"></td>
			</tr>
			<tr>
				<td>PW</td>
				<td><input type="password" id="pw" name="pw"></td>
			</tr>
			<tr>
				<td colspan="2"><button type="submit" id="addMember">addMember</button></td>
			</tr>
		</table>
		
	</form>
</body>
</html>