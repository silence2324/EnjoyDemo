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
</style>
</head>
<body>
	<!--页眉部分-->
	<%@ include file="header.jsp" %>	
	<div class="row">
		<img src="builder/imgs/-1406356.jpg" class="img-responsive">
	</div>
	<!--页体部分-->
	<div class="container" id="life">
		<div class="row">
			<span
				class="glyphicon
            glyphicon-chevron-right search-title"
				style="color: rgb(0, 0, 0); font-size: 27px;">运动生活</span>
		</div>
		<div class="row">
			<!-- 16:9-->
			<div class="embed-responsive embed-responsive-16by9">
				<video controls>
					<source src="builder/imgs/fit1.mp4" type="video/mp4">
				</video>
			</div>
		</div>
		<!-- 4:3 aspect ratio -->
	</div>
	<div class="row">
		<div class="col-md-12">
			<span
				class="glyphicon
            glyphicon-chevron-right search-title"
				style="color: rgb(0, 0, 0); font-size: 27px;"> 健康生活</span>
		</div>
	</div>
	<div class="row" id="health">
		<div class="col-md-12">
			<form class="form-horizontal" role="form">
				<div class="form-group">
					<label for="firstname" class="col-sm-2 control-label">身高</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="firstname"
							placeholder="请输入身高">
					</div>
				</div>
				<div class="form-group">
					<label for="lastname" class="col-sm-2 control-label">体重</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="lastname"
							placeholder="请输入体重">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default">获取BMI</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="row" id="store1">
		<div class="col-md-12">
			<span class="glyphicon glyphicon-chevron-right search-title"
				style="color: rgb(0, 0, 0); font-size: 27px;"> 运动商城 <small
				class="small">器材护具</small>
			</span>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-6 col-md-3">
			<div class="thumbnail">
				<img src="builder/imgs/shoutao.jpg" alt="通用的占位符缩略图">
				<div class="caption">
					<h3>防滑手套</h3>
					<p>安德玛 UA 女子运动健身器械训练防滑手套半指耐磨透气</p>
					<p>
						<a href="mitts.html" class="btn btn-primary" role="button">
							查看详情 </a> <a href="mitts.html" class="btn btn-default" role="button">
							加入购物车 </a>
					</p>
				</div>
			</div>
		</div>
		<div class="col-sm-6 col-md-3">
			<div class="thumbnail">
				<img src="builder/imgs/yujiadie.png_430x430q90.jpg" alt="瑜伽垫">
				<div class="caption">
					<h3>Keep瑜伽垫</h3>
					<p>Keep健身垫加厚加宽长双面专业TPE瑜伽垫防滑初学者运动瑜珈男女</p>
					<p>
						<a href="yoga.html" class="btn btn-primary" role="button">
							查看详情 </a> <a href="yoga.html" class="btn btn-default" role="button">
							加入购物车 </a>
					</p>
				</div>
			</div>
		</div>
		<div class="col-sm-6 col-md-3">
			<div class="thumbnail">
				<img src="builder/imgs/huling.jpg" alt="通用的占位符缩略图">
				<div class="caption">
					<h3>自用壶铃</h3>
					<p>家用女性男士专业健身包胶竞技提壶铃哑铃健身房私教训练壶铃</p>
					<p>
						<a href="huling.html" class="btn btn-primary" role="button">
							查看详情 </a> <a href="huling.html" class="btn btn-default" role="button">
							加入购物车 </a>
					</p>
				</div>
			</div>
		</div>
		<div class="col-sm-6 col-md-3">
			<div class="thumbnail">
				<img src="builder/imgs/yaling.jpg" alt="通用的占位符缩略图">
				<div class="caption">
					<h3>自用哑铃</h3>
					<p>美国队长PU无味固定哑铃男女士家用私教健身房哑铃商用套装一对</p>
					<p>
						<a href="yaling(1).html" class="btn btn-primary" role="button">
							查看详情 </a> <a href="yaling(1).html" class="btn btn-default"
							role="button"> 加入购物车 </a>
					</p>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12 col-md-6">
			<div class="thumbnail">
				<img src="builder/imgs/paobuji222.jpg" alt="通用的占位符缩略图"
					class="img-responsive">
				<div class="caption">
					<h3>跑步机</h3>
					<p>器材迷你垫子走路静音小型康复跑步机家用款减肥机小迷你家庭自动</p>
					<p>
						<a href="details" class="btn btn-primary" role="button">
							查看详情 </a> <a href="paobuji(1).html" class="btn btn-default"
							role="button"> 加入购物车 </a>
					</p>
				</div>
			</div>
		</div>
		<div class="col-sm-6 col-md-3">
			<div class="thumbnail">
				<img src="builder/imgs/yaodai.jpg" alt="通用的占位符缩略图">
				<div class="caption">
					<h3>硬拉腰带</h3>
					<p>BD健美站可调节牛皮健身腰带深蹲硬拉健美举重护腰情侣款运动护具</p>
					<p>
						<a href="YAODAI(1).html" class="btn btn-primary" role="button">
							查看详情 </a> <a href="YAODAI(1).html" class="btn btn-default"
							role="button"> 加入购物车 </a>
					</p>
				</div>
			</div>
		</div>
		<div class="col-sm-6 col-md-3">
			<div class="thumbnail">
				<img src="builder/imgs/huzhou.jpg" alt="通用的占位符缩略图">
				<div class="caption">
					<h3>卧推护肘</h3>
					<p>BD健美站护肘健身男卧推运动分段式压缩举重助力带护手肘弹力护具</p>
					<p>
						<a href="wotuiwuzhou.html" class="btn btn-primary" role="button">
							查看详情 </a> <a href="wotuiwuzhou.html" class="btn btn-default"
							role="button"> 加入购物车 </a>
					</p>
				</div>
			</div>
		</div>
	</div>
	<div class="row" id="store2">
		<div class="col-md-12">
			<span class="glyphicon glyphicon-chevron-right search-title"
				style="color: rgb(0, 0, 0); font-size: 27px;"> 运动商城 <small
				class="small">食品补给</small>
			</span>
		</div>
		<div class="row">
			<div class="col-sm-6 col-md-4">
				<div class="thumbnail">
					<img src="builder/imgs/onwhey.jpg" alt="通用的占位符缩略图">
					<div class="caption">
						<h3>乳清蛋白</h3>
						<p>ON欧普特蒙蛋白粉 WHEY运动增肌健身乳清蛋白质粉美国进口 5磅</p>
						<p>
							<a href="ruqingdanbai%20.html" class="btn btn-primary"
								role="button"> 查看详情 </a> <a href="ruqingdanbai%20.html"
								class="btn btn-default" role="button"> 加入购物车 </a>
						</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-4">
				<div class="thumbnail">
					<img src="builder/imgs/max.jpg" alt="通用的占位符缩略图">
					<div class="caption">
						<h3>即食鸡胸</h3>
						<p>优追麦克斯真空无油高蛋白鸡胸肉健身即食运动零食代餐低脂轻食品</p>
						<p>
							<a href="jishijixiong.html" class="btn btn-primary" role="button">
								查看详情 </a> <a href="jishijixiong.html" class="btn btn-default"
								role="button"> 加入购物车 </a>
						</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-4">
				<div class="thumbnail">
					<img src="builder/imgs/onenergy.jpg" alt="通用的占位符缩略图">
					<div class="caption">
						<h3>支链氨基酸</h3>
						<p>豹哥补剂 ON欧普特蒙全普乳清支链谷氨基酸 健身增肌能量补充饮料</p>
						<p>
							<a href="zhiliananjisuan.html" class="btn btn-primary"
								role="button"> 查看详情 </a> <a href="zhiliananjisuan.html"
								class="btn btn-default" role="button"> 加入购物车 </a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--页脚部分-->
	<!-- 页脚 -->
	<div class="container-fluid">
		<%@ include file="footer.jsp" %>	
	</div>
</body>
</html>