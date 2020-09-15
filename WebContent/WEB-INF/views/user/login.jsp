<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta name="description" content="login.jsp">
<meta http-equiv="X-UA-Compatible" content="IE=edge" charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="author" content="">
<title>KW BOOKSTORE</title>

<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
<link href="${context}/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
<link href="${context}/css/sb-admin-2.css" rel="stylesheet">
<link href="${context}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<script src="${context}/js/jquery.js"></script>
<script src="${context}/js/bootstrap.min.js"></script>
<script src="${context}/js/plugins/metisMenu/metisMenu.min.js"></script>
<script src="${context}/js/sb-admin-2.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		$("#pw").keydown(function (key){
			if(key.keyCode == 13) {
				fn_ajaxLoginCheck();
			}
		});
	});

	function fn_ajaxLoginCheck(){
		var id = $("#id").val();
		var pw = $("#pw").val();
		var param = {};
		
		param["id"] = id;
		param["pw"] = pw;
		
		$.ajax({
			url:"${context}/kw/user/ajaxLoginCheck.do",
			contentType:"application/json",
			dataType:"json",
			data:param,
			success:function(result){
				if(result['loginYn'] == 'success'){
					alert("로그인에 성공하였습니다.");
					$("#loginFrm").submit();
				}
				else{
					alert("로그인에 실패하셨습니다.");
					$("#id").val('');
					$("#pw").val('');
				}
			}
		});
	}
</script>
</head>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>
<div id="jumbotron" class="container">
	<div class="jumbotron jumbotron-info" style="background-color: lightgray;">
		<h1><font color="black"><strong>LOGIN</strong>&nbsp;<span class="glyphicon glyphicon glyphicon-pencil"></span></font></h1>
		<p>KW BOOKSTORE에 오신것을 진심으로 환영합니다.</p>
	</div>
</div>

<div class="container">
	<div class="row">
		<div class="col-md-4 col-md-offset-4">
        	<div class="login-panel panel panel-default"  style="margin-bottom: 57%;">
            	<div class="panel-heading">
                	<h3 class="panel-title">Please Sign In</h3>
                </div>
                
                <div class="panel-body">
                	<form id="loginFrm" action="${context}/kw/user/login.do" method="post" role="form">
                		<fieldset>
                			<div class="form-group">
                				<input class="form-control" type="text" placeholder="ID" name="id" id="id" autofocus />
                			</div>
                			<div class="form-group">
                				<input class="form-control" type="password" placeholder="PW" name="pw" id="pw" />
                			</div>
                			<div class="form-group">
                				<span style="float:left;">
                					<a href="${context}/user/idFind.jsp">ID찾기</a>|
                					<a href="${context}/user/pwFind.jsp">PW찾기</a>
                				</span>
                				<span style="float:right;">
                					<a href="${context}/kw/user/createUser.do">회원가입</a>
                				</span>
                			</div>
                			<button class="btn btn-lg btn-success btn-block" type="button" onclick="fn_ajaxLoginCheck();">Login</button>
                		</fieldset>
                	</form>
                </div>
            </div>
       </div>
	</div>
</div>
</body>
</html>