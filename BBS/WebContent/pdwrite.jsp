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
<title>product write page</title>
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
				<form method="post" action="productAction.jsp">

					<h3 style="text-align: center">상품등록 화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="상품코드"
							name="pdcode" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="상품명"
							name="pdname" maxlength="20">
					</div>
					<div class="form-group" style="text-align: center">
						<div class=btn-group data-toggle="buttons">
							<label class="btn btn-primary active"> <input
								type="radio" class="form-control" name="pdsize"
								autocomplete="off" value="xs" checked>XS
							</label> <label class="btn btn-primary active"> <input
								type="radio" class="form-control" name="pdsize"
								autocomplete="off" value="s">S
							</label> <label class="btn btn-primary active"> <input
								type="radio" class="form-control" name="pdsize"
								autocomplete="off" value="m">M
							</label> <label class="btn btn-primary active"> <input
								type="radio" class="form-control" name="pdsize"
								autocomplete="off" value="l">L
							</label> <label class="btn btn-primary active"> <input
								type="radio" class="form-control" name="pdsize"
								autocomplete="off" value="xl">XL
							</label>
						</div>
						<div class="form-group">
							<input type="number" class="form-control" placeholder="상품가격"
								name="pdprice" maxlength="20">
						</div>
						<div class="form-group">
							<input type="number" class="form-control" placeholder="재고"
								name="stock" maxlength="20">
						</div>
					</div>
					<input type="submit" class="btn btn-primary form-control"
						value="상품등록">
				</form>
			</div>
		</div>
	</div>
</body>
</html>