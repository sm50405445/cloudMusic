<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<h1 class="text-center">음악파일 판매게시</h1>	
	</div>
	
	<form action="musicSale.ca" id="musicSaleform" method="post">
		
		<div class="form-group">
		<input type="hidden" name="fId" value="${fId }" />
		</div>
		
		<div class="form-group">
		<label for="userId" class="control-label">${userId }님의 게시물</label>
		<input type="hidden" class="form-control" value="${userId}" id="userId" name="userId"/>
		</div>
		
		<div class="form-group">
		<label for="musicFileRealName" class="control-label">${musicFileRealName}</label>
		<input type="hidden" name="musicFileRealName" class="form-control" id="musicFileRealName" value="${musicFileRealName}"/>
		</div>
		
		<div class="form-group">
		<label for="cost" class="control-label">비용설정</label>
		<input type="number" name="goodsprice" class="form-control" id="cost" min="0" max="1200"/>
		</div>
		
		<div class="form-group">
		<button class="btn btn-primary form-control" onclick="insertfunc()">등록하기</button>
		</div>
		
	</form>
	
</div>

	<script>
		function insertfunc(){
			var musicSaleform = document.getElementById('musicSaleform');
			musicSaleform.submit();
		}
	</script>

</body>
</html>