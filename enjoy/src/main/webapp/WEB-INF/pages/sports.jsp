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
	/*
	修改右外边距
	 */
#group {
	margin-right: 70px;
}
/*
修改搜索框上下外边距
 */
.search-title {
	margin-top: 50px;
	margin-bottom: 50px;
}

/*
修改按钮颜色字体大小
 */
.small {
	color: gray;
	font-size: 18px;
}
</style>
</head>
<body id="bodyId">
	<!--页眉部分-->
	<%@ include file="header.jsp"%>
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
			<form class="form-horizontal" role="form" action="" method="get">
				<div id="uidId" class="form-group">
					<label for="firstname" class="col-sm-2 control-label">身高(m)</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="firstname"
							placeholder="请输入身高" name="height">
					</div>
				</div>
				<div class="form-group">
					<label for="lastname" class="col-sm-2 control-label">体重(kg)</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="lastname"
							placeholder="请输入体重" name="weight">
					</div>
				</div>
				<div id="group" class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<div class="container">
							<button id="btn-bmi" type="button" class="btn btn-default"
								title="您的BMI指数:" data-container="body" data-toggle="popover"
								data-placement="bottom" data-content="正在加载中...">
								获取BMI指数</button>
						</div>
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
				<img class="replace" src="builder/imgs/shoutao.jpg" alt="通用的占位符缩略图">
				<div class="caption">
					<h3>防滑手套</h3>
					<p>安德玛 UA 女子运动健身器械训练防滑手套半指耐磨透气</p>
					<p>
						<a href="goods_byid?item_id=4" class="btn btn-primary"
							role="button"> 查看详情 </a> <a action="4" id="goodsId" class="btn btn-default"
							role="button"> 加入购物车 </a>
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
						<a href="goods_byid?item_id=5" class="btn btn-primary"
							role="button"> 查看详情 </a> <a id="goodsId"  action="5" class="btn btn-default"
							role="button"> 加入购物车 </a>
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
						<a href="goods_byid?item_id=6" class="btn btn-primary"
							role="button"> 查看详情 </a> <a action="6"  id="goodsId" class="btn btn-default"
							role="button"> 加入购物车 </a>
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
						<a href="goods_byid?item_id=7" class="btn btn-primary"
							role="button"> 查看详情 </a> <a action="7"  id="goodsId" class="btn btn-default"
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
						<a href="goods_byid?item_id=8" class="btn btn-primary"
							role="button"> 查看详情 </a> <a action="8"  id="goodsId" class="btn btn-default"
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
						<a href="goods_byid?item_id=9" class="btn btn-primary"
							role="button"> 查看详情 </a> <a action="9"  id="goodsId" class="btn btn-default"
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
						<a href="goods_byid?item_id=10" class="btn btn-primary"
							role="button"> 查看详情 </a> <a action="10"  id="goodsId" class="btn btn-default"
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
							<a href="goods_byid?item_id=11" class="btn btn-primary"
								role="button"> 查看详情 </a> <a action="11"  id="goodsId" class="btn btn-default"
								role="button"> 加入购物车 </a>
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
							<a href="goods_byid?item_id=13" class="btn btn-primary"
								role="button"> 查看详情 </a> <a action="13"  id="goodsId" class="btn btn-default"
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
							<a href="goods_byid?item_id=14" class="btn btn-primary"
								role="button"> 查看详情 </a> <a action="14"  id="goodsId" class="btn btn-default"
								role="button"> 加入购物车 </a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--页脚部分-->
	<!-- 页脚 -->
	<div class="container-fluid">
		<%@ include file="footer.jsp"%>
	</div>
	<script>
	
	//绑定点击事件
	$(function() {
	    //获取bmi按钮事件绑定
		$(".form-group")
				.on("click", "#btn-bmi", function () {
					doGetBmi();
				})
		//商品详情跳转事件绑定
		$("#bodyId").on("click", "#goodsId", function() {
			//console.log(this);
			doAddOrder0($(this).attr("action"));
		})
	});
	
	//同步获取用户uid
	$(function() {

		$.ajax({
			type : "get",
			url : "user/doAuthenLogin",
			async : false,
			success : function(result) {
				console.log(result);
				$("#uidId").data("uid", result.data.uid);
			}
		});
	});
	
	//加入购物车，state状态为0
	function doAddOrder0(item_id) {
		//console.log("item_id", item_id);
		var uid = $("#uidId").data("uid");
		$.ajax({
			type : "get",
			url : "order/doAddOrder0",
			async : true,
			data : {
				"item_id" : item_id,
				"uid" : uid
			},
			success : function(result) {
				//console.log("result", result);
				if (result.state == 1) {
					alert(result.message);
				} else {
					alert(result.message);
				}
			}
		});
	}
	
	function doGetBmi() {
		//定义url
		var url="get_bmi";
		//定义参数
		var params={"height":$("#firstname").val(),
		"weight":$("#lastname").val()};
		//发送异步请求获取bmi
		$.get(url,params,function (result) {
			$('[data-toggle="popover"]').popover()
			if (result.data==null){
				alert(result.message)
			}
			//将获取的bmi绑定至弹出框
			$("#btn-bmi").attr("data-content",result.data.bmi+result.data.statu);
		})
	}
</script>
</body>
</html>