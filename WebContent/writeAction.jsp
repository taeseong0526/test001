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
		
		//현재 세션 상태를 체크함.
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID"); //Attribute는 Object타입으로 String으로 형변환해야한다.
		}
		
		//로그인한 사람만 글을 쓸 수 있음.
		
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 해야합니다..')");
			script.println("location.href='login.jsp");
			script.println("</script>");
		}else{
			//입력이 된 부분이 있는지 체크한다.
			if(bbs.getBbsTitle() == null || bbs.getBbsContent() == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('모든 정보를 입력해주세요.')");
				script.println("history.back()");
				script.println("</script>");
				
			}else{
				//정상적으로 입력이 되었다면 글쓰기 로직을 수행한다.
				BbsDAO bbsDAO = new BbsDAO();
				int result = bbsDAO.write(bbs.getBbsTitle(),userID,bbs.getBbsContent());
				
				if(result == -1){
					//데이터베이스 오류
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패하셨습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}else{
					//글쓰기가 정상적으로 작동되었을 경우
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글이 작성되었습니다.')");
					script.println("location.href='bbs.jsp'");
					script.println("</script>");
				}
			}
		}



	%>
</body>
</html>