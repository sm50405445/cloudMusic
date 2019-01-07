<%@page import="org.web.DTO.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boardlistpersonalview.css" media="all" />
</head>
<body>
<c:import url="header.jsp"/>
<div class="container">
	<table class="table table-bordered">
	<tr></tr>
	<thead>
	<tr>
		<td colspan="4" style="background-color: #eeeeee;text-align: center;"><h2>내정보</h2></td>
	</tr>
	</thead>
	<tbody id="tbody" class="container">
	<tr>
	<th style="width: 20%" class="active">아이디</th>
	<td colspan="2" class="success">${info[0].userId}</td>
	</tr>
	<tr>
	<th style="width: 20%;" class="active">비밀번호</th>
	<td colspan="2" class="success">${info[0].userPw}</td>
	</tr>
	<tr>
	<th style="width: 20%;" class="active">이름</th>
	<td colspan="2" class="success">${info[0].userName}</td>
	</tr>

	
	</tbody>
	</table>

	<div class="modal fade" id="deletego" tabindex="-1" role="dialog"
	aria-labelledby="dellabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="dellabel">아이디, 비밀번호 입력</h4>
			</div>
			<div class="modal-body">
				<form action="memberdelete.mo" method="post" id="delform">
					<div class="form-group">
						<label for="delId" class="control-label">아이디</label> <input
							type="text" name="delId" class="form-control" id="delId"
							value="${sessionId }" readonly="readonly" />
					</div>
					<div class="form-group">
						<label for="delPw" class="control-label">비밀번호 입력</label> <input
							type="password" name="delPw" id="delPw" class="form-control" />
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal" id="closebtn">닫기</button>
				<button type="button" class="btn btn-primary" id="deletebtn">탈퇴하기</button>
			</div>
		</div>
	</div>
</div>

	
	
	
	<a href="memberUpdate" class="btn btn-primary btn-sm">수정하기</a>
	
	<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#deletego">
  	회원탈퇴</button>
	
	<script>
	$('#deletebtn').click(function(){
		
		var $delId = $('#delId');
		var $delPw = $('#delPw');
		
		if($delPw.val()==null||$delPw.val()==""){
			alert('비밀번호를 입력하세요');
			$delPw.focus();
			return false;
		}
		
		$.ajax({
			url: 'memberdelete.mo',
			type: 'post',
			datatype: 'json',
			data: 'delId='+$delId.val()+"&delPw="+$delPw.val(),
			success: function(result){
				if(result==1){
					alert('성공적으로 탈퇴하였습니다.');
					location.href="/";
				}else{
					alert('비밀번호를 확인하세요');
					history.back();
				}
			}
		
		})
		
	})
	</script>

	

	</div>
</body>
</html>