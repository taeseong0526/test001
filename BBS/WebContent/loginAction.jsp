<%@page import="user.User"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%-- <jsp:useBean id="user" class="user.User" scope="page"></jsp:useBean> --%>
<!-- 자바빈은 마치 하나의 클래스를 가지고 인스턴스를 만들어 사용하는 것과 같다 -->
<!-- user패키지의 User 클래스의 인스턴스를 만드는 대신(User user = new User();)
id를 설정하는 변수처럼 사용한다.-->
<%-- <jsp:setProperty name = "user" property="userID"></jsp:setProperty>
<jsp:setProperty name = "user" property="userPassword"></jsp:setProperty> --%>
<!-- 
	setProperty는 해당 변수로 필드에 접근하여 get이나 set을 수행한다.
	name은 useBean의 id, 즉 생성한 객체, property는 객체가 가진 field이고,
	getProperty는 getter, setProperty는 setter라고 생각하면 된다.
 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<% 
		//현재 세션 상태를 체크함.
		String userID = null;
		if(session.getAttribute("userID")!=null){
			userID = (String)session.getAttribute("userID"); //Attribute는 Object타입으로 String으로 형변환해야한다.
		}
		if(userID != null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인 되어되어있습니다.')");
			script.println("location.href='main.jsp");
			script.println("</script>");
		}
		
		UserDAO userDAO = new UserDAO();
		User user = new User();
		user.setUserID(request.getParameter("userID"));
		user.setUserPassword(request.getParameter("userPassword"));
		int result = userDAO.login(user.getUserID(),user.getUserPassword());
		
		if(result==1){
			//로그인 성공시 세션을 부여.
			session.setAttribute("userID", user.getUserID());
			session.setAttribute("userName", user.getUserName());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인성공')");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}
		else if(result==0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 일치하지 않습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if(result==-1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지않는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if(result==-2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		
		
	%>
</body>
</html>