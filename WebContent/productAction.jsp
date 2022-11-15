<%@page import="product.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="pdDAO" class="product.pdDAO" scope="page"></jsp:useBean>
	<jsp:useBean id="pdDTO" class="product.pdDTO" scope="page"></jsp:useBean>
	<jsp:setProperty name="pdDTO" property="pdcode"></jsp:setProperty>
	<jsp:setProperty name="pdDTO" property="pdname"></jsp:setProperty>
	<jsp:setProperty name="pdDTO" property="pdprice"></jsp:setProperty>
	<jsp:setProperty name="pdDTO" property="stock"></jsp:setProperty>
	<jsp:setProperty name="pdDTO" property="pdsize"></jsp:setProperty>
	<%
		String pdname = null;
		if (pdDTO.getPdcode() == null || pdDTO.getPdname() == null || pdDTO.getPdprice() == 0
				|| pdDTO.getPdsize() == null || pdDTO.getStock() == 0) {
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('빈칸있음')");
			script.println("history.back()");
			script.println("</script>");
		} else {

			pdDAO dao = new pdDAO();
			int result = dao.productUplode(pdDTO);
			session.setAttribute("pdname", pdDTO.getPdname());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('상품이 등록되었습니다.')");
			script.println("location.href = 'product.jsp'");
			script.println("</script>");
		}
	%>
</body>
</html>