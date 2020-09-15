<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta name="description" content="stockRegisterU.jsp">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>KW BOOKSTORE</title>

<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
<link href="${context}/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
<link href="${context}/css/plugins/dataTables.bootstrap.css" rel="stylesheet">
<link href="//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css" rel="stylesheet" >
<link href="${context}/css/sb-admin-2.css" rel="stylesheet">
<link href="${context}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<script src="${context}/js/jquery-1.9.1.js"></script>
<script src="${context}/js/jquery.form.js"></script>
<script src="${context}/js/bootstrap.min.js"></script>
<script src="${context}/js/plugins/metisMenu/metisMenu.min.js"></script>
<script src="${context}/js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="${context}/js/plugins/dataTables/dataTables.bootstrap.js"></script>
<script src="${context}/js/sb-admin-2.js"></script>
<script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>

<script>
	$(document).ready(function(){
		fn_init();
	});
	
	function fn_bookRegister(){
		if(confirm("수정하시겠습니까?")){
			if(!fn_validation()) return;
			
			alert("도서정보가 변경되었습니다.");
			
			$("#updateBook").submit();
		}
	}
</script>

</head>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="container">
		<div class="jumbotron jumbotron-info" style="background-color: lightgray;">
			<h1><font color="black"><strong>도서수정</strong>&nbsp;<span class="glyphicon glyphicon-list-alt"></span></font></h1>
			<p>도서수정 페이지입니다.</p>
		</div>
	</div>
	
	<div class="container">
		<form id="updateBook" action="${context}/kw/book/updateBook.do" method="post" role="form">
			<div class="form-horizontal">
				<div class="form-group" style="margin-top: 5%;">
					<label for="bookName" class="control-label col-md-2"><b>도서 제목</b></label>
					<div class="col-md-4">
						<input class="form-control" type="hidden" value="${book.bookNum}" name="bookNum" id="bookNum" />
						<input class="form-control" type="text" placeholder="${book.bookName}" name="bookName" id="bookName" required="required" autofocus="autofocus" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-2" for="bookWriter"><b>작가</b></label>
					<div class="col-md-3">
						<input class="form-control" type="text" placeholder="${book.bookWriter}" name="bookWriter" id="bookWriter" required="required" autofocus="autofocus" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-2" for="bookPublish"><b>출판사</b></label>
					<div class="col-md-3">
						<input class="form-control" type="text" placeholder="${book.bookPublish}" name="bookPublish" id="bookPublish" required="required" autofocus="autofocus" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-2" for="bookPrice"><b>단가</b></label>
					<div class="col-md-3">
						<input class="form-control" type="text" placeholder="${book.bookPrice}" name="bookPrice" id="bookPrice" required="required" autofocus="autofocus" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-2" for="bookCount"><b>수량</b></label>
					<div class="col-md-3">
						<input class="form-control" type="text" placeholder="${book.bookCount}" name="bookCount" id="bookCount" required="required" autofocus="autofocus" />
					</div>
				</div>
				<br>
				<div class="form-group">
					<div class="col-md-1 col-md-offset-5">
						<button type="button" class="btn btn-success" onclick="fn_bookRegister()">수정하기</button>
					</div>
					<div class="col-md-1">
						<button type="button" class="btn btn-success" onclick="fn_back()">뒤로가기</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>