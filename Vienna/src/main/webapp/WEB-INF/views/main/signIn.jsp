<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
	#content_user {
		min-width: 600px;
		width: 50%;
	}
	.text_row {
		width: 100%;
		height: 40px;
		min-width: 480px;
		/* vertical-align: top; */
		display:inline-block;
	}
	.title {
		width:20%;
		min-width:100px;
		height:30px;
		display:inline-block;
	}
	.title_font {
		backgound-color: blue;
	}
	.text_content {
		width:78%;
		min-width:380px;
		height:30px;
		display:inline-block;
	}
	.text_phone {
		width:50px;
	}
</style>
<title>SignIn</title>
</head>
<body>
	<div>
		<h2>SignIn</h2>
	</div>
	<form action="/main/insertMember">
		<input type="hidden" id="id_flag" value="">
		<div id="content_user" align="left">
			<div class="text_row">
				<div class="title">
					<label class="title_font">ID</label>
				</div>
				<div class="text_content">
					<input type="text" id="id" name="id" placeholder="ID" />
					<input type="button" onclick="idCheck()" value="ID 중복체크" >
				</div>
			</div>
			<div class="text_row">
				<div class="title">
					<label class="title_font">Pass</label>
				</div>
				<div class="text_content">
					<input type="password" id="pass" name="pass" placeholder="Password"/>
				</div>
			</div>
			<div class="text_row">
				<div class="title">
					<label class="title_font">Pass Check</label>
				</div>
				<div class="text_content">
					<input type="password" id="pass2" placeholder="Password"/>
				</div>
			</div>
			<div class="text_row">
				<div class="title">
					<label class="title_font">name</label>
				</div>
				<div class="text_content">
					<input type="text" id="memName" name="memName" placeholder="name"/>
				</div>
			</div>
			<div class="text_row">
				<div class="title">
					<label class="title_font">Address</label>
				</div>
				<div class="text_content">
				   <input id="member_post"  type="text" placeholder="Zip Code" readonly onclick="findAddr()">
				   <input id="address" name="address" type="text" placeholder="Address" readonly> <br>
				</div>
			</div>
			<div class="text_row">
				<div class="title">
					<label class="title_font">Detail Address</label>
				</div>
				<div class="text_content">
					<input type="text" id="address2" name="address2" placeholder="Detailed Address">
				</div>
			</div>
			<div class="text_row">
				<div class="title">
					<label class="title_font">gender</label>
				</div>
				<div class="text_content">
					<input type="radio" name="gender" value="" style="display:none;"/>
					<input type="radio" name="gender" value="male"/>남성
					<input type="radio" name="gender" value="female"/>여성
				</div>
			</div>
			<div class="text_row">
				<div class="title">
					<label class="title_font">E-Mail</label>
				</div>
				<div class="text_content">
					<input type="text" id="email" name="email" />
				</div>
			</div>
			<div class="text_row">
				<div class="title">
					<label class="title_font">phone</label>
				</div>
				<div class="text_content">
					<select id="phone1" name="phone1">
						<option value="">selected</option>
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="019">019</option>
					</select>
					<label>-</label>
					<input type="text" id="phone2" name="phone2" class="text_phone" onKeyup="checkNum(this);" maxlength="4" />
					<label>-</label>
					<input type="text" id="phone3" name="phone3" class="text_phone" onkeydown="hange(this);" onKeypress="checkNum(this);" maxlength="4" />
				</div>
			</div>
			<div class="text_row">
				<div class="title">
					<label class="title_font">Like</label>
				</div>
				<div class="text_content">
					<input type="checkbox" value="" name="fruit" style="display:none"/>
					<label>사과</label>
					<input type="checkbox" value="apple"     name="fruit" />
					<label>바나나</label>
					<input type="checkbox" value="banana"    name="fruit" />
					<label>딸기</label>
					<input type="checkbox" value="strawberry" name="fruit" />
					<label>멜론</label>
					<input type="checkbox" value="melon"     name="fruit" />
				</div>
			</div>
			<div class="text_row">
				<div class="title">
					<label class="title_font">comment</label>
				</div>
				<div class="text_content">
					<textarea placeholder="comment"></textarea>
				</div>
			</div>
			<div class="bottom">
				<input type="button" onclick="go_submit()" value="등록">
			</div>
		</div>
	</form>
</body>
<table>
	<tr>
		<th>
	<tr>
		<td>
</table>



<script>
var checkFlg;
var id, idCheck, pass, pass2, memName, gender, email, phone1, phone2, phone3, address, address2, fruit;

$(document).ready(function(){
	
});

function checkNum(obj) {
   obj.value = obj.value.replace(/[^0-9]/g,'');
}


function hange(obj){
    obj.value = obj.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
}

function findAddr(){
	new daum.Postcode({
        oncomplete: function(data) {
        	
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var jibunAddr = data.jibunAddress; // 지번 주소 변수
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('member_post').value = data.zonecode;
            if(roadAddr !== ''){
                document.getElementById("address").value = roadAddr;
            } 
            else if(jibunAddr !== ''){
                document.getElementById("address").value = jibunAddr;
            }
        }
    }).open();
}
function validation() {
   getValue();
   checkFlg = "Y";
   
   if(id == "") {alert("ID를 입력해 주세요"); $("#id").focus(); checkFlg = "N"; return false; };
   if(idCheck == "" || idCheck.value == "N") {alert("ID 중복 검사를 해주세요"); $("#id").focus(); checkFlg = "N"; return false; };
   if(pass == "") {alert("Password를 입력해 주세요"); $("#pass").focus(); checkFlg = "N"; return false; };
   if(pass2 == "") {alert("Password를 확인해 주세요"); $("#pass2").focus(); checkFlg = "N"; return false; };
   if(pass !== pass2) {alert("Password가 다릅니다."); $("#pass2").focus(); checkFlg = "N"; return false; };
   
   if(memName == "") {alert("이름을 입력해 주세요"); $("#memName").focus(); checkFlg = "N"; return false; };
   //if(gender == "") {alert("성별을 선택해 주세요"); return; };
   if(email == "") {alert("E-Mail을 입력해 주세요"); $("#email").focus(); checkFlg = "N"; return false; };
   if(phone1 == "") {alert("앞번호를 선택해 주세요"); $("#phone1").focus(); checkFlg = "N"; return false; };
   if(phone2 == "") {alert("중간자리를 입력해 주세요"); $("#phone2").focus(); checkFlg = "N"; return false; };
   if(phone3 == "") {alert("끝자리를 입력해 주세요"); $("#phone3").focus(); checkFlg = "N"; return false; };
   //if(fruit == "") {alert("좋아하는것을 선택해 주세요"); return; };
   
   //if(email == checkEmail) { alert(); $("#email").focus(); return; };
   return true;
}

function go_submit() {
   if(validation() == false) {return;}
   console.log();
   //if(checkFlg == "N") { return; }

   $.ajax({
		type: "POST",
		url: "${CONTEXT_PATH}/main/insertMember",
		data: {
			id : id,
		   pass : pass,
		   memName : memName,
		   email : email,
		   address : address,
		   address2 : address2,
		   phone : phone1,
		   phone2 : phone2,
		   phone3 : phone3
		},
		success : function(data){
		   console.log(data);
		   alert("가입되었습니다.");
		   //window.location.href = "${CONTEXT_PATH}/main/main";
		},
		error: function(xhr, status, error) {
			alert(error); 
		}
	});
}

function getValue() {
   id=$("#id").val();
   idCheck=$("#id_flag").val();
   pass=$("#pass").val();
   pass2=$("#pass2").val();
   memName=$("#memName").val();
   gender=$("input[name=gender]").val();
   email=$("#email").val();
   phone1=$("#phone1").val();
   phone2=$("#phone2").val();
   phone3=$("#phone3").val();
   address=$("#address").val();
   address2=$("#address2").val();
   fruit=$("input[name=fruit]").val();
}
function idCheck() {
   if($("#id").val() == '') {
      alert("id를 입력해 주세요."); return;
   }

   $.ajax({
		type: "POST",
		url: "${CONTEXT_PATH}/main/idCheck",
		data: {
			id : $("#id").val()
		},
		success : function(data){
			if(data.idChecked == 1) {
			   $("#id_flag").val("N");
			   alert("사용중인 ID 입니다.");
			   $("#id").focus();
			} else {
			   $("#id_flag").val("Y");
			   alert("사용 가능한 ID 입니다.");
			}
		},
		error: function(xhr, status, error) {
			alert(error);
		}
	});
}
</script>
</html>