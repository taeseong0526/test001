<%@page import="java.util.List"%>
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

	<%@ include file="/menu.jsp"%>
	
	<h1>장바구니</h1>
	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">상품명</th>
						<th style="background-color: #eeeeee; text-align: center;">상품가격</th>
						<th style="background-color: #eeeeee; text-align: center;">재고</th>
						<th style="background-color: #eeeeee; text-align: center;">사이즈</th>
					</tr>
				</thead>
				<%
					
					PrintWriter script = response.getWriter();
					pdDAO dao = new pdDAO();
					pdDTO dto = new pdDTO();
					
					ArrayList<pdDTO> list = (ArrayList)session.getAttribute("productlist");
					list = new ArrayList<pdDTO>();
				%>
				
				<%
					for (pdDTO dtos : list) {
				%>
				<tbody>
					<tr>
						<td><%=dtos.getPdname()%></td>
						<td><%=dtos.getPdprice()%></td>
						<td><%=dtos.getStock()%></td>
						<td><%=dtos.getPdsize()%></td>
				</tbody>
				<%
					} //for 문의 끝
				%>
			</table>
		</div>
	</div>
</body>
</html>