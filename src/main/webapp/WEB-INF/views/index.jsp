<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LSM 클라우드 뮤직입니다!</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css" media="all" />
</head>
<body>
	

	<c:import url="header.jsp"/>
	<div class="jumbotron" id="main">

		<div class="row text-center">
			<h2>사운드 클라우드에 오신 것을 환영합니다.</h2>
			<p>웹사이트 소개</p>
			<p>다른 사람들의 음악을 들어보십시오</p>
		</div>

	</div>

	<div class="container">
		<c:set var="row" value="0" />
		<c:set var="count" value="4" />


		<c:if test="${row%count==0 }">
			<div class="row playlist">
		</c:if>

		<ul>
			<c:forEach items="${thumblists}" var="thumblists">
				<li class="sm">
					<div class="col-sm-3 col-md-3 col-lg-3">
						<div class="thumbnail">
							<img src="<c:url value="/resources/upload/${thumblists.imgFile}"/>" class="img-responsive" />
						</div>

						<div class="caption">
							<h5>${thumblists.musicFileRealName}</h5>
							<p>${thumblists.userId }님의업로드 파일</p>
							<div class="item">
								<p>
									<input type="hidden" id="radiovalue${thumblists.fid}" value="${thumblists.musicFile}" class="radiovalue" />
									<input type="button" value="재생" class="btn btn-primary btn-lg" onclick="radiofunc(${thumblists.fid})" />
								</p>
								<p>
									<a href="musicview.bo?fid=${thumblists.fid}"
										class="btn btn-default">음악 상세정보</a>
								</p>
								<input type="hidden" value="badge${thumblists.fid}"
									id="badge${thumblists.fid}" /> <input type="hidden"
									value="heart${thumblists.fid}" id="heart${thumblists.fid}" />
								<input type="hidden" value="${thumblists.fid }"
									id="idvalue${thumblists.fid}" />
								<p>
									<button type="button" class="btn btn-default btn-md"
										onclick="likefunc(badge${thumblists.fid},heart${thumblists.fid},idvalue${thumblists.fid});">
										<span class="glyphicon glyphicon-heart heart${thumblists.fid}"></span>좋아요!&nbsp;
										<span class="badge${thumblists.fid} badge">${thumblists.fhit}</span>
									</button>
								</p>
							</div>
						</div>
					</div>
				</li>
		
				<c:set var="row" value="${i+1}" />
			
			</c:forEach>
		</ul>
		
		
		<c:if test="${row%count==count-1}">
	</div>
		</c:if>

	</div>

	<c:set var="i" value="${i+1}" />
	<script>

	function likefunc(badgeClass,heartClass,idvalue){
		
		var $badgeClass = $(badgeClass).val();
		var $heartClass = $(heartClass).val();
		var $idval = $(idvalue).val();
		var $badge = $('span.'+$badgeClass);
		var $heart = $('span.'+$heartClass);
		
		<c:if test="${sessionId == null}">
		alert('로그인 후 이용해주세요!');
		return false;
		</c:if>

		
		$.ajax({
			url: 'like.bo',
			type: 'post',
			datatype: 'json',
			data: 'fId='+$idval+'&userId=${sessionId}',
			success: function(result){
				
				if(result==1){
					$heart.addClass('nonered').removeClass('red');
					
					$.ajax({
						url: 'hitview.bo',
						type: 'post',
						datatype: 'json',
						data: 'fId='+$idval,
						success: function(value){
							$badge.html("");
							$badge.html(value)
						}	
					})
					
				}else if(result==2){
					$heart.addClass('red').removeClass('nonered');
					$.ajax({
						url: 'hitview.bo',
						type: 'post',
						datatype: 'json',
						data: 'fId='+$idval,
						success: function(value){
							$badge.html("");
							$badge.html(value)
						}	
					})
					
				}
			}
		})
	}
	

	</script>

<!-- radio button -->
	<script>
	function radiofunc(Num){
		var radiovalue = $('#radiovalue'+Num).val();
		$('#mainaudio').attr('src','/resources/upload/'+radiovalue);
		alert('상단에 오디오 바를 클릭하세요');
	}

	</script>
	
	
	<script>

	$(document).ready(function() {
		
		$.ajax({
			url: 'heartOn.bo',
			type: 'post',
			datatype: 'json',
			data: 'userId=${sessionId}',
			success: function(result){
			var data = JSON.parse(result);
			for(var i=0;i<data.length;i++){
				var j = data[i];
				$('span.heart'+j).addClass('red');
			}
			}
		});
	
	})
	</script>

</body>
</html>