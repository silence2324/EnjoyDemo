<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
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

<script>
	/*订单类型，默认为  我的订单*/
	$(function() {
		var htName = "我的订单";
		$(".order_title").html(htName);
		$(".order_type").click(function() {
			htName = this.innerHTML;
			$(".order_title").html(htName);
		});
		$("#checkAll").click(doChangeAllState);
	})
	
	function doSmallState(){
	    //1.获取tbody中所有checkbox对象状态相与的结果
	      var flag=true;//定义初始标记
	      $("#tbodyId input[type='checkbox']")
	      .each(function(){
	    	  flag=flag&&$(this).prop("checked");
	      })
	    //2.修改thead中checkbox对象状态	
	      $("#checkAll").prop("checked",flag);
	    }
	
	 function doChangeAllState(){
	    	//1.获取thead中checkbox对象状态
	    	var flag=$("#checkAll").prop("checked");
	    	//2.修改tbody中checkbox对象状态
	    	$("#tbodyId input[type='checkbox']")
	    	.each(function(){
	    		$(this).prop("checked",flag);
	    	});
	    }
	 
	//同步获取用户uid
	$(function() {
		//	$(".dropdown-toggle").data("uid", 1);
		//	console.log("uuid", uid);
		$.ajax({
			type : "get",
			url : "user/doAuthenLogin",
			async : false,
			success : function(result) {
				console.log("result", result);
				console.log("uid", result.data.uid);
				doLoadPages(result.data.uid);
				$(".dropdown-toggle").data("uid", result.data.uid);
			}
		});
	});

	//根据uid获取用户订单数据
	function doLoadPages(uid) {
		console.log(uid);
		$.ajax({
			type : "get",
			url : "order/findAll",
			async : true,
			data : {
				"uid" : uid
			},
			success : function(result) {
				//				console.log("result", result);
				if (result.state == 1) {
					doLoadPage(result.data);
				} else {
					doLoadPage(result.data);
					$("#messageId").text(result.message);
				}
			}
		});
	}

	//根据订单返回值，加载用户订单信息
	function doLoadPage(data) {
		var tBody = $("#tbodyId");
		tBody.empty();//清空内容
		//2.迭代records记录(循环一次取一行)
		for (var i = 0; i < data.length; i++) {
			//1.创建tr对象
			var tr = $("<tr></tr>");
			//2.创建多个td对象
			var tds = doCreateTds(data[i]);
			//3.将td对象追加到tr中
			tr.append(tds);
			//4.将tr追加到tbody中
			tBody.append(tr);
		}
		$(".cBox").click(doSmallState);
		$("#deleteId").click(doDeleteOrder)
	}
	
	function doDeleteOrder() {
		var array = dogetCheckedIds();
		console.log(array);
		$.ajax({
			type : "get",
			url : "order/doDeleteCart",
			async : false,
			data : {
				"oids" : array.toString()
			},
			success : function(result) {
				if (result.state == 1) {
					var uid = $(".dropdown-toggle").data("uid");
					console.log("uid", uid);
					alert(result.message);
					doLoadPages(uid);
				} else {
					alert(result.message);
				}
			}
		});
	}
	
	
	 function dogetCheckedIds(){
		   //1.定义数组
		   var array=[];
		   //2.迭代所有tbody中checkbox并选中对象的value存储到数组
		   $("#tbodyId input[type='checkbox']")
		   .each(function(){//一旦发现元素执行函数
			   //判定元素是否选中
			   if($(this).prop("checked")){
				   //并将选中对象 的value存储到数组
				   array.push($(this).val())
			   }
		   })
		   //3.返回数组
		   return array;
	   }

	//创建一个订单信息td
	function doCreateTds(data) {
		console.log(data);
		var tds = "<td><input type='checkbox' class='cBox' name='cItem' value="+data.oid+"></td><td><img src="+data.goods_image+" width='110' /></td>"
				+ "<td>"
				+ data.goods_name
				+ "</td>"
				+ "<td>"
				+ data.goods_message
				+ "</td>"
				+ "<td>"
				+ data.goods_num
				+ "</td>"
				+ "<td>1</td>"
				+ "<td>"
				+ data.total_price + "</td>";
		return tds;
	}
</script>
<body style="padding-top: 5.5%;">
	<!--页眉-->
	<%@ include file="header.jsp"%>
	<!--主体部分-->
	<div class="main">
		<div style="margin: 0px auto; width: 1000px">
			<!--左边导航-->
			<div style="border: 1px solid grey; width: 25%; float: left">
				<div style="width: 200px; margin: 0px auto">
					<dl>
						<dt class="list_title">
							<span class="glyphicon glyphicon-zoom-in"
								style="margin-right: 20px"></span><span>查看订单</span>
						</dt>
						<dd>
							<span class="glyphicon glyphicon-menu-right"></span><a href="#"
								class="order_type">我的订单</a>
						</dd>

						<dd>
							<span class="glyphicon glyphicon-menu-right"></span><a href="#"
								class="order_type">退换货</a>
						</dd>
					</dl>
					<dl>
						<dt class="list_title">
							<span class="glyphicon glyphicon-phone"
								style="margin-right: 20px"></span><span>账户</span>
						</dt>
						<dd>
							<span class="glyphicon glyphicon-menu-right"></span><a href="#">账户设置</a>
						</dd>
						<dd>
							<span class="glyphicon glyphicon-menu-right"></span><a href="#">地址簿</a>
						</dd>
					</dl>
					<dl>
						<dt class="list_title">
							<span class="glyphicon glyphicon-info-sign"
								style="margin-right: 20px"></span><span>服务</span>
						</dt>
					</dl>
					<div class="help">
						<div class="help_title">需要帮助吗？</div>
						<ul class="help_list">
							<li><a href="#">如何确保订单安全？</a></li>
							<li><a href="#">我可以使用什么付款方式？</a></li>
							<li><a href="#">如何进行退换货？</a></li>
						</ul>
						<a href="www.baidu.com"><div class="help_more">
								<span class="glyphicon glyphicon-menu-right"></span>更多帮助
							</div></a>
					</div>
				</div>
			</div>
			<!--右边订单-->
			<div style="width: 72%; float: right;">
				<!--订单头部类型，JS-->
				<div class="order_title"></div>
				<div class="box-body table-responsive no-padding">
					<table class="table table-hover">
							<thead>
								<tr>
									<th><input type="checkbox" id="checkAll">全选</th>
									<th>图片</th>
									<th>订单名称</th>
									<th>详细信息</th>
									<th>单价</th>
									<th>数量</th>
									<th>总价</th>
								</tr>
							</thead>
							<tbody id="tbodyId">
								<tr>
									<td id="messageId" colspan="7">数据加载中...</td>
								</tr>
							</tbody>

						</table>
					<div class="btn-toolbar" role="toolbar" aria-label="...">

						<div class="btn-group pull-right" role="group" aria-label="..." >
							<button type="button" class="btn btn-danger" id="deleteId">删除</button>
						</div>
						<div class="btn-group pull-right" role="group" aria-label="...">
							<button type="button" class="btn btn-default">首页</button>
							<button type="button" class="btn btn-default">上一页</button>
							<button type="button" class="btn btn-default">下一页</button>
							<button type="button" class="btn btn-default">当前页码值</button>
							<button type="button" class="btn btn-default">尾页</button>
						</div>
					</div>
				</div>
				<!--按钮-->
				<button class="btn-group"
					style="width: 200px; height: 50px; background-color: #333333;">
					<div style="padding: 0px 38px">
						<div
							style="display: table-cell; vertical-align: middle; text-align: center;">
							<a href="sports"><span style="color: white; font-size: 18px;">继续购物</span></a>
						</div>
						<div
							style="display: table-cell; vertical-align: middle; text-align: center;">
							<span class="glyphicon glyphicon-menu-right"
								style="color: white; font-size: 20px;"></span>
						</div>
					</div>
				</button>
			</div>
		</div>
	</div>
	<!-- 页脚 -->
</body>
<div id="footerId">
	<%@ include file="footer.jsp"%>
</div>

<!--css样式，部分写在行内-->
<style>
body {
	margin: 0px auto;
}

.head {
	margin-bottom: 40px;
}

.head_top {
	height: 80px;
	background-color: #ffffff;
}

.head_list {
	height: 50px;
	background-color: #ffffff;
}

.list_name {
	list-style-type: none;
	float: left;
	font-size: 18px;
	margin-left: 25px;
	color: white;
}

.list_title {
	height: 70px;
	width: 100%;
	margin-bottom: 20px;
	line-height: 70px;
	border-bottom: 1px solid #333333;
	font-size: 24px;
	position: relative;
	text-align: left;
}

.main {
	width: 100%;
}

dl {
	width: 100%;
	margin-bottom: 20px;
}

dl dt {
	font-size: 24px;
	height: 70px;
	width: 100%;
	text-align: left;
	border-bottom: 1px solid #b7b7b7;
	position: relative;
	line-height: 70px;
	margin-bottom: 20px;
}

dl dd {
	line-height: 25px;
	font-size: 14px;
}

dl dd a {
	color: #333333;
	outline: medium none;
	overflow: hidden;
	text-decoration: none;
}

dl dd a:hover {
	color: rgb(153, 153, 153);
	text-decoration: none;
}

.glyphicon.glyphicon-menu-right {
	margin-right: 16px;
}

.help {
	border-top: 1px solid #b7b7b7;
	font-size: 14px;
	padding-top: 20px;
	padding-bottom: 20px;
}

.help_title {
	margin-bottom: 15px;
	line-height: 20px;
	font-size: 18px;
}

.help_list {
	margin: 0;
	padding: 0;
}

.help_list li {
	line-height: 20px;
	font-size: 8px;
	text-indent: 5px;
}

.help_list li a {
	text-decoration: underline;
	font-size: 14px;
	color: #333333;
	outline: medium none;
	overflow: hidden;
}

.help_more {
	margin-top: 20px;
	line-height: 25px;
	font-size: 14px;
}

.order_title {
	height: 71px;
	line-height: 70px;
	font-size: 30px;
	text-align: left;
	width: 100%;
	font-weight: bold;
	font-family: tradegothic, fzlthjw, 微软雅黑, "Microsoft YaHei", 黑体, SimHei;
	position: relative;
	border-bottom: 1px solid #b7b7b7;
}

.cue {
	font-size: 12px;
	line-height: 20px;
	margin: 20px 0px;
}
</style>
</html>
