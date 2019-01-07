<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>

</script>
<body>
<c:import url="header.jsp"/>
<div class="container">


	<div class="row">
		<h1 class="text-center">게시글 작성</h1>	
	</div>
	
	<form action="insert.bo" id="insertform" method="post">
		
		<div class="form-group">
		<label for="userId" class="control-label">${sessionId }님</label>
		<input type="hidden" class="form-control" value="${sessionId }" id="userId" name="userId"/>
		</div>
		
		
		
		<div class="form-group">
		<label for="title" class="control-label">제목</label>
		<input type="text" name="title" class="form-control" id="title" />
		</div>
		
		<div class="form-group">
		<label for="memo" class="control-label">내용</label>
		<textarea name="memo" id="memo" cols="50" rows="10" class="form-control"></textarea>
		</div>
		
		<div class="form-group">
		<button class="btn btn-primary form-control" onclick="insertfunc()">등록하기</button>
		</div>
		
	</form>
	
	<script>
	function insertfunc(e){
		var insertform = document.getElementById('insertform');
		var userId = document.getElementById('userId');
		var title = document.getElementById('title');
		var memo = document.getElementById('memo');
		
		if(userId.value==null||userId.value==""){
			alert('아이디 입력하세요');
			userId.focus();
			return false;
		}
		if(title.value==null||title.value==""){
			alert('제목을 입력하세요');
			title.focus();
			return false;
		}
		if(memo.value==null||memo.value==""){
			alert('내용을 입력하세요');
			memo.focus();
			return false;
		}

		alert('게시글을 등록합니다')
		insertform.submit()
	}
	</script>
</div>


</body>
</html>