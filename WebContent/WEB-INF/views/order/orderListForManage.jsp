<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta name="description" content="orderListForManage.jsp">
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
		$('#orderTable').dataTable();
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
				        	<table class="table table-striped table-bordered table-hover" id="orderTable">
				            	<thead>
				            		<tr>
				            			<th style="text-align: center; vertical-align: middle; width: 10px;">ID</th>
				            			<th style="text-align: center; vertical-align: middle; width: 10px;">제목</th>
				            			<th style="text-align: center; vertical-align: middle; width: 10px;">가격</th>
				            			<th style="text-align: center; vertical-align: middle; width: 30px;">주문수량</th>
				            			<th style="text-align: center; vertical-align: middle; width: 10px;">주문금액</th>
				            			<th style="text-align: center; vertical-align: middle; width: 10px;">주문날짜</th>
				            		</tr>
				                </thead>
				                <tbody>
				                	<c:forEach items="${orderList}" var="orderList">
				                		<tr>
				                			<td style="text-align: center; vertical-align: middle;">${orderList.ID}</td>
				                			<td style="text-align: center; vertical-align: middle;">${orderList.TITLE}</td>
				                			<td style="text-align: center; vertical-align: middle;">${orderList.PRICE}</td>
				                			<td style="text-align: center; vertical-align: middle;">${orderList.ORDER_COUNT}</td>
				                			<td style="text-align: center; vertical-align: middle;">${orderList.ORDER_PRICE}</td>
				                			<td style="text-align: center; vertical-align: middle;">${orderList.ORDER_DATE}</td>
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