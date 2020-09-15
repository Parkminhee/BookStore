<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta name="description" content="productR.jsp">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KW BOOKSTORE</title>

<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
<link href="${context}/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
<link href="${context}/css/plugins/social-buttons.css" rel="stylesheet">
<link href="${context}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css" rel="stylesheet" >
<link href="${context}/css/plugins/dataTables.bootstrap.css" rel="stylesheet">
<link href="${context}/css/process.css" rel="stylesheet">

<script src="${context}/js/jquery-1.9.1.js"></script>
<script src="${context}/js/jquery.form.js"></script>
<script src="${context}/js/plugins/metisMenu/metisMenu.min.js"></script>
<script src="${context}/js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="${context}/js/plugins/dataTables/dataTables.bootstrap.js"></script>
<script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>

<script type="text/javascript">
	var stockTotal;
	var priceTotal;

	$(document).ready(function(){
		var action;
		var stock = '${book.bookCount}';
		var price = '${book.bookPrice}';
		
		stockTotal = 1;
		priceTotal = price;
		
		$(".number-spinner button").mousedown(function () {
			btn = $(this);
            input = btn.closest('.number-spinner').find('input');
            btn.closest('.number-spinner').find('button').prop("disabled", false);
            
            if (btn.attr('data-dir') == 'up') {
                action = setInterval(function(){
                    if ( input.attr('max') == undefined || parseInt(input.val()) < parseInt(input.attr('max')) ) {
                    	if(stock <= parseInt(input.val())){
                    		alert("죄송합니다.\n재고가 " + stock + "개 남았습니다");
                    		clearInterval(action);
                    	}else{
                    		input.val(parseInt(input.val())+1);
                            $("#price").text(parseInt(price) * parseInt(input.val()) + "원");
                            priceTotal = parseInt(price) * parseInt(input.val());
                            stockTotal = parseInt(input.val());
                    	}

                    }else{
                        btn.prop("disabled", true);
                        clearInterval(action);
                    }
                }, 50);
        	}
            else {
                action = setInterval(function(){
                    if ( input.attr('min') == undefined || parseInt(input.val()) > parseInt(input.attr('min')) ) {
                        input.val(parseInt(input.val())-1);
                        $("#price").text(parseInt(price) * parseInt(input.val()) + "원");
                        priceTotal = parseInt(price) * parseInt(input.val());
                        stockTotal = parseInt(input.val());
                    }else{
                        btn.prop("disabled", true);
                        clearInterval(action);
                    }
                }, 50);
        	}
        }).mouseup(function(){
        	clearInterval(action);
        });
		
		if('${book.bookCount}' == 0){
        	$("#buyBtn").attr("disabled", true);
        	$("#cartBtn").attr("disabled", true);
        }
	});
	
	window.onload = function(){
    	$(".replyStar").off("mouseover");
    }
	
	function fn_buy(){
		location.href = "${context}/kw/order/createOrder.do?bookNum=" + '${book.bookNum}' + "&orderPrice=" + priceTotal + "&orderCount=" + stockTotal;
	}
	
	function fn_cart(){
		location.href = "${context}/kw/cart/createCart.do?bookNum=" + '${book.bookNum}' + "&cartPrice=" + priceTotal + "&cartCount=" + stockTotal;
	}
</script>

</head>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>
<div id="junbotron" class="container">
	<div class="row">
		<br>
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="table-responsive">
						<table class="table table-striped table-bordered table-hover" id="bookTable">
							<thead>
								<tr>
									<th style="text-align:center; vertical-align:middle; width:80px;">제목</th>
									<th style="text-align:center; vertical-align:middle; width:50px;">작가</th>
									<th style="text-align:center; vertical-align:middle; width:50px;">출판사</th>
									<th style="text-align:center; vertical-align:middle; width:40px;">가격</th>
									<th style="text-align:center; vertical-align:middle; width:40px;">재고</th>
									<th style="text-align:center; vertical-align:middle; width:10px;">수량</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td style="text-align:center; vertical-align:middle;">${book.bookName}</td>
									<td style="text-align:center; vertical-align:middle;">${book.bookWriter}</td>
									<td style="text-align:center; vertical-align:middle;">${book.bookPublish}</td>
									<td style="text-align:center; vertical-align:middle;">${book.bookPrice}</td>
									<td style="text-align:center; vertical-align:middle;">${book.bookCount}</td>
									<td style="text-align:center; vertical-align:middle;">
										<div class="input-group number-spinner">
											<span class="input-group-btn data-dwn">
												<button class="btn btn-default btn-info" data-dir="dwn"><span class="glyphicon glyphicon-minus"></span></button>
											</span>
											<input type="text" class="form-control text-center" value="1" min="1" max="100" width="100%" disabled="disabled" />
											<span class="input-group-btn data-up">
												<button class="btn btn-default btn-info" data-dir="up"><span class="glyphicon glyphicon-plus"></span></button>
											</span>
										</div>
									</td>
								</tr>
							</tbody>
			            </table>
			        </div>
			    </div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-md-1 col-md-offset-4">
			<button id ="buyBtn" type="button" class="btn btn-primary btn-lg" onclick="fn_buy()">바로구매</button>
		</div>
		<div class="col-md-1 col-md-offset-1">
			<button id ="cartBtn" type="button" class="btn btn-warning btn-lg" onclick="fn_cart()">장바구니</button>
		</div>
	</div>
</div>
</body>
</html>