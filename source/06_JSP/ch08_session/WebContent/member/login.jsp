<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String conPath = request.getContextPath();
	String msg = request.getParameter("msg");
	if(msg!=null){
%>
		<script>
			alert('<%=msg%>');
		</script>
	<%} %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <link href="<%=conPath %>/css/member_login.css" rel="stylesheet">
  <style>
   
  </style>
</head>
 <body>
 <jsp:include page="header.jsp"/>
 	<div id="loginForm_wrap">
 		<div id="login_title">로그인</div>
 		<form action="loginPro.jsp" method="post">
 			<table>
 				<tr><td></td></tr>
 				<tr>
 					<th><label for="id">아이디</label></th>
 					<td><input type="text" name="id" id="id" required="required" autofocus ="autofocus"></td>
 				<tr>
 					<th><label for="pw">비밀번호</label></th>
 					<td><input type="password" name="pw" id="pw" required="required"></td>
 				</tr>
 				<tr><td></td></tr>
 				<tr>
 					<td colspan="2">
 						<input type="submit" value="로그인" class="loginBtn_style">
 					</td>				
 				</tr>
 				<tr>
 					<td colspan="2"> 
 						<% 
 							
 							 if( msg != null) {						 
 						%>
 						<script>
 							alert(msg);
 						</script>
 						<p id="login_findIdPw" onclick="alert('아이디는 aaa/pw는 111');">
 							아이디/비밀번호를 잊으셨나요?
 						</p>	
 						 
 						<% } %>	
							
							
 						
 					</td>
 				</tr>
 			</table>
 			<p id = login_join> 아직 회원이 아니신가요?<a href="join.jsp">회원가입</a></p> 
 		</form>
 	</div>
 	<jsp:include page="footer.jsp"/>
    
 </body>
</html>
