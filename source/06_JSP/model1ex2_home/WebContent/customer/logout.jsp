<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link href="<%=conPath%>/css/style.css" rel="stylesheet">
</head>
<body>
<%
	session.invalidate();
%>
	<script>
		alert('로그아웃 되었습니다.');
		location.href="../main/main.jsp";
	</script>
</body>
</html>