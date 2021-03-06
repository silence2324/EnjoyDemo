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
<!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
<!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
<!--[if lt IE 9]>
      <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
</head>
<style>
.carousel-caption {
	font-size: 2.5em;
}
</style>
<body>
	<!-- 页眉部分 -->
	<%@ include file="header.jsp"%>
	<!-- <div>
		<img src="imgs/run1.jpg" class="img-responsive" alt="Responsive image">
	</div> -->
	<div id="myCarousel" class="carousel slide">
		<!-- 轮播（Carousel）指标 -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
		</ol>
		<!-- 轮播（Carousel）项目 -->
		<div class="carousel-inner">
			<div class="item active">
				<img src="builder/imgs/run8.jpg" alt="First slide">
				<div class="carousel-caption">生命不止，运动不息</div>
			</div>
			<div class="item">
				<img src="builder/imgs/run7.jpg" alt="Second slide">
				<div class="carousel-caption">加入我们</div>
			</div>
		</div>
		<!-- 轮播（Carousel）导航 -->
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	<!-- 宣传 -->

	<div class="container">
		<div class="row">
			<div class="page-header">
				<h1>
					运动商城 <small>健身器材</small>
				</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-6">
				<a href="#" class="thumbnail"> <img
					src="builder/imgs/equipment-fitness-gym.jpg" alt="通用的占位符缩略图">
				</a>
			</div>
			<div class="col-sm-6">
				<a href="#" class="thumbnail"> <img
					src="builder/imgs/backlit-clouds-friends-853168.jpg"
					alt="通用的占位符缩略图">
				</a>
			</div>
		</div>

		<div class="row">
			<div class="row">
				<div class="page-header">
					<h1>
						交流论坛 <small>狐朋狗友</small>
					</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<a href="#" class="thumbnail"> <img
						src="builder/imgs/backlit-clouds-friends-853168.jpg" alt="通用的占位符缩略图">
					</a>
				</div>
				<div class="col-sm-6">
					<a href="#" class="thumbnail"> <img
						src="builder/imgs/bonding-daylight-friends-1645634.jpg"
						alt="通用的占位符缩略图">
					</a>
				</div>
			</div>
		</div>
	</div>

	<!-- 页脚 -->
	<div class="container-fluid">
		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>