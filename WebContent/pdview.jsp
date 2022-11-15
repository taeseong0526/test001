<%@page import="product.pdDTO"%>
<%@page import="product.pdDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/menu.jsp"%>
	<%
		String pdcode = request.getParameter("pdcode");
	%>
	<%=pdcode%>
	<%
		pdDAO dao = new pdDAO();
		pdDTO dto = new pdDTO();

	%>

	<form method="post" scope="request"
		action="addAction.jsp?pdcode=<%=pdcode%>">
		<!-- 장바구니 추가버튼 -->
		<input type="submit" class="btn btn-primary form-control"
			value="장바구니 추가">
	</form>
</body>
</html>