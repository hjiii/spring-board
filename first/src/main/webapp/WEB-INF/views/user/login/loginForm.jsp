<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@ include file="/WEB-INF/views/includes/00_head.jsp" %>

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
		.login{
			padding-top:10%;
			padding-left:30%;
			padding-right:30%;
		}
	 ul{
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Spring Board</title>
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

    </ul>

  </div>

</nav>



<div class="login">
	<h1 style="text-align:center">LOGIN</h1>
   <div class="panel-body">
      <form:form role="form" commandName="loginCommand" action="/login.do"
         method="post">
         <fieldset>
            <div class="form-group">
               <form:input type="text" class="form-control" placeholder="ID"
                  path="id" />
               <form:errors path="id" />
            </div>
            <div class="form-group">
               <form:password class="form-control" placeholder="Password"
                  path="pw" />
               <form:errors path="pw" />
            </div>
            <div class="checkbox">
               <label> <form:checkbox path="rememberId" />아이디 기억
               </label>
            </div>
            <button type="submit" class="btn btn-lg btn-success btn-block">로그인</button>
         </fieldset>
      </form:form>
   </div>

</div>

</body>
</html>