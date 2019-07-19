<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<c:catch>
		<c:choose>
			<c:when test="${empty authInfo }">

			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${authInfo.grade eq '1' }">
						<li>
							<p>관리자 ${authInfo.name }님, 환영합니다.</p>
						</li>
						<li><a href="/logout.do"><i class="fa fa-sign-out"></i> 로그아웃</a>
						</li>
					</c:when>
					<c:otherwise>
						<li>
							<p>${authInfo.name }님,반갑습니다!</p>
						</li>
						<li><a href="/logout.do"><i class="fa fa-sign-out"></i>
								로그아웃</a></li>
						<li><a href="/board/boardList.do"><i class="fa fa-user"></i>
								게시판</a></li>
					</c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>
	</c:catch>


</body>
</html>