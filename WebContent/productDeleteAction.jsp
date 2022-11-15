<%@page import="bbs.BbsDAO"%>
<%@page import="product.*"%>
<%@page import="java.io.PrintWriter"%>
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
		// 현재 세션 상태를 체크한다
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		// 로그인을 한 사람만 삭제할 수 있도록 코드를 수정한다
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 해야합니다')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}
		// 상품코드 가져오기
		String pdcode = request.getParameter("pdcode");
		// 삭제 로직을 수행한다
		pdDAO pdDAO = new pdDAO();
		int result = pdDAO.delete(pdcode);
		// 데이터베이스 오류인 경우
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('상품삭제에 실패했습니다')");
			script.println("history.back()");
			script.println("</script>");
			//삭제가 정상적으로 실행되면 알림창을 띄우고  메인으로 이동한다
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('상품 삭제하기 성공')");
			script.println("location.href='product.jsp'");
			script.println("</script>");
		}
	%>

</body>
</html>