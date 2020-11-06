<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addNotice</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1>공지사항 입력</h1>
	<form method="post" action="/admin/addNotice">
		<table border="1">
			<tr>
				<td>제목 : </td>
				<td><input type="text" name="noticeTitle" id="noticeTitle"></td>
			</tr>
			<tr>
				<td>내용 : </td>
				<td><textarea rows="5" cols="50" name="noticeContent" id="noticeContent"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><button type="submit">등록</button></td>
			</tr>
		</table>
	</form>
</body>
</html>