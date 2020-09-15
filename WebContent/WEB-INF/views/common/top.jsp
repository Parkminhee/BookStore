<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KW BOOKSTORE</title>

<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
<link href="${context}/css/common.css" rel="stylesheet">
<script src="${context}/js/common.js"></script>
<script src="${context}/js/bootstrap.min.js"></script>
<style type="text/css">
li{
	cursor: pointer;
}
a{
	text-decoration:none !important;
}
</style>
</head>

<c:set var="homeUrl">${context}/kw/user/goMain.do</c:set>

<body>
<nav class="collapse navbar-collapse bs-navbar-collapse" role="nagivation">
	<div class="container" style="background-color:black;">
		<ul class="nav navbar-nav">
			<li><a href="${homeUrl}"><font color="white"><strong>KW BOOKSTORE</strong></font></a></li>
			
			<li>
				<c:if test="${sessionScope.id != null && sessionScope.grade != 'A'}">
					<a href="${context}/kw/book/retrieveBookListForCustomer.do"><font color="white"><strong>도서검색</strong></font></a>
				</c:if>
				<c:if test="${sessionScope.id != null && sessionScope.grade == 'A'}">
					<a href="${context}/kw/book/retrieveBookListForManage.do"><font color="white"><strong>도서관리</strong></font></a>
				</c:if>
			</li>
			<li>
				<c:if test="${sessionScope.id != null && sessionScope.grade != 'A'}">
					<a href="${context}/kw/cart/retrieveCartList.do"><font color="white"><strong>장바구니</strong></font></a>
				</c:if>
				<c:if test="${sessionScope.id != null && sessionScope.grade == 'A'}">
					<a href="${context}/kw/user/retrieveUserListForManage.do"><font color="white"><strong>회원관리</strong></font></a>
				</c:if>
			</li>
			<li>
				<c:if test="${sessionScope.id != null && sessionScope.grade != 'A'}">
					<a href="${context}/kw/order/retrieveOrderListForCustomer.do"><font color="white"><strong>구매내역</strong></font></a>
				</c:if>
				<c:if test="${sessionScope.id != null && sessionScope.grade == 'A'}">
					<a href="${context}/kw/order/retrieveOrderListForManage.do"><font color="white"><strong>주문관리</strong></font></a>
				</c:if>
			</li>
			<li>
				<c:if test="${sessionScope.id == null}">
					<a href="${context}/kw/user/createUser.do"><font color="white"><strong>회원가입</strong></font></a>
				</c:if>
				<c:if test="${sessionScope.id != null && sessionScope.grade != 'A'}">
					<a href="${context}/kw/user/updateUser.do"><font color="white"><strong>정보수정</strong></font></a>
				</c:if>
			</li>
			<li>
				<c:if test="${sessionScope.id == null}">
					<a href="${context}/kw/user/goLogin.do"><font color="white"><strong>LOGIN</strong></font></a>
				</c:if>
				<c:if test="${sessionScope.id != null}">
					<a href="${context}/kw/user/logout.do"><font color="white"><strong>LOGOUT</strong></font></a>
				</c:if>
			</li>
		</ul>
	</div>
</nav>

<div class="container" style="background-color: white; margin-bottom: 2%;">
	
</div>
</body>
</html>