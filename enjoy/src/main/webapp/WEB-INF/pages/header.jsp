<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<!-- Bootstrap -->
<link href="builder/css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="builder/js/jquery-3.2.1.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="builder/js/bootstrap.min.js"></script>
<title></title>
</head>
<body>
	<header class="container-fluid">
		<!--导航栏-->
		<div class="row clearfix">
			<nav class="navbar navbar-inverse navbar-fixed-top">
				<div class="container-fluid">
					<div class="navbar-header">
						<!-- 汉堡按钮 -->
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<!-- 导航栏图标 -->
						<a class="navbar-brand" href="index"> 享受·生活 </a>
					</div>
					<!-- 左侧按钮选项 -->
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li><a href="sports">运动健康</a></li>
							<li><a href="sports#store1">购物商城</a></li>
							<li><a href="bbs">社区论坛</a></li>
						</ul>
						<form class="navbar-form navbar-left">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="搜你所想~">
							</div>
							<button type="submit" class="btn btn-default">GO</button>
						</form>
						<!-- 搜索框 -->
						<!-- 右侧按钮 -->
						<ul class="nav navbar-nav navbar-right">
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">加入我们 <span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a data-toggle="modal" data-target="#login" href="#">登陆</a></li>
									<li><a data-toggle="modal" data-target="#register" href="">注册</a></li>
								</ul></li>
						</ul>
					</div>
					<!-- /.navbar-collapse -->
				</div>
				<!-- /.container-fluid -->
			</nav>
		</div>
		<!--登录-->
		<div id="login" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
						<button class="close" data-dismiss="modal">
							<span>&times;</span>
						</button>
					</div>
					<div class="modal-title">
						<h1 class="text-center">登录</h1>
					</div>
					<div class="modal-body">
						<form class="form-group" action="">
							<div class="form-group">
								<label for="">用户名</label> <input class="form-control"
									type="text" placeholder="">
							</div>
							<div class="form-group">
								<label for="">密码</label> <input class="form-control"
									type="password" placeholder="">
							</div>
							<div class="text-right">
								<button class="btn btn-primary" type="submit">登录</button>
								<button class="btn btn-danger" data-dismiss="modal">取消</button>
							</div>
							<a href="" data-toggle="modal" data-dismiss="modal"
								data-target="#register">还没有账号？点我注册</a>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- 注册 -->
		<div id="register" class="modal fade" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
						<button class="close" data-dismiss="modal">
							<span>&times;</span>
						</button>
					</div>
					<div class="modal-title">
						<h1 class="text-center">注册</h1>
					</div>
					<div class="modal-body">
						<form class="form-group" action="">
							<div class="form-group">
								<label for="">用户名</label> <input class="form-control"
									type="text" placeholder="6-15位字母或数字">
							</div>
							<div class="form-group">
								<label for="">密码</label> <input class="form-control"
									type="password" placeholder="至少6位字母或数字">
							</div>
							<div class="form-group">
								<label for="">再次输入密码</label> <input class="form-control"
									type="password" placeholder="至少6位字母或数字">
							</div>
							<div class="form-group">
								<label for="">邮箱</label> <input class="form-control"
									type="email" placeholder="例如:123@123.com">
							</div>
							<div class="text-right">
								<button class="btn btn-primary" type="submit">提交</button>
								<button class="btn btn-danger" data-dismiss="modal">取消</button>
							</div>
							<a href="" data-toggle="modal" data-dismiss="modal"
								data-target="#login">已有账号？点我登录</a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</header>
</body>
</html>