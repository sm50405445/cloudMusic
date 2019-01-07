<%@page import="java.util.Arrays"%>
<%@page import="java.sql.Array"%>
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
	<style>
	th{
	text-align: center;
	}
	thead tr{
	text-align: center;
	}
	</style>
</head>
<body>
	<c:import url="header.jsp"/>
	<div class="container">
		<div class="row">
			<table class="table table-striped">
				<thead class="">
					<tr>
						<th><h1>음원 구입하기</h1></th>
					</tr>
				</thead>
				<tbody>
				
				<tr>
				<th></th>
				<th>번호</th>
				<th>등록아이디</th>
				<th>음원이름</th>
				<th>가격</th>
				<th>구매개수</th>
				<th></th>
				</tr>
				
				<c:forEach items="${lists }" var="lists">
				<tr>
				<td class="listsimg" style="background:url(SpringMVC_Project/resources/upload/${lists.goodsimg}) no-repeat 50%;background-size:cover;"></td>
				<td>${lists.cartId}</td>
				<input type="hidden" id="cartId${lists.cartId }" value="${lists.cartId }" />
				<td>${lists.username }</td>
				<td>${lists.goodsName }</td>
				<td>${lists.goodsPrice }</td>
				<td><input type="number" min="1" max="5" id="amount${lists.cartId }"/></td>
				<td><button class="btn btn-primary" onclick="cartfunc(${lists.cartId})">장바구니 담기</button></td>
				</tr>
				</c:forEach>
				</tbody>
				
			</table>
		</div>
		
		
		
	</div>
	
	<c:if test="${NumArr!=null}">
	<script>alert('상품을 새로 담으면 기존 장바구니를 초기화 합니다.')</script>
	</c:if>
	<script>
	var IdArr = new Array();
	var NumArr = new Array();
	
	var listElement = null;
	
	function cartfunc(IdNum){
	
	var $cartId = $('#cartId'+IdNum)
	var $amount = $('#amount'+IdNum)
	
	if(IdArr.indexOf($cartId.val())!=-1){
		var Idindex = IdArr.indexOf($cartId.val());
		
		if(NumArr[Idindex]!=null){
			NumArr[Idindex] = Number(NumArr[Idindex])+Number($amount.val());	
		}else{
			NumArr.push($amount.val());
		}
		
	}else{
		IdArr.push($cartId.val());
		NumArr.push($amount.val());
	}
	
	
	
	listgo();
	
	function listgo(){
		$.ajax({
			url : 'cartList.ca',
			data : 'post',
			datatype : 'json',
			data : 'IdArr='+IdArr+'&NumArr='+NumArr,
			success: function(result){
				console.log(result);
				if(result==1){
					
					
					if(confirm('상품이 담겼습니다. 계속 담으시려면 취소를 누르세요')==true){
						location.href="cartSearch.ca";
					}else{
						return false;
						
					}
				}
			}
			
			
		})
	}
	
	
	}
	</script>
</body>
</html>