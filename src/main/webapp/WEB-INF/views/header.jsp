<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>  
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css" media="all" />



<script>
	var xhr = new XMLHttpRequest();

	function logoutfunc() {
		xhr.open("post", "logout.mo", true)
		xhr.onreadystatechange = logoutOkfun
		xhr.send(null)
	}

	function logoutOkfun() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var result = xhr.responseText
			console.log(result)
			if (result == 1) {
				alert('로그아웃합니다')
				location.href = "/";
			}
		}
	}
</script>

<c:set value="${sessionScope.sessionId}" var="sessionId"/>
<c:set value="${sessionScope.IdArr}" var="IdArr"/>

<c:choose>
	<c:when test="${sessionId!=null}">
	
<nav class="nav navbar-default">
	<div class="navbar-header">
		<button class="navbar-toggle" data-toggle="collapse"
			data-target="#menu1">
			<span class="sr-only">Toggle-navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a href="/" class="navbar-brand">Home</a>
	</div>

	<div class="collapse navbar-collapse" id="menu1">
		<ul class="nav navbar-nav">
			<li><a href="boardInsert">글쓰기</a></li>
			<li><a href="boardpersonalUpdate.bo?userId=${sessionId}">본인글보기</a></li>
			<li><a href="boardList.bo">게시판</a></li>
			<li><a href="fileform">파일업로드</a></li>
			<li><a href="musicList.ca">음원구매</a></li>
			<li class="center-block">
				<button type="button" class="btn btn-primary" data-toggle="modal"
					data-target="#myInfo" id="infobtn">내정보</button>
			</li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<c:if test="${pageContext.request.servletPath == '/WEB-INF/views/index.jsp'}">
			<li><audio id="mainaudio" src="" controls="" controlsList="nodownload">
			</audio></li>
		</c:if>
			<li><button type="button" class="btn btn-default"
					onclick="logoutfunc()">로그아웃</button></li>
			<li><a href="cartSearch.ca" class="glyphicon glyphicon-shopping-cart"></a></li>
		</ul>
	</div>
</nav>
	</c:when>
	<c:otherwise>
	
<nav class="nav navbar-default">

	<div class="navbar-header">
		<button class="navbar-toggle" data-toggle="collapse"
			data-target="#menu2">
			<span class="sr-only">Toggle-nav</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a href="/" class="navbar-brand">HOME</a>
	</div>

	<div class="collapse navbar-collapse" id="menu2">
		<ul class="nav navbar-nav">
			<li><a href="join">회원가입</a></li>
			<li><a href="login">로그인</a></li>
			<li><a href="boardList.bo">게시판</a></li>
		</ul>

		<ul class="nav navbar-nav navbar-right">
		<c:if test="${pageContext.request.servletPath == '/WEB-INF/views/index.jsp'}">
			<li><audio id="mainaudio" src="" controls="" controlsList="nodownload" >
			</audio></li>
		</c:if>

		</ul>
	</div>

</nav>
	</c:otherwise>
</c:choose>


<div class="modal fade" id="myInfo" tabindex="-1" role="dialog"
	aria-labelledby="InfoLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="InfoLabel">아이디, 비밀번호 입력</h4>
			</div>
			<div class="modal-body">
				<form action="memberInfo.mo" method="post" id="infoform">
					<div class="form-group">
						<label for="InfoId" class="control-label">아이디 입력</label> <input
							type="text" name="InfoId" class="form-control" id="InfoId"
							value="${sessionId}" readonly="readonly" />
					</div>
					<div class="form-group">
						<label for="InfoPw" class="control-label">비밀번호 입력</label> <input
							type="password" name="InfoPw" id="InfoPw" class="form-control" />
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal" id="closebtn">닫기</button>
				<button type="button" class="btn btn-primary" id="submitbtn">제출</button>
			</div>
		</div>
	</div>
</div>

<script>
	$('#submitbtn').click(function(){
		
		var $InfoId = $('#InfoId');
		var $InfoPw = $('#InfoPw');
		
		if($InfoId.val()===null||$InfoId.val()===""){
			alert('아이디를 입력하세요');
			$InfoId.focus();
			return false;
		}
		if($InfoPw.val()===null||$InfoPw.val()===""){
			alert('비밀번호를 입력하세요');
			$InfoPw.focus();
			return false;
		}
		
		$.ajax({
			url: 'Infochk.mo',
			type: 'post',
			datatype: 'json',
			data: 'InfoId='+$InfoId.val()+'&InfoPw='+$InfoPw.val(),
			success: function(result){
				if(result==1){
					alert('회원을 조회합니다.');
					location.href="memberInfo.mo?InfoId="+$InfoId.val()+"&InfoPw="+$InfoPw.val();
				}else{
					alert('회원정보가 일치하지 않습니다.')
					location.href="/";
				}
			}
		}) 
		
	})
	
</script>

