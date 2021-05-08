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
	getBoardList();
});

function getBoardList() {
	$.ajax({
		type: "POST",
		url: "${CONTEXT_PATH}/board/boardList",
		data: {
			title : $("#title").val(),
			writer : $("#writer").val(),
			content : $("#content").val()
		},
		success : function(data, status, xhr){
			var html = "";
			html = "<tr>";
			html += "<th>번호</th>";
			html += "<th>제목</th>";
			html += "<th>작성자</th>";
			html += "<th>내용</th>";
			html += "<th>등록일</th>";
			html += "<th>조회 수</th></tr>";
			
			var getData = data.boardList;
			for(idx in getData) {
				html += "<tr>"
				html += "<td>"+(parseInt(idx) + 1)+"</td>"
				html += "<td>"+getData[idx].title+"</td>"
				html += "<td>"+getData[idx].writer+"</td>"
				html += "<td>"+getData[idx].content+"</td>"
				html += "<td>"+getData[idx].regdate+"</td>"
				html += "<td>"+getData[idx].cnt+"</td>"
				
				//$("#boardList tr").html(data);
				//좆같은 깃허브
			}
			
			$("#boardList").html(html);
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
	<input type="text" id="content" name="content" />
	<label>Writer</label>
	<input type="text" id="writer" name="writer" />
	<input type="button" value="검색" onclick="getBoardList();" />
</div>
<div>Board List</div>
<table border="1" id=boardList>
	<%-- <c:forEach var="item" items="${boardList}">
		<tr id="boardList">
			<td>${item.seq}</td>
			<td>${item.title}</td>
			<td>${item.writer}</td>
			<td>${item.content}</td>
			<td>${item.regdate}</td>
			<td>${item.cnt}</td>
		</tr>
	</c:forEach> --%>
</table>
<div>
	<input type="button" value="등록" onclick="location.href='${CONTEXT_PATH}/board/boardRegister'" />
</div>
</body>
</html>