<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
<style>
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {

	});
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<c:if test="${member eq null and admin eq null}">
		<script>
			alert('로그인 후 글쓰기 가능합니다.');
			location.href = "${conPath}/loginView.do";
		</script>
	</c:if>
	<div id="content_form">
		<form action="${conPath }/boardWrite.do" method="post" enctype="multipart/form-data">
			<table>
				<caption>글쓰기</caption>
				<tr>
    				<th>제목</th>
    				<td>
    					<input type="text" name="fTitle" required="required" autofocus="autofocus">
    				</td>
    			</tr>
    			<tr>
    				<th>첨부파일</th>
    				<td>
    					<input type="file" name="fFileName">
    				</td>
    			</tr>
    			<tr>
    				<th>본문</th>
    				<td>
    					<textarea rows="5" cols="20" name="fContent"></textarea>
    				</td>
    			</tr>
    			<tr>
    				<td colspan="2">
    					<input type="submit" value="글쓰기" class="btn">
    					<input type="reset" value="다시 쓰기" class="btn">
    					<input type="button" value="목록" class="btn"
    							onclick="location.href='${conPath}/list.do'">
    				</td>
    			</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>