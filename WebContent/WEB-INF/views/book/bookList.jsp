<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta name="description" content="bookList.jsp">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>KW BOOKSTORE</title>

<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
<link href="${context}/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
<link href="${context}/css/plugins/dataTables.bootstrap.css" rel="stylesheet">
<link href="${context}/css/sb-admin-2.css" rel="stylesheet">
<link href="${context}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<script src="${context}/js/jquery-1.9.1.js"></script>
<script src="${context}/js/bootstrap.min.js"></script>
<script src="${context}/js/plugins/metisMenu/metisMenu.min.js"></script>
<script src="${context}/js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="${context}/js/plugins/dataTables/dataTables.bootstrap.js"></script>
<script src="${context}/js/sb-admin-2.js"></script>

<script>
	$(document).ready(function(){
		$('#bookTable').dataTable();	
	});
	
	function fn_detailBook(paramBookNum){
		location.href = "${context}/kw/book/retrieveBook.do?bookNum=" + paramBookNum;
	}
</script>

</head>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>
<div id="jumbotron" class="container">
	<br><br>
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="table-responsive">
						<table class="table table-striped table-bordered table-hover" id="bookTable">
							<thead>
								<tr>
									<th style="text-align:center; vertical-align:middle; width:50px;">제목</th>
									<th style="text-align:center; vertical-align:middle; width:40px;">작가</th>
									<th style="text-align:center; vertical-align:middle; width:40px;">출판사</th>
									<th style="text-align:center; vertical-align:middle; width:20px;">가격</th>
									<th style="text-align:center; vertical-align:middle; width:20px;">재고</th>
									<th style="text-align:center; vertical-align:middle; width:5px;">자세히보기</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${bookList}" var="bookList">
									<tr>
										<td style="text-align:center; vertical-align:middle;">${bookList.bookName}</td>
										<td style="text-align:center; vertical-align:middle;">${bookList.bookWriter}</td>
										<td style="text-align:center; vertical-align:middle;">${bookList.bookPublish}</td>
										<td style="text-align:center; vertical-align:middle;">${bookList.bookPrice}</td>
										<td style="text-align:center; vertical-align:middle;">${bookList.bookCount}</td>
										<td style="text-align:center; vertical-align:middle;">
											<button class="btn btn-warning" type="button" onclick="fn_detailBook('${bookList.bookNum}')">
												자세히보기
											</button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
			            </table>
			        </div>
			    </div>
			</div>
		</div>
	</div>
</div>
</body>
</html>