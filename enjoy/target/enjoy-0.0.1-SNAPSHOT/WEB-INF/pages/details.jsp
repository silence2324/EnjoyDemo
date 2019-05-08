<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>享受·生活</title>
<!-- Bootstrap -->
<link href="builder/css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="builder/js/jquery-3.2.1.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="builder/js/bootstrap.min.js"></script>
<style>
.search-btn {
	float: left;
	border: 1px solid black;
	margin-top: 50px;
	width: 90px;
	height: 35px;
	text-align: center;
	line-height: 35px;
	background: black;
	color: white;
}

.search-input {
	float: left;
	border: 2px solid black;
	width: 400px;
	height: 35px;
	padding: 5px;
	margin-top: 50px;
}

.phone {
	margin-top: 20px;
}

.banner {
	margin: 0 auto;
	height: 600px;
	width: 600px;
}

.video {
	height: 400px;
	width: 400px;
}

.search-title {
	margin-top: 50px;
	margin-bottom: 50px;
}

.first-title {
	margin-top: 20px;
}

.small {
	color: gray;
	font-size: 18px;
}

.search-footer {
	background: black;
	height: 60px;
	text-align: center;
	line-height: 60px;
	color: white;
}

.price {
	font-weight: bold;
	font-size: 15px;
	margin-left: px;
}
</style>
</head>
<body style="padding-top: 5.5%;">
	<!--页眉部分-->
	<%@ include file="header.jsp" %>	
	<!--页体部分-->
	<div class="container">
		<div class="col-sm-6 col-md-3">
			<div class="thumbnail">
				<img src="builder/imgs/paobuji222.jpg" alt="通用的占位符缩略图"
					class="img-responsive">
				<div class="caption">
					<h3>跑步机</h3>
					<p>器材迷你垫子走路静音小型康复跑步机家用款减肥机小迷你家庭自动</p>
					<p>
						<a href="order" class="btn btn-primary " role="button">
							购买 </a> <a href="#" class="btn btn-default" role="button"> 加入购物车
						</a> <span class="price">价格:268</span>
					</p>
				</div>
			</div>
		</div>
		<div class="col-sm-6 col-md-9">
			<div class="thumbnail">
				<ol class="breadcrumb">
					<li><a href="#">宝贝详情</a></li>
					<ul class="list-group">
						<li class="list-group-item list-group-item-info">品牌: 品奈</li>
						<li class="list-group-item list-group-item-info">系列: 家用跑步机</li>
						<li class="list-group-item list-group-item-info">售后服务: 店铺保修</li>
						<li class="list-group-item list-group-item-info">货号: A3</li>
					</ul>
					<div class="list-group">
						<li class="list-group-item list-group-item-info">心率测试: 无心率测试</li>
						<li class="list-group-item list-group-item-info">跑带区域:
							100x35cm</li>
						<li class="list-group-item list-group-item-info">跑步机最大承重:
							150kg</li>
						<li class="list-group-item list-group-item-info">峰值马力: 0hp</li>
						<li class="list-group-item list-group-item-info">持续输出马力: 0hp</li>
					</div>
				</ol>
			</div>
		</div>
	</div>
	<!-- 页脚 -->
	<div class="container-fluid">
		<%@ include file="footer.jsp" %>	
	</div>
</body>
</html>