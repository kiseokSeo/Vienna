<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	Main Test
</div>
<div>
	<input type="button" value="게시판" onclick="location.href='${CONTEXT_PATH}/board/board'" />
	<input type="button" value="공지사항" onclick="location.href='${CONTEXT_PATH}/notice/noticeBoard'" />
</div>
</body>
</html>