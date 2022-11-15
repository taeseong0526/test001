<%@page import="java.util.ArrayList"%>
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
	<%
		pdDAO dao = new pdDAO();
		pdDTO dto = new pdDTO();
		
		ArrayList<pdDTO> list = new ArrayList<>();
		
		list.add(dao.cart("123"));
		list.add(dao.cart("157"));
		for (pdDTO dtos : list) {
	%>
	<%= dtos.getPdname() %>
	<% }%>
</body>
</html>