<%@page import="org.web.DTO.FileDTO"%>
<%@page import="org.web.DTO.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<style>
	table{
		text-align:center;
		border: 1px solid #dadada;
	}
	table tr th{
		
		text-align: center;
		color:#000;
		font-size: 20px;
	}
	table tr td{
		
		text-align: center;
		font-size: 16px;
	}
	#tbody{
	
	}
</style>
<body>
<c:import url="header.jsp"/>
<div class="container">
	<table class="table table-bordered">
	<thead>
	<tr>
		<td colspan="4" style="background-color: #eeeeee;text-align: center;"><h2>음악 상세 내용</h2></td>
	</tr>
	</thead>
	
	<tbody id="tbody" class="container">
	<c:forEach items="${list }" var="list">
	<tr>
	<th style="width: 20%" class="active">등록순서</th>
	<td colspan="2" class="success">${list.fid }</td>
	</tr>
	<tr>
	<th style="width: 20%" class="active">등록한 아이디</th>
	<td colspan="2" class="success">${list.userId }</td>
	</tr>
	<tr>
	<th style="width: 20%;" class="active">작가</th>
	<td colspan="2" class="success">${list.author }</td>
	</tr>
	<tr>
	<th style="width: 20%;" class="active">제목</th>
	<td colspan="2" class="success">${list.title}</td>
	</tr>
	<tr>
	<tr>
	<th style="width: 20%;" class="active">등록한음악제목</th>
	<td colspan="2" class="success">${list.musicFileRealName}</td>
	</tr>
	<tr>
	<tr>
	<th style="width: 20%;" class="active">등록한이미지제목</th>
	<td colspan="2" class="success">${list.imgFileRealName}</td>
	</tr>
	<tr>
	<th style="width: 20%;" class="active">등록시간</th>
	<td colspan="2" class="success">${list.fday }</td>
	</tr>
	</c:forEach>
	</tbody>
	</table>

	<c:choose>
		<c:when test="${sessionId!=null&&sessionId==list[0].userId }">
			<button type="button" class="btn btn-primary" onclick="delefunc()">음악파일 삭제 </button>
			<a href="/" class="btn btn-primary">처음화면으로</a>
			<button type="button" class="btn btn-primary" onclick="salefunc()">판매등록</button>
		</c:when>
		<c:otherwise>
			<a href="/" class="btn btn-primary">처음화면으로</a>
		</c:otherwise>
	</c:choose>
	
	</div>
	<script>
	function delefunc(){
		if(confirm('등록하신 파일을 삭제하시겠습니까?')){
			location.href="fileDelete.bo?fid=${list[0].fid}";
		}else{
			return;
		}
		
	}
	</script>

	<script>
	function salefunc(){
		if(confirm('등록하신 음악을 판매게시 하시겠습니까?')){
			location.href = "musicSale?fid=${list[0].fid}&userId=${list[0].userId}&musicFileRealName=${list[0].musicFileRealName}";
		}else{
			return;
		}
	}
	</script>
</body>
</html>