<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta name="description" content="userList.jsp">
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
		$('#userTable').dataTable();	
	});
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
						<table class="table table-striped table-bordered table-hover" id="userTable">
							<thead>
								<tr>
									<th style="text-align:center; vertical-align:middle; width:10px;">ID</th>
									<th style="text-align:center; vertical-align:middle; width:10px;">이메일</th>
									<th style="text-align:center; vertical-align:middle; width:40px;">이름</th>
									<th style="text-align:center; vertical-align:middle; width:60px;">우편번호</th>
									<th style="text-align:center; vertical-align:middle; width:180px;">주소</th>
									<th style="text-align:center; vertical-align:middle; width:100px;">휴대폰번호</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${userList}" var="userList">
									<tr>
										<td style="text-align:center; vertical-align:middle;">${userList.id}</td>
										<td style="text-align:center; vertical-align:middle;">${userList.email}</td>
										<td style="text-align:center; vertical-align:middle;">${userList.name}</td>
										<td style="text-align:center; vertical-align:middle;">${userList.postNum}</td>
										<td style="text-align:center; vertical-align:middle;">${userList.address}</td>
										<td style="text-align:center; vertical-align:middle;">${userList.phoneNum}</td>
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