<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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
		width:10%;
		min-width:100px;
		height:30px;
		display:inline-block;
	}
	.title_font {
		backgound-color: blue;
	}
	.text_content {
		width:88%;
		min-width:380px;
		height:30px;
		display:inline-block;
	}
	.text_phone {
		width:50px;
	}
</style>
<title>Main</title>
</head>
<body>
<form name="joinform">
<div>
	<h2>Main</h2>
</div>
<div id="content_user">
	<div align="left">
		<div class="text_row">
			<div class="title">
				<label class="title_font">ID</label>
			</div>
			<div class="text_content">
				<input type="text" id="id" name="id" placeholder="아이디" />
			</div>
		</div>
		<div class="text_row">
			<div class="title">
				<label class="title_font">Pass</label>
			</div>
			<div class="text_content">
				<input type="password" id="pass" name="pass" placeholder="영문자+숫자+특수문자조합"/>
			</div>
		</div>
		<div class="text_row">
			<div class="title">
				<label class="title_font">name</label>
			</div>
			<div class="text_content">
				<input type="text" id="name" name="name" placeholder="이름"/>
			</div>
		</div>
		<div class="text_row">
			<div class="title">
				<label class="title_font">gender</label>
			</div>
			<div class="text_content">
				<input type="radio" name="gender" id="male"/>남성
				<input type="radio" name="gender" id="female"/>여성
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
				<input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" 
								class="text_phone" id="phone2" name="phone2" />
				<label>-</label>
				<input type="text"  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" 
								class="text_phone" id="phone3" name="phone3" />
			</div>
		</div>
		<div class="text_row">
			<div class="title">
				<label class="title_font">Like</label>
			</div>
			<div class="text_content">
				<label>Select All</label>
				<input type='checkbox'  id = "selectall" name='fruit'  value='selectall' onclick='selectAll(this)'/> 
				<label>사과</label>
				<input type="checkbox" id="apple"     name="fruit" />
				<label>바나나</label>
				<input type="checkbox" id="banana"    name="fruit" />
				<label>딸기</label>
				<input type="checkbox" id="strawberry" name="fruit" />
				<label>멜론</label>
				<input type="checkbox" id="melon"     name="fruit" />
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
	</div>
</div>
  <button type="button" onclick="joinform_check();">가입하기</button>
  </form>
</body>
<script>
	$(document).ready(function() {
		console.log("${CONTEXT_PATH}");
	});
	
	function selectAll(selectAll)  {
	   const checkboxes 
	        = document.getElementsByName('fruit');
	   
	   checkboxes.forEach((checkbox) => {
	     checkbox.checked = selectAll.checked;
	   })
	 }
	
	function joinform_check() {
	   var id = document.getElementById("id");
	   var pwd = document.getElementById("pass");
	   var name = document.getElementById("name");
	   var female = document.getElementById("female");
	   var male = document.getElementById("male");
	   var phone2 = document.getElementById("phone2");
	   var phone3 = document.getElementById("phone3");
	   var email = document.getElementById("email");

	   if (id.value == "") { //해당 입력값이 없을 경우 같은말: if(!uid.value)
	      alert("아이디를 입력하세요.");
	      id.focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
	      return false;
	}
	   if (pass.value == "") {
	      alert("비밀번호를 입력하세요.");
	      pass.focus();
	      return false;
	  };
	  
	  //비밀번호 영문자+숫자+특수조합(8~25자리 입력) 정규식
	  var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;

	  if (!pwdCheck.test(pass.value)) {
	    alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
	    pass.focus();
	    return false;
	  };
	  
	  
	  if (name.value == "") {
	     alert("이름을 입력하세요.");
	     name.focus();
	     return false;
	  };
	   if (!female.checked && !male.checked) { //둘다 미체크시
	     alert("성별을 선택해 주세요.");
	     return false;
	  };  
	     
	  if (email.value == "") {
	     alert("이메일 주소를 입력하세요.");
	     email.focus();
	     return false;
	   }
	  
	  var reg = /^[0-9]+/g; //숫자만 입력하는 정규식

	  if (phone2.value == "" || phone3.value == "") {
	     alert("전화번호를 입력하세요.");
	     phone2.focus();
	     return false;
	   }
	 
	  if (!reg.test(phone2.value && phone3.value)) {
	    alert("전화번호는 숫자만 입력할 수 있습니다.");
	    phone2.focus();
	    return false;
	  }
	  
	  document.joinform.submit();
	}
</script>
</html>