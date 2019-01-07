<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<style>
.yes{
	color:#0f0;
}
.no{
	color:#f00;
}
</style>
</head>
<body>
<c:import url="header.jsp"/>

	<div class="container">
	

	<div class="row">
		<h1 class="text-center">개인정보 수정</h1>	
	</div>
	
	<form action="memberUpdate.mo" id="updateform">
		
		<div class="form-group">
		<label for="userId" class="control-label">${sessionId}님</label>
		<input type="hidden" name="userId" value="${sessionId}" class="form-control" id="userId"/>
		</div>
		
		<div class="form-group">
		<label for="userPw" class="control-label">비밀번호</label>
		<input type="password" name="userPw" class="form-control" id="userPw" />
		<input type="password" name="userPwCheck" id="userPwchk" class="form-control" onkeyup="pwcheckfun()" />
		</div>
		<span id="checktxt"></span>
		
		<div class="form-group">
		<label for="userName" class="control-label">이름</label>
		<input type="text" class="form-control" name="userName" id="userName" />
		</div>
		
		<div class="form-group">
		<button class="btn btn-primary form-control" onclick="updatefunc()">수정하기</button>
		</div>
		
	</form>
	
	<script>
	function updatefunc(){
		var updateform = document.getElementById('updateform')
		var userId = document.getElementById('userId')
		var userPw = document.getElementById('userPw')
		var userName = document.getElementById('userName')
		
		if(userId.value==null||userId.value==""){
			alert('아이디를 입력하세요')
			userId.focus()
			return false
		}
		if(userPw.value==null||userPw.value==""){
			alert('비밀번호를 입력하세요')
			userPw.focus()
			return false
		}
		if(userName.value==null||userName.value==""){
			alert('이름을 입력하세요')
			userName.focus()
			return false
		}
		
		alert('개인정보를 수정합니다')
		updateform.submit()
	}
	</script>
	<script>
	function pwcheckfun(){
		var userPw = document.getElementById('userPw')
		var userPwchk = document.getElementById('userPwchk')
		var pwchktext = document.getElementById('checktxt')
		
		if(userPw.value!=userPwchk.value){
			pwchktext.innerHTML="비밀번호가 다릅니다 확인해주세요"
			pwchktext.style.color="#f00";
			return true;
		}else{
			pwchktext.innerHTML="비밀번호가 일치합니다."
			pwchktext.style.color="#00f";
			return false;
		}
	}
	</script>
</div>
	
</body>
</html>