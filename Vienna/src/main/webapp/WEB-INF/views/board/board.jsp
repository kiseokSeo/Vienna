<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<style>
.table > thead { background-color: #b3c6ff; }
.table > thead > tr > th { text-align: center; }
.table > tbody > tr:hover { background-color: #e6ecff; }
/* .tRow:hover { background-color: #e6ecff; } */
</style>
<script type="text/javascript">
$(document).ready(function(){
	getBoardList();
});
/* sourceTreeTest */
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
			html = "<thead><tr>";
			html += "<th>번호</th>";
			html += "<th>제목</th>";
			html += "<th>작성자</th>";
			html += "<th>내용</th>";
			html += "<th>등록일</th>";
			html += "<th>조회 수</th></tr></thead>";
			html += "<tbody>";
			
			var getData = data.boardList;
			for(idx in getData) {
				html += "<tr class='tRow'>"
				html += "<td>"+(parseInt(idx) + 1)+"</td>"
				html += "<td>"+getData[idx].title+"</td>"
				html += "<td>"+getData[idx].writer+"</td>"
				html += "<td>"+getData[idx].content+"</td>"
				html += "<td>"+getData[idx].regdate+"</td>"
				html += "<td>"+getData[idx].cnt+"</td>"
				
				//$("#boardList tr").html(data);
			}
			html += "</tbody>";
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
	var test = "<"
</script>
<div>Search</div>
<div>
	<label>Title</label>
	<input type="text" id="title" name="title" />
	<label>Content</label>
	<input type="text" id="content" name="content" />
	<label>Writer</label>
	<input type="text" id="writer" name="writer" />
	<input type="button" class="btn btn-primary btn-xs" value="검색" onclick="getBoardList();" />
</div>
<div>Board List</div>
<div style="min-width:1000px; width:70%;">
	<table class="table table-striped table_hover" id=boardList>
	</table>
	<div class="row">
		<div class="col">
			<ul class="pagination">
				<li class="page-item"><a class="page-link" href="#"></a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">4</a></li>
				<li class="page-item"><a class="page-link" href="#">5</a></li>
				<li class="page-item"><a class="page-link" href="#">Next</a></li>
			</ul>
		</div>
	</div>
</div>
<div>
	<input type="button" class="btn btn-primary" value="등록" onclick="location.href='${CONTEXT_PATH}/board/boardRegister'" />
</div>
</body>
</html>