<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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
*{
	font-size : 15px;
}

/*Replace block elements ul and li with inline.*/
/*Navigation bar*/
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
.align{
	display:inline;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<div class="container" >
		<div class="card-body" style="float: left">
			<a href='<c:url value='/board/boardList.do'/>' class="btn btn-info"
				role="button">목록으로</a><br> <br>

		</div>

		<div class="card-body" style="text-align: right">
			<c:if test="${empty authInfo }">

				<a href='<c:url value='/login.do'/>' class="btn btn-info"
					role="button">로그인</a>
			</c:if>
			<c:if test="${detail.CREA_ID eq authInfo.id ||authInfo.id eq 'admin'}">
				<a href='<c:url value='/board/boardUpdate.do?idx=${detail.IDX }'/>'
					class="btn btn-info" role="button">수정</a>
				<a href='<c:url value='/board/boardDelete.do?idx=${detail.IDX }'/>'
					class="btn btn-info" role="button">삭제</a>
			</c:if>
		</div>
		<br> <br>
		<div class="align">
		<div class="card">
			<div class="card-body" style="border: 1px solid silver;">

				<h4 class="card-title mb-3" style="text-align: center">${detail.TITLE }</h4>
				<hr>
				<ul>
					<li style="color:black; font-weight:lighter">작성자 : ${detail.CREA_ID }</li>
					<li style="color:black; font-weight:lighter">작성 시간 : ${detail.CREA_DATE }</li>
					<li style="color:black; font-weight:lighter">조회수 : ${detail.HIT_CNT }</li>
				</ul>
				<hr>
				<br>
				<p class="card-text" style="text-align: center; font-size:large">${detail.CONTENTS }</p>
				<br>
			</div>
		</div>

		<br>
		<div >
		<br><br><br>
			<h5 style="text-align:center">댓글</h5>
			<h4 class="card-title mb-3" style="text-align: center">${detail.reply_id }</h4>
			<p class="card-text" style="text-align: center">${detail.reply }</p>


			<c:catch>
				<c:choose>
					<c:when test="${empty authInfo }">

						<c:url value="/ReplyInsert.do" var="insertReply" />
						<form method="post" action="${insertReply}">
							<div class="form-group">

								<input type="hidden" name="reply_idx" value=${detail.IDX }> <label
									for="exampleFormControlInput2">작성자</label> 
									<input type="text" class="form-control"
									id="exampleFormControlInput2" name="reply_id" disabled />
							</div>
							<div class="form-group">
								<label for="exampleFormControlTextarea2">내용</label>
								<textarea class="form-control" id="exampleFormControlTextarea2"
									placeholder="댓글을 입력하려면 로그인하세요" name="reply" rows="3" disabled /></textarea>
							</div>

						</form>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${authInfo.id eq 'admin'}">

								<c:url value="/ReplyInsert.do" var="insertReply" />
								<form method="post" action="${insertReply}">

									<input type="hidden" value="${detail.IDX }" name="idx">
									<a
										href='<c:url value='/board/replyDetail.do?idx=${detail.IDX }'/>'
										class="btn btn-info" role="button">댓글보기</a>
								</form>
							</c:when>
							<c:otherwise>
								<c:url value="/ReplyInsert.do" var="insertReply" />
								<form method="post" action="${insertReply}">
									<div class="form-group">

										<input type="hidden" name="reply_idx" value=${detail.IDX }> 
										 <label
											for="exampleFormControlInput2">작성자</label> <input type="text"
											class="form-control" id="exampleFormControlInput2"
											name="reply_id" value=${authInfo.id } readonly />
									</div>
									<div class="form-group">
										<label for="exampleFormControlTextarea2">내용</label>
										<textarea class="form-control"
											id="exampleFormControlTextarea2" name="reply" rows="3"></textarea>
									</div>
									<input type="hidden" value="${detail.IDX }" name="idx">

									<button type="submit" class="btn btn-info">등록하기</button>
									<a
										href='<c:url value='/board/replyDetail.do?idx=${detail.IDX }'/>'
										class="btn btn-info" role="button">댓글보기</a>
								</form>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</c:catch>

		</div>

	</div>
</div>
</body>
</html>