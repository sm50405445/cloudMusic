<%@page import="org.web.DTO.CartDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}.css" media="all" />
</head>
<body>
<c:import url="header.jsp"/>
<div class="container">

	<table class="table table-hover col-md-12 col-sm-12 col-xs-12">
	
	<thead>
	<tr>
		<th>번호</th>
		<th>업로더</th>
		<th>상품이름</th>
		<th>개수</th>
		<th>상품가격</th>
	</tr>
	</thead>
	
	<tbody>
	<c:forEach items="${shoppingList}" var="shoppingList" varStatus="status">
	<tr>
		<td>${shoppingList.cartId}</td>
		<td>${shoppingList.username}</td>
		<td>${shoppingList.goodsName}</td>
	<c:forEach items="${NumArr}" var="NumArr" begin="${status.index}" end="${status.index }">
		<td>${NumArr}개</td>
	</c:forEach>
		<td>${shoppingList.goodsPrice}원</td>
	</tr>
	</c:forEach>
	
	<tr style="font-weight: bold; font-size: 20px;">
	<c:set var="total" value="${total}"/>
	<td class="col-md-2 col-sm-2 col-xs-2"></td>
	<td class="col-md-2 col-sm-2 col-xs-2"></td>
	<td class="col-md-2 col-sm-2 col-xs-2"></td>
	<td class="col-md-2 col-sm-2 col-xs-2">총 가격</td>
	<td class="col-md-2 col-sm-2 col-xs-2">${total}원</td>

	</tr>
	
	</tbody>
	
	</table>

</div>

</body>
</html>