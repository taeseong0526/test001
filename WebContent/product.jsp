
<%@page import="java.util.ArrayList"%>
<%@page import="product.*"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 화면 최적화 -->
<meta name="viewport" content="width=device-width" , initial-scale="1">
<!-- 루트 폴더의 부트스트랩을 참조하는 링크 -->
<link rel="stylesheet" href="css/bootstrap.css">
<title>Product</title>
</head>
<body>
	<%@ include file="/menu.jsp"%>
	<div class="container">
		<div class="row">


			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">상품코드</th>
						<th style="background-color: #eeeeee; text-align: center;">상품명</th>
						<th style="background-color: #eeeeee; text-align: center;">상품가격</th>
						<th style="background-color: #eeeeee; text-align: center;">재고</th>
						<th style="background-color: #eeeeee; text-align: center;">사이즈</th>

						<%
							if (userID == null) {
						%>
						<th style="background-color: #eeeeee; text-align: center;"></th>
						<%
							} else {
						%>
						<th style="background-color: #eeeeee; text-align: center;">관리</th>

						<%
							}
						%>
					</tr>
				</thead>
				<%
					pdDAO dao = new pdDAO();
					pdDTO dto = new pdDTO();
					ArrayList<pdDTO> list = (ArrayList<pdDTO>) dao.pdList();
					for (pdDTO dtos : list) {
				%>
				<tbody>
					<tr>
						<td><%=dtos.getPdcode()%></td>
						<td><a href="pdview.jsp?pdcode=<%=dtos.getPdcode()%>"><%=dtos.getPdname()%></a></td>
						<td><%=dtos.getPdprice()%></td>
						<td><%=dtos.getPdsize()%></td>
						<td><%=dtos.getStock()%></td>
						<%
							if (userID == null) {
						%>
						<td></td>
						<%
							} else {
						%>
						<td><a
							href="productDeleteAction.jsp?pdcode=<%=dtos.getPdcode()%>">삭제</a></td>
						<%
							}
						%>
					</tr>
				</tbody>
				<%
					} //for 문의 끝
				%>
			</table>


			<!--  글쓰기 버튼 -->

			<%
				if (userID == null) {
			%>
			<%
				} else {
			%>
			<a href="pdwrite.jsp" class="btn btn-primary pull-right">상품등록</a>
			<%
				}
			%>
		</div>

	</div>
</body>
</html>