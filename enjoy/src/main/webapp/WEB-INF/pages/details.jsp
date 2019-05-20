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
	#btn-buy{
		background: black;
	}
	.img-big {
		width: 100%;
		display: none;
		border: 2px solid #aaaaaa;
		border-radius: 3px;
		margin: 0;
		padding: 0;
	}

	/*商品小图片的样式*/

	.img-small {
		border: 1px solid #dddddd;
		margin: 5px;
		padding: 1px;
		cursor: pointer;
	}

	/*大图片初始情况只显示一张，可见的样式*/

	.big-show {
		display: block;
	}


	/*价格框的小字体样式*/

	.price-bar small {
		font-size: 14px;
	}

	/*价格框的样式*/

	.price-bar {
		background: #f0f9ff;
		color: black;
		padding: 8px;
		border: 3px solid black;
		border-radius: 3px;
		font-size: 30px;
		margin: 5px;
	}

	/*购买表单的间隔*/

	.product-form {
		margin: 10px 0;
	}

	/*表单行的间隔*/

	.form-space {
		margin: 10px 0;
	}

	/*售后的图标*/

	.glyphicon{
		color: black;
		font-size: 25px;
	}

	/*售后的标题*/

	.saled-title {
		color: black;
		font-size: 18px;
	}

	/*售后的内容*/

	.saled-content {
		color: #999999;
		font-size: 12px;
		padding-bottom: 40px;
	}

	/*数量按钮样式*/

	.num-btn {
		width: 30px;
	}

	.num-text {
		text-align: center;
	}
</style>
</head>
<body style="padding-top: 5.5%;">
	<!--页眉部分-->
	<%@ include file="header.jsp" %>	
	<!--页体部分-->
	<div class="col-md-offset-1 col-md-10">
		<div class="col-md-6">

			<div data="1" class="img-big move-img col-md-12">
				<img src="${itemvo.imge1}" width="100%" />
			</div>
			<div data="2" class="img-big move-img col-md-12">
				<img src="${itemvo.imge2}" width="100%" />
			</div>
			<div data="3" class="img-big move-img col-md-12">
				<img src="${itemvo.imge3}" width="100%" />
			</div>
			<div data="4" class="img-big move-img col-md-12">
				<img src="${itemvo.imge4}" width="100%" />
			</div>

			<div data="1" class="col-md-2 img-small">
				<img src="${itemvo.imge1}" width="100%" />
			</div>
			<div data="2" class="col-md-2 img-small">
				<img src="${itemvo.imge2}" width="100%" />
			</div>
			<div data="3" class="col-md-2 img-small">
				<img src="${itemvo.imge3}" width="100%" />
			</div>
			<div data="4" class="col-md-2 img-small">
				<img src="${itemvo.imge4}" width="100%" />
			</div>

		</div>

		<div class="col-md-6">
			<h3 class="col-md-12 title-row-1" title="${itemvo.goods.item_name}">${itemvo.goods.item_name}</h3>
			<h4 class="col-md-12 text-row-1"><small>${itemvo.goods.sell_point}</small></h4>
			<div class="col-md-12 price-bar">
				<small>内部售价：</small> ¥${itemvo.goods.price}
				<div><small>*退货补运费 *7天无理由退货 *24小时快速退款 </small></div>
			</div>
			<form class="form-inline product-form col-md-12" role="form">
				<div class="col-md-12 form-space">
					<label for="num">库存：${itemvo.goods.num}</label>
					<input id="numDown" type="button" value="-" class="num-btn" />
					<input id="num" type="text" size="2" readonly="readonly" class="num-text" value="1">
					<input  id="numUp"class="num-btn" type="button" value="+" />
				</div>
				<div class="col-md-12 form-space">
					<h4><small><b>享受生活商城</b>发货并提供售后服务,今日下单,明日送达</small></h4>

				</div>
				<div class="col-md-12 form-space">

					<input id="btn-buy" class="btn btn-primary btn-lg btn-block" type="button" value="立即购买">

				</div>

				<div class="col-md-12 form-space">

					<button type="button" class="btn btn-default go-cart"><span class="fa fa-cart-plus"></span> 加入购物车</button>


				</div>
			</form>

		</div>

	</div>

	<!--商品信息展示结束-->
	<!--售后信息开始-->

	<div class="col-md-offset-1 col-md-10">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">售后保障</h3>
			</div>
			<div class="panel-body ">
				<div class="col-md-12 ">
					<div class="col-md-1 glyphicon glyphicon-glass"><span class="fa fa-shield"></span></div>
					<div class="col-md-11 saled-title">正品保障</div>
				</div>
				<div class="col-md-12 ">
					<div class="col-md-offset-1 col-md-11 saled-content">享受生活商城向您保证所售商品均为正品行货，享受生活商城自营商品开具机打发票或电子发票。</div>
				</div>

				<div class="col-md-12 ">
					<div class="col-md-1 glyphicon glyphicon-wrench"><span class="fa fa-wrench"></span></div>
					<div class="col-md-11 saled-title">厂家服务</div>
				</div>
				<div class="col-md-12 ">
					<div class="col-md-offset-1 col-md-11 saled-content">本产品全国联保，享受三包服务，质保期为：二年质保</div>
				</div>

				<div class="col-md-12 ">
					<div class="col-md-1 glyphicon glyphicon-leaf"><span class="fa fa-heartbeat"></span></div>
					<div class="col-md-11 saled-title">郑重承诺</div>
				</div>
				<div class="col-md-12 ">
					<div class="col-md-offset-1 col-md-11 saled-content">享受生活商城销售并发货的商品，由享受生活商城提供发票和相应的售后服务。请您放心购买！
						<br /> 注：因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，本司不能确保客户收到的货物与商城图片、产地、附件说明完全一致。只能确保为原厂正货！并且保证与当时市场上同样主流新品一致。若本商城没有及时更新，请大家谅解！
					</div>
				</div>

				<div class="col-md-12 ">
					<div class="col-md-1 glyphicon glyphicon-globe"><span class="fa fa-globe"></span></div>
					<div class="col-md-11 saled-title">全国联保</div>
				</div>
				<div class="col-md-12 ">
					<div class="col-md-offset-1 col-md-11 saled-content">
						凭质保证书及享受生活商城发票，可享受全国联保服务（奢侈品、钟表除外；奢侈品、钟表由享受生活商城联系保修，享受法定三包售后服务），与您亲临商场选购的商品享受相同的质量保证。享受生活商城还为您提供具有竞争力的商品价格和运费政策，请您放心购买！
						<br /> 注：因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，本司不能确保客户收到的货物与商城图片、产地、附件说明完全一致。只能确保为原厂正货！并且保证与当时市场上同样主流新品一致。若本商城没有及时更新，请大家谅解！

					</div>
				</div>

				<div class="col-md-12 ">
					<div class="col-md-1 glyphicon glyphicon-wrench"><span class="fa fa-reply"></span></div>
					<div class="col-md-11 saled-title">无忧退货</div>
				</div>
				<div class="col-md-12 ">
					<div class="col-md-offset-1 col-md-11 saled-content">客户购买享受生活商城商品7日内（含7日，自客户收到商品之日起计算），在保证商品完好的前提下，可无理由退货。（部分商品除外，详情请见各商品细则）</div>
				</div>

				<div class="col-md-12 saled-content">

					<small><b>权利声明：</b><br />
						所有商品信息、商品咨询等内容，是享受生活商城重要的经营资源，未经许可，禁止非法转载使用。<br />
						注：本站商品信息均来自于合作方，其真实性、准确性和合法性由信息拥有者（合作方）负责。本站不提供任何保证，并不承担任何法律责任。</small>
				</div>
			</div>
		</div>

	</div>
	<!-- 页脚 -->
	<div class="container-fluid">
		<%@ include file="footer.jsp" %>	
	</div>
<script>
	$(function() {

		/*商品小图片加鼠标移入加边框、移出移除边框*/
		$(".img-small").hover(function() {
					$(this).css("border", "1px solid #4288c3");
				},
				function() {
					$(this).css("border", "");
				})
		//点击时变化大图片
		$(".img-small").click(function() {

			//获得点击的小图片数据
			var n = $(this).attr("data");
			//所有大图隐藏
			$(".img-big").hide();
			//显示点击的小图对应的大图
			$(".img-big[data='" + n + "']").show();

		})
		//购物数量加1
		$("#numUp").click(function() {
			var n = parseInt($("#num").val());
			$("#num").val(n + 1);
		})

		//购物数量-1
		$("#numDown").click(function() {
			var n = parseInt($("#num").val());
			if (n == 1) {
				return;
			}
			$("#num").val(n - 1);
		})

		//点购物车跳页面
		$(".go-cart").click(function() {
			location.href = "cart";
		});

		$(".img-big:eq(0)").show();

	})
</script>
</body>
</html>