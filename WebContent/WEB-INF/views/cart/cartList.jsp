<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta name="description" content="cartListR.jsp">
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
		$('#cartTable').dataTable();
	});
	
	function fn_buy(paramCartNum, paramBookNum, paramCartPrice, paramCartCount){
		if(confirm("구매하시겠습니까?")){
			location.href = "${context}/kw/order/createOrder.do?cartNum=" + paramCartNum + 
					"&bookNum=" + paramBookNum + "&orderPrice=" + paramCartPrice +
					"&orderCount=" + paramCartCount + "&fromCart=true";
		}
	}
	
	function fn_delete(paramCartNum, paramBookNum, paramBookCount){
		if(confirm("삭제하시겠습니까?")){
			location.href = "${context}/kw/cart/deleteCart.do?cartNum=" + paramCartNum + "&bookNum="
					+ paramBookNum + "&bookCount=" + paramBookCount;
		}
	}
</script>

</head>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>
	<div id="jumbotron" class="container">
		<div class="jumbotron jumbotron-info" style="background-color: lightgray;">
			<h1><font color="black"><strong>장바구니</strong>&nbsp;<span class="glyphicon glyphicon-shopping-cart"></span></font></h1>
			<p>${sessionScope.id}님의 장바구니입니다.</p>
		</div>
		
		<div class="row">
			<div class="col-md-12">
			    <div class="panel panel-default">
			    	<div class="panel-body">
			            <div class="table-responsive">
			                <table class="table table-striped table-bordered table-hover" id="cartTable">
			                	<thead>
			                        <tr>
			                        	<th style="text-align: center; vertical-align: middle; width: 50px;">제목</th>
			                            <th style="text-align: center; vertical-align: middle; width: 20px;">단가</th>
			                            <th style="text-align: center; vertical-align: middle; width: 40px;">결제수량</th>
			                            <th style="text-align: center; vertical-align: middle; width: 30px;">결제금액</th>
			                            <th style="text-align: center; vertical-align: middle; width: 30px;">구매 / 삭제</th>
			                        </tr>
			                    </thead>
			                    <tbody>
			                    	<c:forEach items="${cartList}" var="cartList">
			                    		<tr>
			                    			<input type="hidden" value="${cartList.SEQ}" />
			                    			<td style="text-align: center; vertical-align: middle;">${cartList.TITLE}</td>
			                    			<td style="text-align: center; vertical-align: middle;">${cartList.PRICE}</td>
			                    			<td style="text-align: center; vertical-align: middle;">${cartList.CART_COUNT}</td>
			                    			<td style="text-align: center; vertical-align: middle;">${cartList.CART_PRICE}</td>
			                    			<td style="text-align: center; vertical-align: middle;">
												<button type="button" class="btn btn-primary" onclick="fn_buy('${cartList.SEQ}', '${cartList.BOOK_NUM}', '${cartList.CART_PRICE}', '${cartList.CART_COUNT}')">구매</button>
			                            		<button type="button" class="btn btn-danger" onclick="fn_delete('${cartList.SEQ}', '${cartList.BOOK_NUM}', '${cartList.CART_COUNT}')">삭제</button>
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