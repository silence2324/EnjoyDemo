<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">

	<title>后台报表管理员登陆</title>

	<!-- Custom fonts for this template-->
	<link href="builder/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

	<!-- Custom styles for this template-->
	<link href="builder/css/sb-admin.css" rel="stylesheet">

</head>

<body class="bg-dark">

<div class="container">
	<div class="card card-login mx-auto mt-5">
		<div class="card-header">登陆</div>
		<div class="card-body">
			<form>
				<div class="form-group">
					<div class="form-label-group">
						<input type="username" id="inputUsername" class="form-control" placeholder="请输入管理员账号" required="required" autofocus="autofocus">
						<label for="inputUsername">账号</label>
					</div>
				</div>
				<div class="form-group">
					<div class="form-label-group">
						<input type="password" id="inputPassword" class="form-control" placeholder="请输入密码" required="required">
						<label for="inputPassword">密码</label>
					</div>
				</div>
				<%--<div class="form-group">--%>
					<%--<div class="checkbox">--%>
						<%--<label>--%>
							<%--<input type="checkbox" value="remember-me">--%>
							<%--记住登陆--%>
						<%--</label>--%>
					<%--</div>--%>
				<%--</div>--%>
				<a id="adLogin" class="btn btn-primary btn-block" href="#">登陆</a>
			</form>
			<div class="text-center">
				<%--<a class="d-block small mt-3" href="register.html">Register an Account</a>--%>
				<%--<a class="d-block small" href="forgot-password.html">Forgot Password?</a>--%>
				<p class="login-box-msg">请使用管理员账号登陆</p>
			</div>
		</div>
	</div>
</div>

<!-- Bootstrap core JavaScript-->
<script src="builder/vendor/jquery/jquery.min.js"></script>
<script src="builder/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="builder/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- 登陆校验 -->
<script>
    $(function () {
        $("#adLogin").click(doLogin);
    });
    function doLogin(){
        var params={
            username:$("#inputUsername").val(),
            password:$("#inputPassword").val()
            // isRememberMe:$("#rememberId").prop("checked")
        }
        var url="adminLogin";
        console.log("params",params);
        $.post(url,params,function(result){
            if(result.state==1){
                alert("登陆成功，请使用")
                //跳转到indexUI对应的页面
                location.href="adminIndex?t="+Math.random();
            }else{
                $(".login-box-msg").html(result.message);
            }
            return false;//防止刷新时重复提交
        });
    }
</script>

</body>

</html>
