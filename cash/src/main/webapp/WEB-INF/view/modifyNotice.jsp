<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyNotice</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1>공지사항 수정</h1>
	<form method="post" action="/admin/modifyNotice/${notice.noticeId}">
		<table border="1">
			<tr>
				<td>notice_id</td>
				<td><input type="text" name="noticeId" id="noticeId" value="${notice.noticeId}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>notice_title</td>
				<td><input type="text" name="noticeTitle" id="noticeTitle" value="${notice.noticeTitle}"></td>
			</tr>
			<tr>
				<td>notice_content</td>
				<td><textarea rows="5" cols="50" name="noticeContent" id="noticeContent">${notice.noticeContent}</textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit">수정</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>