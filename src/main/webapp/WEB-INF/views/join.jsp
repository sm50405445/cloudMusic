<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<style>
	.jumbotron{
	padding-top: 20px;
	}
</style>
</head>
<body>


<c:import url="header.jsp"/>
	<div class="container">
	
	
	
	<div class="col-md-2"></div>
	
	<div class="col-md-8">
	<div class="jumbotron">
	<h2 class="text-center">회원가입</h2>
	
	
	<form action="insert.mo" id="joinform" class="form-horizontal">

	<div class="row">
		
		<div class="form-group text-center col-xs-9">
		<input type="text" name="userId" placeholder="아이디입력" class="form-control" id="userId"/>
		<input type="hidden" name="userIdCheck" id="idcheckval" class="form-control" />
		</div>
		
		<div class="form-group col-xs-2 col-xs-push-1">
		<button type="button" class="btn btn-primary btn-md" id="idchecked" onclick="idcheckbtn()">아이디체크</button>
		</div>	
		
	</div>
	
		<div class="row">
		<div class="form-group col-xs-4">
		<input type="password" name="userPw" placeholder="비밀번호입력" class="form-control" id="userPw"/>
		</div>
		
		<div class="form-group col-xs-4 col-xs-push-1">
		<input type="password" name="userPwchk" placeholder="비밀번호 확인" class="form-control" id="userPwchk" />
		</div>
		</div>
		
		<div class="row">
		<div class="form-group col-xs-9">
		<input type="text" name="userName" placeholder="이름입력" class="form-control" id="userName"/>
		<div class="col-xs-3"></div>
		</div>
		</div>
		
		<div class="form-group text-center">
		<button type="button" class="btn btn-primary btn-lg col-xs-6 col-xs-push-3" onclick="submitgo();">제출</button>
		</div>
		
	</form>
	</div>
		</div>
	<div class="col-md-2"></div>

	</div>


<script>
var xhr = new XMLHttpRequest();
var joinform = document.getElementById('joinform')
var userId = document.getElementById('userId')
var userPw = document.getElementById('userPw')
var userPwchk = document.getElementById('userPwchk')
var userName = document.getElementById('userName')
var Idcheckval = document.getElementById('idcheckval')

function submitgo(){
	if(userId.value!=Idcheckval.value){
		alert('아이디체크 해주세요')
		userId.focus()
		return false
	}
	

	if(userId.value===null||userId.value===""){
		alert('아이디를 입력하세요')
		userId.focus()
		return false
	}
	if(userPw.value===null||userPw.value===""){
		alert('비밀번호를 입력하세요')
		userPw.focus()
		return false
	}
	if(userName.value===null||userName.value===""){
		alert('이름을 입력하세요')
		userName.focus()
		return false
	}
	
	if(userPw.value!=userPwchk.value){
		alert('비밀번호가 일치하지 않습니다')
		userPw.focus()
		return false
	}
	
	alert('회원가입을 신청합니다.')
	joinform.submit();
}




function idcheckbtn(){

	if(userId.value===null||userId.value===""){
		alert('아이디를 넣어주세요')
		userId.focus()
		return false;
	}
	
	xhr.open("post",'idchecked.mo?userId='+encodeURIComponent(userId.value),true
	)
	xhr.onreadystatechange=idcheckfunc
	xhr.send(null)

	function idcheckfunc(){
		if(xhr.readyState==4 && xhr.status==200){
			
			var result = xhr.responseText
			console.log(result)
			if(result==1){
				alert('중복된 아이디입니다 사용할 수 없습니다.')
				userId.value="";
			}else{
				alert('사용 가능한 아이디입니다.')
				Idcheckval.value=userId.value
				return false
			}
		}
	}
	
		
}



</script>
</body>
</html>