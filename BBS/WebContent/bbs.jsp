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
<title>bbs page</title>
</head>
<body>
		<%@ include file="/menu.jsp" %>

	<!--
	게시판 메인 페이지 영역 
	 -->
	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>
			<!--  글쓰기 버튼 -->
			<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
		</div>

	</div>

</body>
</html>