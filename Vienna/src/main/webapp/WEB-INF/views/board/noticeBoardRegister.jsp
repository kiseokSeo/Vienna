<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function(){
		$("#noticeBoardInsert").click(function() {
			console.log("1");
			$.ajax({
				type: "POST",
				url: "${CONTEXT_PATH}/notice/noticeInsert",
				data: {
					title : $("#title").val(),
					CBy : $("#CBy").val(),
					contents : $("#contents").val()
				},
				success : function(data){
					alert("등록 성공");
					window.location.href = "${CONTEXT_PATH}/notice/noticeBoard";
				},
				error: function(xhr, status, error) {
					alert(error);
				}
			});
		}); 
	});
</script>
</head>
<body>
<div>
	<h2>게시판 등록</h2>
	<div>
		<label>제목</label>
		<input type="text" id="title" name="title" />
		<label>작성자</label>
		<input type="text" id="CBy" name="Cby" />
		<label>내용</label>
		<input type="text" id="contents" name="contents" />
	</div>
</div>
<div>
	<input type="button" value="취소" onclick="location.href='${CONTEXT_PATH}/board/noticeBoard'" />
	<button id="boardInsert">등록</button>
	<input type="button" value="메인화면으로" onclick="location.href='${CONTEXT_PATH}/main/main'" />
</div>
</body>
</html>