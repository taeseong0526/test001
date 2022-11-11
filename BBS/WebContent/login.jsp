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
<title>login page</title>
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
	<%@ include file="/menu.jsp" %>
	<!-- 로그인 양식 -->
	<div class="container">
		<!-- 하나의 영역 생성 -->
		<div class="col-lg-4">
			<!-- 영역 크기 지정 -->
			<!-- jumbotron은 특정 컨텐츠와 정보를 두드러지게 크게 보이게 해 주는 큰 박스 -->
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="loginAction.jsp">

					<h3 style="text-align: center">로그인 화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디"
							name="userID" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호"
							name="userPassword" maxlength="20">
					</div>
					<input type="submit" class="btn btn-primary form-control"
						value="로그인">
				</form>
			</div>
		</div>
	</div>
</body>
</html>