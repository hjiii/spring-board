<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/includes/00_head.jsp"%>

<!-- jQuery -->

<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

 -->

<script
	src="${pageContext.request.contextPath}/resources/common/js/jquery-3.3.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Bootstrap CSS -->

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">



<!-- Bootstrap theme -->

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap-theme.min.css">



<!-- common CSS -->

<link rel="stylesheet"
	href="<c:url value='/resources/common/css/common.css'/>">


<style>
ul {
	text-align: center;
	/* 	border-top: 2px dotted blue;
	border-bottom: 2px dotted blue; */
	padding: 10px;
}

ul li {
	display: inline;
	padding: 20px;
	font-weight: bolder;
}

ul li a {
	text-decoration: none;
	color: white;
}

ul li a:hover {
	color: red;
}
.text{
	color: white;
	font-size:10px;
}
*{
	font-size : 15px;
}
</style>

</head>
<body>

	<nav class="navbar navbar-expand-sm navbar-dark bg-dark"> <a
		class="navbar-brand" href="/board/boardList.do">spring 게시판</a>

	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarsExample03" aria-controls="navbarsExample03"
		aria-expanded="false" aria-label="Toggle navigation">

		<span class="navbar-toggler-icon"></span>

	</button>


	<div class="collapse navbar-collapse" id="navbarsExample03">
		<div style="text-align: center">
			<ul class="navbar-nav mr-auto">

				<c:catch>
					<c:choose>
						<c:when test="${empty authInfo }">
							<li><a href="/login.do"><i class="fa fa-sign-in"></i>
									로그인</a></li>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${authInfo.grade eq '1' }">

									<li><p class="text">관리자 ${authInfo.id }님, 환영합니다.</p></li>
									<li><a href="/logout.do"><i class="fa fa-sign-out"></i>
											로그아웃</a></li>
								</c:when>
								<c:otherwise>

									<li><p class="text">${authInfo.id }님,반갑습니다!</p></li>


									<li><a href="/logout.do"><i class="fa fa-sign-out"></i>
											로그아웃</a></li>
											<li><a href="/board/boardList.do"><i class="fa fa-user"></i>
									게시판</a></li>

								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</c:catch>

			</ul>
		</div>
	</div>

	</nav>
	<div class="container">
		<form action='<c:url value='/board/replyModify.do'/>' method="post">
			<div class="form-group">
				<label for="exampleFormControlInput1">작성자</label> <input type="text"
					class="form-control" id="exampleFormControlInput1" name="ID"
					value="${detail.ID }" readonly>
				<p>${detail.DATE }</p>
			</div>
			<div class="form-group">
				<label for="exampleFormControlTextarea1">내용</label>
				<textarea class="form-control" id="exampleFormControlTextarea1"
					rows="5" name="REPLY">${detail.REPLY }</textarea>
			</div>
			<input type="hidden" value="${detail.RIDX }" name="ridx"> <input
				type="hidden" name="idx" value="${detail.IDX }">
			<button type="submit" class="btn btn-info">수정하기</button>
			<a href='<c:url value='/board/replyDetail.do?idx=${detail.IDX }'/>'
				class="btn btn-info" role="button">뒤로가기</a>
		</form>
	</div>

</body>
</html>