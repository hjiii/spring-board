<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html>
<head>
<!-- jQuery -->

<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

 -->

<script src="${pageContext.request.contextPath}/resources/common/js/jquery-3.3.1.min.js" ></script> 
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Bootstrap CSS -->

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">



<!-- Bootstrap theme -->

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap-theme.min.css">



<!-- common CSS -->

<link rel="stylesheet" href="<c:url value='/resources/common/css/common.css'/>" >


<style>
/*Replace block elements ul and li with inline.*/
/*Navigation bar*/
 {
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
	color : white;
	
}

ul li a:hover {
	color: red;
} 
</style>
</head>
<body>


<!--메뉴바 추가 부분-->

<nav class="navbar navbar-expand-sm navbar-dark bg-dark">

  <a class="navbar-brand" href="/board/boardList.do">spring 게시판</a>

  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample03" aria-controls="navbarsExample03" aria-expanded="false" aria-label="Toggle navigation">

    <span class="navbar-toggler-icon"></span>

  </button>



  <div class="collapse navbar-collapse" id="navbarsExample03">

    <ul class="navbar-nav mr-auto">
	<c:catch>
		<c:choose>
			<c:when test="${empty authInfo }">
				<ul>
					<li><a href="/login.do"><i class="fa fa-sign-in"></i> 로그인</a></li>
					<li><a href="/user/register/step1.do"><i
							class="fa fa-user"></i> 회원가입</a></li>
					<li><a href="/board/boardList.do"><i class="fa fa-user"></i>
							게시판</a></li>
				</ul>
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${row.CREA_ID eq admin}">
						<li>
							<p>관리자 ${authInfo.name }님, 환영합니다.</p>
						</li>
						<li><a href="/logout.do"><i class="fa fa-sign-out"></i>
								로그아웃</a></li>
					</c:when>
					<c:otherwise>
						<ul>
							<li>
								<p>${authInfo.id }님,반갑습니다!</p>
							</li>
							<li><a href="/logout.do"><i class="fa fa-sign-out"></i>
									로그아웃</a></li>
							<li><a href="/infor.do"><i class="fa fa-sign-out"></i>
									회원정보</a></li>		
							<li><a href="/board/boardList.do"><i class="fa fa-user"></i>
									게시판</a></li>
						</ul>
					</c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>
	</c:catch>
    </ul>

  </div>

</nav>






</body>
</html>