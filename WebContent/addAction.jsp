<%@page import="java.io.PrintWriter"%>
<%@page import="product.pdDTO"%>
<%@page import="java.util.ArrayList"%>
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
		String pdcode = request.getParameter("pdcode");
		pdDAO dao = new pdDAO();
		pdDTO dto = new pdDTO();
		ArrayList<pdDTO> list = (ArrayList<pdDTO>)session.getAttribute("productlist");

		if (list == null) {
			list = new ArrayList<pdDTO>();
			

		}
		
		list.add(dao.cart((String)pdcode));
		session.setAttribute("productlist", list);
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('상품추가완료.')");
		script.println("location.href='addlist.jsp'");
		script.println("</script>");
		
	%>
	<%=pdcode%>


</body>
</html>