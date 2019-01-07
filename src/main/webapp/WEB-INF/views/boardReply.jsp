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

<c:choose>
	<c:when test="${sessionId!=null }">
	<div class="row">
		<h1 class="text-center">댓글 작성</h1>	
	</div>
	
	<form action="boardReply.bo" id="Replyform" method="post">
		
		<input type="hidden" name="bId" value="${bId}" />
		<input type="hidden" name="Bgroup" value="${bgroup}" />
		<input type="hidden" name="bIndent" value="${bIndent}" />
		<input type="hidden" name="bStep" value="${bStep}" />
		
		<div class="form-group">
		<label for="userId" class="control-label">${userId}님</label>
		<input type="hidden" name="userId" class="form-control" id="userId" value="${userId}"/>
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
		
		<button class="btn btn-primary form-control" onclick="Replyfunc()">등록하기</button>
		
		</div>
	</form>
	</c:when>
	<c:otherwise>
	<script>
		alert('로그인 하세요!');
		location.href="login";
	</script>
	</c:otherwise>
</c:choose>

	<script>
	function Replyfunc(){
		var Replyform = document.getElementById('Replyform')
		var userId = document.getElementById('userId')
		var title = document.getElementById('title')
		var memo = document.getElementById('memo')
		
		if(userId.value==null||userId.value==""){
			alert('아이디를 입력하세요')
			userId.focus()
			return false
		}
		if(title.value==null||title.value==""){
			alert('제목을 입력하세요')
			title.focus()
			return false
		}
		if(memo.value==null||memo.value==""){
			alert('내용을 입력하세요')
			memo.focus()
			return false
		}
		
		alert('댓글을 등록합니다')
		Replyform.submit()
	}
	</script>
</div>


</body>
</html>