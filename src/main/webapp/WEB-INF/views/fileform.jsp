<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>
<c:import url="header.jsp"/>
<div class="container">

<div class="row">
	<h1 class="text-center">파일올리기</h1>
</div>

<form action="fileformOk.bo" method="post" enctype="multipart/form-data" id="uploadform">

<div class="form-group">
<label for="userId" class="control-label">${sessionId}님</label>
<input type="hidden" name="userId" value="${sessionId}" />
</div>

<div class="form-group">
<label for="author" class="control-label">가수이름</label> 
<input type="text" name="author" class="form-control" id="author"/>
</div>

<div class="form-group">
<label for="title" class="control-label">제목</label>
<input type="text" name="title" class="form-control" id="title"/>
</div>

<div class="form-group">
<label for="file" class="control-label">음악파일</label>
<input type="file" name="musicFile" class="form-control" id="musicFile"/>
</div>

<div class="form-group">
<label for="file2" class="control-label">그림파일</label>
<input type="file" name="imgFile" class="form-control" id="imgFile"/>
</div>

<div class="form-group">
<input type="button" value="음악파일 게시하기" class="form-control btn-primary" id="fileuploadbtn"/>
</div>
</form>
</div>

<script>
$('#fileuploadbtn').on('click',uploadfunc);

function uploadfunc(){
	
	var uploadform = $('#uploadform');
	var author = $('#author');
	var title = $('#title');
	var musicFile = $('#musicFile');
	var imgFile = $('#imgFile');
	
	if(author.val()==null||author.val()==""){
		alert('작가이름을 입력하세요');
		author.focus();
		return false;
	}
	
	if(title.val()==null||title.val()==""){
		alert('제목을 입력하세요');
		title.focus();
		return false;
	}
	if(musicFile.val()==null||musicFile.val()==""){
		alert('음악파일을 업로드하세요');
		musicFile.focus();
		return false;
	}
	if(imgFile.val()==null||imgFile.val()==""){
		alert('음악파일을 업로드하세요');
		imgFile.focus();
		return false;
	}
	
	alert('음악파일을 게시합니다.')
	uploadform.submit();
}
</script>

</body>
</html>