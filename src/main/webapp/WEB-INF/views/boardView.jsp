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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boardView.css" media="all" />
</head>

<body>
<c:import url="header.jsp"/>
<div class="container">
	<table class="table table-bordered">
	<thead>
	<tr>
		<td colspan="4" style="background-color: #eeeeee;text-align: center;"><h2>게시판 글보기</h2></td>
	</tr>
	</thead>
	
	<tbody id="tbody" class="container">
	
	<tr>
	<th style="width: 20%" class="active">아이디</th>
	<td colspan="2" class="success">${list[0].userId }</td>
	</tr>
	<tr>
	<th style="width: 20%;" class="active">제목</th>
	<td colspan="2" class="success">${list[0].title }</td>
	</tr>
	<tr>
	<th style="width: 20%; height: 300px;" class="active">내용</th>
	<td colspan="2" class="success">${list[0].memo }</td>
	</tr>
	<tr>
	<th style="width: 20%;" class="active">조회수</th>
	<td colspan="2" class="success">${list[0].hit }</td>
	</tr>
	<tr>
	<th style="width: 20%;" class="active">등록시간</th>
	<td colspan="2" class="success">${list[0].bTime }</td>
	</tr>

	</tbody>
	</table>
	

<c:choose>
	<c:when test="${sessionId!=null&&sessionId==list[0].userId}">
	<button type="button" class="btn btn-primary" onclick="delefunc()">게시글 삭제</button>
	<button type="button" class="btn btn-primary" onclick="updatefunc()">게시글 수정</button>
	<a href="boardList.bo" class="btn btn-primary">게시글 목록</a>
	<a href="boardReply?userId=${sessionId}&bId=${list[0].bId}&bIndent=${list[0].bIndent}&bGroup=${list[0].bgroup}&bStep=${list[0].bStep}" class="btn btn-primary">댓글달기</a>
	</c:when>
	<c:when test="${sessionId!=null}">
	<a href="boardList.bo" class="btn btn-primary">게시글 목록</a>
	<a href="boardReply?userId=${sessionId}&bId=${list[0].bId}&bIndent=${list[0].bIndent}&bGroup=${list[0].bgroup}&bStep=${list[0].bStep}" class="btn btn-primary">댓글달기</a>
	</c:when>
	<c:otherwise>
	<a href="boardList.bo" class="btn btn-primary">게시글 목록</a>
	</c:otherwise>
</c:choose>

	</div>
	<script>
	function delefunc(){
		if(confirm('정말로 삭제할까요?')){
			location.href="boardDelete.bo?bId="+${list[0].bId};
			
		}else{
			return;
		}
		
	}
	</script>
	<script>
	function updatefunc(){
		location.href="boardUpdate?bId=${list[0].bId}&title=${list[0].title}&memo=${list[0].memo}"
	}
	</script>

</body>
</html>