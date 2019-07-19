<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Spring Board</title>
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
* {
	font-size: 15px;
}

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

.text {
	color: white;
	font-size: 10px;
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
								<c:when test="${authInfo.id eq 'admin'}">

									<li><p class="text">관리자 ${authInfo.id }님, 환영합니다.</p></li>
									<li><a href="/logout.do"><i class="fa fa-sign-out"></i>
											로그아웃</a></li>
								</c:when>
								<c:otherwise>

									<li><p class="text">${authInfo.id }님,반갑습니다!</p></li>


									<li><a href="/logout.do"><i class="fa fa-sign-out"></i>
											로그아웃</a></li>
									<li><a href="/board/boardList.do"><i
											class="fa fa-user"></i> 게시판</a></li>
											<li><a href="/board/boardList2.do"><i
											class="fa fa-user"></i> 게시판</a></li>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</c:catch>

			</ul>
		</div>
	</div>

	</nav>

	<div class="container"  style="padding-top:50px">


		<h2>게시판 목록</h2>

		<table class="table">
			<thead>
				<tr>
					<th scope="col" style="width: 20%">제목</th>
					<!-- 					<th scope="col" style="width: 30%">내용</th>
 -->
					<th scope="col" style="width: 15%">작성자</th>

					<th scope="col" style="width: 10%">조회수</th>
					<th scope="col" style="width: 15%">작성일</th>
				</tr>
			</thead>



			<tbody>
				<c:choose>
					<c:when test="${fn:length(list) > 0}">
						<c:forEach items="${list }" var="row">
							<tr>
								<td><a
									href="<c:url value='/board/boardDetail.do?idx=${row.IDX }'/>"
									class="text-dark">${row.TITLE }</a></td>
								<td>${row.CREA_ID }</td>
								<td>${row.HIT_CNT }</td>
								<td>${row.CREA_DATE }</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4">조회된 결과가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>

		</table>

		<c:catch>
			<c:choose>
				<c:when test="${empty authInfo }">
					<div style="text-align: center">
						<a href='<c:url value='/login.do'/>' role="button"
							class="btn btn-outline-info">글쓰기</a>
					</div>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${authInfo.id eq 'admin'}">

							<div style="text-align: center">
								<a href='<c:url value='/board/boardWrite.do'/>' role="button"
									class="btn btn-outline-info">공지 작성</a>
							</div>
						</c:when>
						<c:otherwise>
							<div style="text-align: center">
								<a href='<c:url value='/board/boardWrite.do'/>' role="button"
									class="btn btn-outline-info">${authInfo.id } 님 글쓰기</a>
							</div>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
		</c:catch>

		<br> <br> <br>
		<ul class="btn-group pagination">
			<c:if test="${pageMaker.prev }">
				<li><a
					href='<c:url value="/board/boardList.do?page=${pageMaker.startPage-1 }"/>'><i
						class="fa fa-chevron-left"></i></a></li>
			</c:if>
			<c:forEach begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }" var="idx">
				<li><a href='<c:url value="/board/boardList.do?page=${idx }"/>'><i
						class="fa">${idx }</i></a></li>
			</c:forEach>
			<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
				<li><a
					href='<c:url value="/board/boardList.do?page=${pageMaker.endPage+1 }"/>'><i
						class="fa fa-chevron-right"></i></a></li>
			</c:if>
		</ul>


	</div>


</body>
</html>

