<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<style>
.jumbotron{
	padding-top: 20px;
}
</style>
</head>

<body>
<%@include file="header.jsp" %>
<div class="container">

<div class="col-lg-2"></div>
<div class="col-lg-8">
<div class="jumbotron">

<form action="login.mo" class="form-horizontal" id="loginform">
<div class="form-group text-center">
<h2>로그인</h2>
</div>

<div class="form-group">
<input type="text" class="form-control" name="userId" id="userId" placeholder="아이디 입력" maxlength="20"/>
</div>

<div class="form-group">
<input type="password" name="userPw" id="userPw" class="form-control" placeholder="비밀번호입력" maxlength="20"/>
</div>

<div class="form-group">
<div class="text-center">
<button type="button" class="btn btn-primary btn-lg" id="loginbtn">로그인하기</button>
</div>
</div>
</form>
</div>
</div>
<div class="col-lg-2"></div>
</div>

<script>

var $loginform = $('#loginform');
var $userId = $('#userId');
var $userPw = $('#userPw');


$('#loginbtn').click(function(){
	
	if($userId.val()===null||$userId.val()===""){
		alert('아이디를 입력하세요');
		$userId.focus();
		return false;
	}
	if($userPw.val()===null||$userPw.val()===""){
		alert('비밀번호를 입력하세요');
		$userPw.focus();
		return false;
	}
	
	$.ajax({
		url: 'login.mo',
		type: 'post',
		datatype: 'json',
		data:  'userId='+$userId.val()+'&userPw='+$userPw.val(),
		success: function(result){
			if(result==1){
				alert('로그인 성공')
				location.href="/";
			}else if(result==0){
				alert('아이디와 비밀번호가 일치하지 않습니다.')
			}else if(result==-1){
				alert('존재하지 않는 아이디입니다.')
			}
			
		}
	})
})
 
</script>
</body>
</html>