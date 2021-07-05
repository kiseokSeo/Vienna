<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<style>
        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 30%; /* Could be more or less, depending on screen size */                          
        }
 
</style>
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
function getIdPop() {
   $('#setPass').show();
}
function setPassPop() {
   $('#myModal').show();
}

//팝업 Close 기능
function close_pop(flag) {
     $('#myModal').hide();
     $('#setPass').hide();
};
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
		<input type="button" value="ID 찾기" onclick="getIdPop();" />
		<input type="button" value="비밀번호 찾기" onclick="setPassPop();" />
	</div>
	<div id="myModal" class="modal">
	     <!-- Modal content -->
		<div class="modal-content">
			<p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">공지</span></b></span></p>
			<div align="left">
				<label>사용자 이름 : </label>
				<input type="text" id="memName" name="memName" style="padding-left:3px" />
			</div>
			<div align="left">
				<label>그냥 넣어봄 : </label>
				<input type="text" id="memName" name="memName" style="padding-left:3px" />
			</div>
			<p><br /></p>
			<div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop();">
				<span class="pop_bt" style="font-size: 13pt;" >닫기</span>
			</div>
		</div>
	</div>
	<div id="setPass" class="modal">
	     <!-- Modal content -->
		<div class="modal-content">
			<p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">공지</span></b></span></p>
			<p style="text-align: center; line-height: 1.5;"><br />여기에 내용ㅗ</p>
			<p><br /></p>
			<div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop();">
				<span class="pop_bt" style="font-size: 13pt;" >닫기</span>
			</div>
		</div>
	</div>
</body>
</html>