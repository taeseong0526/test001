<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><link rel="stylesheet" href="css/bootstrap.css">
	
<!-- 부트스트랩 참조 영역 -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<%
	//현재 세션 상태를 체크함.
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID"); //Attribute는 Object타입으로 String으로 형변환해야한다.
	}
	if (userID != null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인 되어되어있습니다.')");
		script.println("location.href='main.jsp");
		script.println("</script>");
	}
%>
<!-- 네비게이션 영역 -->
<nav class="navbar navbar-default">
	<!-- 헤더 영역(홈페이지 로고 등을 담당) -->
	<div class="navbar-header">
		<!-- 네비게이션 상단 박스 영역 -->
		<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expanded="false">
			<!-- 이 세 줄 버튼은 화면이 좁아지면 우즉에 나타남 -->
			<span class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
		</button>
		<!-- 상단 바에 제목이 나타나고 클릭하면 main 페이지로 이동한다. -->
		<a class="navbar-brand" href="main.jsp">JSP 게시판</a>
	</div>
	<!-- 게시판 이름 옆에 나타나는 메뉴 영역 -->
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
			<li><a href="main.jsp">메인</a></li>
			<li><a class="active" href="bbs.jsp">게시판</a></li>
			<li><a class="active" href="product.jsp">상품목록</a></li>
		</ul>
		<%
			//로그인 하지 않았을 때 보여지는 화면
			if (userID == null) {
		%>
		<!-- 헤더 우측에 나타나는  드랍다운 영역 -->
		<ul class="nav navbar-nav navbar-right">
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown" role="button" aria-haspopup="true"
				aria-expanded="false">접속하기<span class="caret"></span>
			</a> <!-- 드랍다운 아이템 영역 -->
				<ul class="dropdown-menu">
					<li class="active"><a href="login.jsp">로그인</a></li>
					<li><a href="join.jsp">회원가입</a></li>
				</ul></li>
		</ul>
		<%
			}
			//로그인이 되어있는 상태에서 보여주는 화면
			else {
		%>
		<!-- 헤더 우측에 나타나는  드랍다운 영역 -->
		<ul class="nav navbar-nav navbar-right">
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown" role="button" aria-haspopup="true"
				aria-expanded="false">회원관리<span class="caret"></span>
			</a> <!-- 드랍다운 아이템 영역 -->
				<ul class="dropdown-menu">
					<li class="active"><a href="logoutAction.jsp">로그아웃</a></li>
				</ul></li>
		</ul>
		<%
			}
		%>
	</div>
</nav>
