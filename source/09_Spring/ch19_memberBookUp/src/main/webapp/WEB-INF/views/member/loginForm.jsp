<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <link href="${conPath }/css/style.css" rel="stylesheet">
   <style>
  #content {
		width: 800px; height:350px;
		margin: 50px auto;
	}
	img{width: 100px;}
  </style>
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
	  $(document).ready(function(){
			
  	  });
	</script>
</head>
  <body>
  <jsp:include page="../main/header.jsp"/>
  	<div id="content">
		<form action="member.do?method=login" method="post" >
			<table>
				<caption>로그인</caption>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="mid" value="${mid }" required="required">
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="mpw" required="required">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="로그인">
						<input type="button" value="뒤로가기" onclick="location='main.do'" >
					</td>
				</tr>
			</table>
		</form>  	
  	</div>
  	<jsp:include page="../main/footer.jsp"/>
  </body>
</html>