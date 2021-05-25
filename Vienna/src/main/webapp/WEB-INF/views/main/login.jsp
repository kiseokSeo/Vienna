<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<script>
function login() {
	$.ajax({
		type: "POST",
		url: "${CONTEXT_PATH}/main/loginProcess",
		data: {
			id : $("#id").val(),
			pass : $("#pass").val()
		},
		success : function(data, status, xhr){
			console.log("ㅗㅗㅗ");
			console.log(data);
		},
		error: function(xhr, status, error) {
			alert(error);
		}
	});
}
</script>
<body>
	<div>
		<input type="text" id="id" name="id" />
	</div>
	<div>
		<input type="text" id="pass" name="pass"  />
	</div>
	<div>
		<input type="button" value="로그인" onclick="login();" />
	</div>
</body>
</html>