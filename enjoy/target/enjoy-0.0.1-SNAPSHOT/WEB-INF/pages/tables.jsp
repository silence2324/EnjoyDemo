<%@ page pageEncoding="UTF-8"%>
<%-- 引入JSTL标签库 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>站内统计</title>
<!-- Custom fonts for this template:字体样式-->
<link href="builder/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<!-- Page level plugin CSS:CSS插件 -->
<link href="builder/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">
<!-- Custom styles for this template:sb-admin模板样式 -->
<link href="builder/css/sb-admin.css" rel="stylesheet">
</head>
<body id="page-top">
	<nav class="navbar navbar-expand navbar-dark bg-dark static-top">
		<a class="navbar-brand mr-1" href="index">享受·生活</a>
		<button class="btn btn-link btn-sm text-white order-1 order-sm-0"
			id="sidebarToggle" href="#">
			<i class="fas fa-bars"></i>
		</button>
		<form
			class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
			<div class="input-group"></div>
			</div>
		</form>
		<ul class="navbar-nav ml-auto ml-md-0">
			<li class="nav-item dropdown no-arrow"><a
				class="nav-link dropdown-toggle" href="#" id="userDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-user-circle fa-fw"></i>
			</a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="userDropdown">
					<a class="dropdown-item" href="#" data-toggle="modal"
						data-target="#logoutModal">退出</a>
				</div></li>
		</ul>
	</nav>
	<!-- wrapper:包装器 -->
	<div id="wrapper">
		<!-- Sidebar:侧边栏 -->
		<ul class="sidebar navbar-nav">
			<li class="nav-item"><a class="nav-link" href="showCharts"> <i
					class="fas fa-fw fa-chart-area"></i> <span>图表</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="user_list"> <i
					class="fas fa-fw fa-table"></i> <span>用户列表</span>
			</a></li>
		</ul>
		<div id="content-wrapper">
			<div class="container-fluid">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="adminIndex">首页</a></li>
					<li class="breadcrumb-item"><a href="showCharts">图表</a></li>
				</ol>
				<!-- Area Demo:展示区域-->
				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-table"></i> 用户列表
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th>姓名</th>
										<th>性别</th>
										<th>年龄</th>
										<th>身高(厘米)</th>
										<th>体重(公斤)</th>
										<th>注册时间</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>姓名</th>
										<th>性别</th>
										<th>年龄</th>
										<th>身高(厘米)</th>
										<th>体重(公斤)</th>
										<th>注册时间</th>
									</tr>
								</tfoot>
								<tbody>
									<c:forEach items="${ users }" var="user">
										<tr>
											<td>${ user.username }</td>								
											<td>${user.gender ==1?"男":"女"}</td>
											<td>${ user.age }</td>
											<td>${ user.height }</td>
											<td>${ user.weight }</td>
											<td><fmt:formatDate value="${user.createdTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>					
			   <div  id="get_time_now" class="card-footer small text-muted"></div>
			   <!-- 获取并显示当前时间 -->
				<script src="builder/js/get-time-now.js"></script>
				</div>
				<p class="small text-center text-muted my-5">
					<em>更多分析表即将推出......</em>
				</p>
			</div>
			<!-- Sticky Footer:站脚 -->
			<footer class="sticky-footer">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>© 享受·生活 2019</span>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<!-- Scroll to Top Button:回到顶部 -->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>
	<!-- Logout Modal:退出登录-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">确定退出?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">点击确定退出系统</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">取消</button>
					<a class="btn btn-primary" href="login.html">确定</a>
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap core JavaScript-->
	<script src="builder/vendor/jquery/jquery.min.js"></script>
	<script src="builder/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Core plugin JavaScript-->
	<script src="builder/vendor/jquery-easing/jquery.easing.min.js"></script>
	<!-- Page level plugin JavaScript-->
	<script src="builder/vendor/datatables/jquery.dataTables.js"></script>
	<script src="builder/vendor/datatables/dataTables.bootstrap4.js"></script>
	<!-- Custom scripts for all pages-->
	<script src="builder/js/sb-admin.min.js"></script>
	<!-- Demo scripts for this page:当前页面所需项目展示脚本-->
	<script src="builder/js/demo/datatables-demo.js"></script>
</body>
</html>