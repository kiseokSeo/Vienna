<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A</title>
<script type="text/javascript">
$(document).ready(function(){
	getQnaList();
});
/* sourceTreeTest */
function getQnaList() {
	$.ajax({
		type: "POST",
		url: "${CONTEXT_PATH}/qna/qnaList",
		data: {
			title : $("#title").val(),
			createBy : $("#createBy").val(),
			contents : $("#contents").val()
		},
		success : function(data, status, xhr){
			var html = "";
			html = "<tr>";
			html += "<th>게시판코드</th>";
			html += "<th>게시판 구분</th>";
			html += "<th>제  목</th>";
			html += "<th>내  용</th>";
			html += "<th>조회수</th>";
			html += "<th>등록자</th>";
			html += "<th>수정일</th>";
			
			
			var getData = data.qnaList;
			for(idx in getData) {
				html += "<tr>"
				html += "<td>"+(parseInt(idx) + 1)+"</td>"
				html += "<td>"+getData[idx].type+"</td>"
				html += "<td>"+getData[idx].title+"</td>"
				html += "<td>"+getData[idx].contents+"</td>"
				html += "<td>"+getData[idx].cnt+"</td>"
				html += "<td>"+getData[idx].cby+"</td>"
				html += "<td>"+getData[idx].rdate+"</td>"
				
				
				//$("#boardList tr").html(data);
				}
			
			$("#qnaList").html(html);
		},
		error: function(xhr, status, error) {
			alert(error);
		}
	});
}

</script>
</head>
<body>
<script>
	
</script>
<div>Search</div>
<div>
	<label>제목</label>
	<input type="text" id="title" name="title" />
	<label>내용</label>
	<input type="text" id="contents" name="contents" />
	<label>작성자</label>
	<input type="text" id="createBy" name="createBy" />
	<input type="button" value="검색" onclick="getQnaList();" />
</div>
<div>QnA List</div>
<table border="1" id=qnaList>

</table>
<div>
	<input type="button" value="등록" onclick="location.href='${CONTEXT_PATH}/qna/qnaBoardRegister'" />
</div>
</body>
</html>