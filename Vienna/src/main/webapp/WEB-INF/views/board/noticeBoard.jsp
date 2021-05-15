<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<script type="text/javascript">
$(document).ready(function(){
	getNoticeList();
});
/* sourceTreeTest */
function getNoticeList() {
	$.ajax({
		type: "POST",
		url: "${CONTEXT_PATH}/notice/noticeList",
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
			
			
			var getData = data.noticeList;
			for(idx in getData) {
				html += "<tr>"
				html += "<td>"+(parseInt(idx) + 1)+"</td>"
				html += "<td>"+getData[idx].type+"</td>"
				html += "<td>"+getData[idx].title+"</td>"
				html += "<td>"+getData[idx].contents+"</td>"
				html += "<td>"+getData[idx].cnt+"</td>"
				html += "<td>"+getData[idx].CBy+"</td>"
				html += "<td>"+getData[idx].Rdate+"</td>"
				
				
				//$("#boardList tr").html(data);
				}
			
			$("#noticeList").html(html);
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
	<label>Title</label>
	<input type="text" id="title" name="title" />
	<label>Content</label>
	<input type="text" id="contents" name="contents" />
	<label>Writer</label>
	<input type="text" id="createBy" name="createBy" />
	<input type="button" value="검색" onclick="getNoticeList();" />
</div>
<div>Board List</div>
<table border="1" id=noticeList>

</table>
<div>
	<input type="button" value="등록" onclick="location.href='${CONTEXT_PATH}/notice/noticeBoardRegister'" />
</div>
</body>
</html>