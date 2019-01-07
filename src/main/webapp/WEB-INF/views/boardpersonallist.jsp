<%@page import="org.web.DTO.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boardpersonallist.css" media="all" />
<script>
	$(document).ready(function(){
		$('#btnView').click(function(){
			$('#myModal').modal('show')
		})
		
	})
	
	
</script>
</head>
<body>
<c:import url="header.jsp"/>
	<div class="container">
	<div class="row">
		<table class="table table-striped">
		<thead>
			<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>제목</th>
			<th>내용</th>
			<th>조회수</th>
			<th>날짜</th>
			</tr>
		</thead>
		
		<tbody id="tbody">
		<c:set var="countNumbering" value="${countNumbering}"/>
		
		<c:forEach items="${members}" var="members" varStatus="status">
			<tr>
			<td>${countNumbering}</td>
			<td>${members.userId }</td>
			<td id="indent">
			<c:forEach begin="1" end="${members.bIndent}">
			ㄴ
			</c:forEach>
			<a href="boardView.bo?bId=${members.bId }">${members.title }</a>
			</td>
			<td>${members.memo }</td>
			<td>${members.hit}</td>
			<td><fmt:formatDate value="${members.bTime}" pattern="yyyy-MM-dd hh:mm:ss"/> </td>
			</tr>
			<c:set var="countNumbering" value="${countNumbering-1}"/>
		</c:forEach>
		</tbody>
		</table>
		
		
		<div class="row">
		
		<c:if test="${sessionId!=null }">
		<div class="col-md-2 col-xs-2">
		<button type="button" class="btn btn-primary btn-sm" onclick="goinsertfunc()">글쓰기</button>
		</div>	
		</c:if>

		</div>
		</div>
		
		<div class="row pageRow">
	
		
	<c:if test="${AllCount>0}">
		<c:set var="pageCount" value="${AllCount/pageSize+(AllCount%pageSize==0?0:1)}"/>
		<c:set var="startPage" value="${1 }"/>
		
		<fmt:parseNumber var="result" value="${currPageNum/10 }" integerOnly="true"/>
		<c:if test="${currPageNum % 10 != 0 }">
		<c:set var="startpage" value="${result*10+1 }"/>
		</c:if>
		
		<c:if test="${currPageNum%10==0 }">
		<!-- 결과를 정수형으로 받야아하므로 -->
		<c:set var="startpage" value="${(result-1)*10+1 }"/>
		</c:if>
		
		<c:set var="pageBlock" value="${10 }"/>
		<c:set var="endPage" value="${startpage+pageBlock-1 }"/>
		
		<c:if test="${endPage>pageCount }">
		<c:set var="endPage" value="${pageCount }"/>
		</c:if>
		
		<c:if test="${startpage>10 }">
		<a href="boardpersonalUpdate.bo?pageNum=${startpage-10 }"><span class="glyphicon glyphicon-backward"></span></a>
		</c:if>
		
		<c:forEach var="i" begin="${startpage }" end="${endPage }">
		<c:if test="${currPageNum==i }">
		<a href="boardpersonalUpdate.bo?pageNum=${i }&userId=${sessionId}" id="curPage">[${i}]</a>
		</c:if>
		<c:if test="${currPageNum!=i}">
		<a href="boardpersonalUpdate.bo?pageNum=${i }&userId=${sessionId}" id="Page">[${i}]</a>
		</c:if>
		</c:forEach>
		
		<c:if test="${endPage<pageCount }">
		<a href="boardpersonalUpdate.bo?pageNum=${startpage+10 }"><span class="glyphicon glyphicon-forward"></span></a>
		
		</c:if>
		</c:if>
	</div>
	</div>
	
		<script>
		function goinsertfunc(){
			location.href="boardInsert";
		}
		</script>
		
	
	<script>
	var xhr = new XMLHttpRequest();
	var search = document.getElementById('search');
	function searchfunc(){
		xhr.open("post","boardSearch.bo?title="+encodeURIComponent(search.value),true)
		xhr.onreadystatechange=searchOk;
		xhr.send(null);
	}
	function searchOk(){
		if(xhr.readyState==4 && xhr.status==200){
			var table = document.getElementById('tbody');
			table.innerHTML="";
			var Object = eval('('+xhr.responseText+')');
			var result = Object.result;
			console.log(result.length);
			for(var i =0;i<result.length;i++){
				var row = table.insertRow(0);
				for(var j =0;j<result[i].length;j++){
					cell.innerHTML=result[i][j].value;
				}
			}
		}
	}
	</script>
</body>
</html>