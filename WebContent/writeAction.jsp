<%@page import="bbs.*" %>
<%@page import="java.io.PrintWriter"%>
<%@page import="user.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!-- 포스트 단점 : 인코딩해야함
한국어 안되던거 해결됨.
 -->
<!DOCTYPE html>

<%-- <% Bbs bbs = new Bbs(); 
String bbsTitle = bbs.getBbsTitle();
String bbsContent = bbs.getBbsContent();
%> --%>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page"></jsp:useBean>
<jsp:setProperty name="bbs" property="bbsTitle"></jsp:setProperty>
<jsp:setProperty name="bbs" property="bbsContent"></jsp:setProperty>

<html>
<head>
<meta charset="UTF-8">
<title>write Action</title>
</head>
<body>
<%
		/* 현재 세션 상태를 체크한다. */
		String userID = null;
		if(session.getAttribute("userID") != null)
		{
			userID = (String)session.getAttribute("userID");
		}
		// 로그인을 한 사람만 글을 쓸 수 있도록 한다.
		if(userID == null)
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}
		else
		{
			// 입력이 누락된 부분이 있는지 체크.
			if(bbs.getBbsTitle() == null || bbs.getBbsContent() == null)
			{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else
			{
				// 전부 입력이 되었다면 글쓰기 로직을 수행한다.
				BbsDAO bbsDAO = new BbsDAO();
				int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());
				
				// 데이터베이스 오류인 경우
				if(result == -1)
				{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패햇습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
				else
				{
					// 글쓰기가 정상적으로 실행되면 알림창을 띄우고 게시판 메인으로 이동한다.
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기 성공!')");
					script.println("location.href='bbs.jsp'");
					script.println("</script>");
				}
			}
		}
	%>
</body>
</html>