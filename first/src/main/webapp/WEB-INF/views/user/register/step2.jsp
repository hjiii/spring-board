<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
	body{
		text-align:center;
		padding-left:20%;
		padding-right:20%;
	}
</style>
<%@ include file="/WEB-INF/views/includes/00_head.jsp"%>
<title>Spring Board</title>
</head>
<body>
	<div class="signup-box-body">
		<p class="box-msg">Register a new membership</p>
		<br><br>
		<div class="row">
			<div class="col-lg-6">
				<form:form role="form" commandName="registerRequest"
					action="/user/register/step3.do" method="post">
					<div class="form-group input-group">
						<span class="input-group-addon"><i class="fa fa-check"></i></span>
						<form:input type="text" class="form-control" placeholder="ID"
							path="id" />
						<form:errors path="id" />
					</div>
					<div class="form-group input-group">
						<span class="input-group-addon"><i class="fa fa-envelope"></i></span>
						<form:input type="email" class="form-control" placeholder="Email"
							path="email" />

					</div>
					<div class="form-group input-group">
						<span class="input-group-addon"><i class="fa fa-user"></i></span>
						<form:input type="text" class="form-control" placeholder="Name"
							path="name" />
						<form:errors path="name" />
					</div>
					<div class="form-group input-group">
						<span class="input-group-addon"><i class="fa fa-lock"></i></span>
						<form:password class="form-control" placeholder="Password"
							path="pw" />
						<form:errors path="pw" />
					</div>
					<div class="form-group input-group">
						<span class="input-group-addon"><i class="fa fa-lock"></i></span>
						<form:password class="form-control" placeholder="Password Check"
							path="checkPw" />
						<form:errors path="checkPw" />
					</div>

					<button type="submit" class="btn btn-default">가입하기</button>
					<button type="reset" class="btn btn-default">취소하기</button>
				</form:form>

				<br>
				<a href="/login.do" class="text center">I already have a
					membership</a>

			</div>

	
		</div>
	</div>


</body>
</html>