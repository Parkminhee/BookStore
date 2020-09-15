<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta name="description" content="userU.jsp">
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
	var dong;
	
	$(document).ready(function(){
		fn_init();
		
		$("#dong").keydown(function(key){
			if(key.keyCode == 13){
				fn_addressCheck();
			}
		});
		fn_setDetailInfo();
	});
	
	function fn_setDetailInfo(){
		$("#id").val('${user.id}');
		$("#email").val('${user.email}');
		$("#name").val('${user.name}');
		
		var phoneArr = '${user.phoneNum}'.split("-");
		var postNumArr = '${user.postNum}'.split("-");
		var addressArr = '${user.address}'.split("/");
		
		$("#phoneCd").val(phoneArr[0]);
		$("#phone1").val(phoneArr[1]);
		$("#phone2").val(phoneArr[2]);
		
		$("#postNum1").val(postNumArr[0]);
		$("#postNum2").val(postNumArr[1]);
		
		$("#address1").val(addressArr[0]);
		$("#address2").val(addressArr[1]);
	}
	
	function fn_setData(self){
		var postAll = self.children().text();
		var postSplit = postAll.split(" ");
		var zipcode = postSplit[0].split("-");
		var postNum1 = zipcode[0];
		var postNum2 = zipcode[1];
		var sido = postSplit[1];
		var gugun = postSplit[2];
		var dong = postSplit[3];
		var subDong = postSplit[4];
		
		if(subDong == null) subDong = "";
		
		var detailAddress = sido + " " + gugun + " " + dong + " " + subDong;
		
		$("#postNum1").val(postNum1);
		$("#postNum2").val(postNum2);
		$("#address1").val(detailAddress);
		
		$("#searchAddress").modal('hide');
	}
	
	function fn_addressCheck(){
		dong = $("#dong").val();
		
		if(dong == ""){
			alert("동을 입력하세요.");
			return;
		}
		
		$("#addressBody").children().remove();
		
		var headHtml = "<tr><td style='text-align:center;'><a onclick=javascript:fn_setData($(this))><b>";
		var backHtml = "</b></a></td></tr>";
		var appendHtml = "";
		var param = {};
		
		param["dong"] = dong;
		
		$.ajax({
			url:"${context}/kw/user/retrievePostByDong.do",
			contentType:"application/json",
			dataType:"json",
			data:param,
			success:function(result){
				for(var i = 0; i < result.length; i++){
					appendHtml
						+= headHtml
						+ result[i].zipcode + " "
						+ result[i].sido + " "
						+ result[i].gugun + " "
						+ result[i].dong + " "
						+ backHtml;
				}
				
				$("#addressBody").append(appendHtml);
			}
		});
	}
	
	function fn_join(){
		if(!fn_validation()) return;
		if(confirm("수정하시겠습니까?")) {
			$("#phoneNum").val($("#phoneCd").val() + "-" + $("#phone1").val() + "-" + $("#phone2").val());
			$("#postNum").val($("#postNum1").val() + "-" + $("#postNum2").val());
			$("#address").val($("#address1").val() + "/" + $("#address2").val());
			
			$("#joinFrm").submit();
		}
	}
	
	function fn_idCheck(){
		var id = $("#id").val();
		var access = $("#message");
		
		$.ajax({
			url:"${context}/kw/user/idCheck.do?id=" + id,
			success:function(result){
				var result_n = result.replace(/"/gi, "");
				var splitResult = result_n.split("@");
				access.html(splitResult[0]);
				
				$("#flag").val(splitResult[1]);
			}
		})
	}
</script>

</head>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="container">
		<div class="jumbotron jumbotron-info" style="background-color: lightgray;">
			<h1><font color="black"><strong>정보수정</strong>&nbsp;<span class="glyphicon glyphicon glyphicon-pencil"></span></font></h1>
			<p>${sessionScope.id}님의 마이페이지입니다.</p>
		</div>
	</div>
	
	<div class="container">
		<form id="joinFrm" action="${context}/kw/user/updateUser.do" method="post" role="form">
			<div class="form-horizontal">
				<hr/>
				<div class="form-group" style="margin-top:5%;">
					<label for="id" class="control-label col-md-2"><b>아이디</b></label>
					<div class="col-md-4">
						<input class="form-control" type="text" name="id" id="id" disabled="disabled" required="required" autofocus="autofocus" onkeyup="fn_idCheck()" />
					</div>
					<p id="message"></p>
					<input type="hidden" name="flag" id="flag" value="false" />
				</div>
				
				<div class="form-group">
					<label for="pw" class="control-label col-md-2"><b>비밀번호</b></label>
					<div class="col-md-4">
						<input class="form-control" type="password" name="pw" id="pw" required="required" />
					</div>
				</div>
				
				<div class="form-group">
					<label for="email" class="control-label col-md-2"><b>이메일</b></label>
					<div class="col-md-4">
						<input class="form-control" type="email" name="email" id="email" required="required" />
					</div>
				</div>
				
				<div class="form-group">
					<label for="name" class="control-label col-md-2"><b>성명</b></label>
					<div class="col-md-4">
						<input class="form-control" type="text" name="name" id="name" required="required" />
					</div>
				</div>
				
				<div class="form-group">
					<label for="phoneCd" class="control-label col-md-2"><b>연락처</b></label>
					<div class="col-md-2">
						<select class="form-control" name="phoneCd" id="phoneCd" required="required">
							<option>010</option>
							<option>011</option>
						</select>
					</div>
					<div class="col-md-2">
						<input class="form-control" type="text" name="phone1" id="phone1" maxlength="4" required="required" />
					</div>
					<div class="col-md-2">
						<input class="form-control" type="text" name="phone2" id="phone2" maxlength="4" required="required" />
					</div>
					<input type="hidden" name="phoneNum" id="phoneNum" />
				</div>
				
				<div class="form-group">
					<label for="address1" class="control-label col-md-2"><b>주소</b></label>
					<div class="col-md-2">
						<input class="form-control" type="text" name="postNum1" id="postNum1" disabled="disabled" required="required" />
					</div>
					<div class="col-md-2">
						<input class="form-control" type="text" name="postNum2" id="postNum2" disabled="disabled" required="required" />
					</div>
					<span class="col-md-1">
						<button class="btn btn-info" type="button" data-toggle="modal" data-target="#searchAddress"><b>주소검색</b></button>
					</span>
					<input type="hidden" name="postNum" id="postNum" />
				</div>
				
				<div class="form-group">
					<label for="address1" class="control-label col-md-2"><b>상세주소</b></label>
					<div class="col-md-6">
						<input class="form-control" type="text" name="address1" id="address1" disabled="disabled" required="required" />
					</div>
				</div>
				
				<div class="form-group">
					<label for="address2" class="control-label col-md-2"></label>
					<div class="col-md-6">
						<input class="form-control" type="text" name="address2" id="address2" />
					</div>
					<input type="hidden" name="address" id="address" />
				</div>
				
				<div class="form-group">
					<div class="col-md-offset-3 col-md-1">
						<button class="btn btn-success" type="button" onclick="fn_back()">뒤로가기</button>
					</div>
					<div class="col-md-1">
						<button class="btn btn-primary" type="button" name="btnSubmit" id="btnSubmit" onclick="fn_join()">수정하기</button>
					</div>
				</div>
			</div>			
		</form>
	</div>
	
	<div class="container">
		<div class="modal fade" id="searchAddress" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button class="close" type="button" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">주소검색</h4>
					</div>
					
					<div class="modal-body" style="height:50px;">
						<div class="col-md-6">
							<input class="form-control" type="text" name="dong" id="dong" placeholder="동을 입력하세요. EX)역삼1동" />
						</div>
						<div class="col-md-1">
							<button class="btn btn-primary" type="button" id="addressCheck" onclick="fn_addressCheck()">확인</button>
						</div>
					</div>
					
					<div class="modal-footer">
						<div class="col-md-12">
							<div class="table-responsive">
			                	<table class="table table-striped table-bordered table-hover" id="dataTables-example">
			                    	<thead>
			                        	<tr>
			                        		<th style="text-align: center; vertical-align: middle; ">주소</th>
			                        	</tr>
			                    	</thead>
			                    	<tbody id="addressBody">
			                    	</tbody>
			                	</table>
			            	</div>
						</div>
						<button class="btn btn-default" type="button" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>