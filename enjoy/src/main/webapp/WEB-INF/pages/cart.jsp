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

<script type="text/javascript">
	
	$(function () {
		doLoadCart();
		$("#deleteId").click(doDeleteCart);
		$("#checkAll").click(doChangeAllState);
		$(".cBox").click(doSmallState);
		$(".btn-lg").click(doOrderChangeState);
	});
	
	function doOrderChangeState() {
		var array = doGetChange();
		$.ajax({
			type : "get",
			url : "order/doOrderChangeState",
			data : {
				"oids" : array.toString()
			},
			async : true,
			success : function(result) {
				if (result.state == 1) {
					alert(result.message);
					removeCart(array);
				} else {
					alert(result.message)
				}
			}
		});
	}
	
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
	
	//发送请求，删除选中商品信息
	function doDeleteCart() {
		var array = doGetChange();
		$.ajax({
			type : "get",
			url : "order/doDeleteCart",
			data : {
				"oids" : array.toString()
			},
			async : true,
			success : function(result) {
				if (result.state == 1) {
					alert(result.message);
					removeCart(array);
				} else {
					alert(result.message)
				}
			}
		});
	}
	
	//在页面移除已被删除的商品信息
	function removeCart(array) {
		console.log(array);
		for (var i = 0; i < array.length; i++) {
			$("[value='"+ array[i]  +"']").remove();
		}
	}
	
	//获取被选中的元素
	function doGetChange() {
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
	
	//发送ajax请求购物车数据
	function doLoadCart() {
		$.ajax({
			type : "get",
			url : "order/doLoadCart",
			async : false,
			success : function(result) {
				console.log("result", result);
				console.log("uid", result.data.uid);
				doLoadPage(result.data);
	//			$(".dropdown-toggle").data("uid", result.data.uid);
			}
		});
		
	}
	
	//循环加载购物车页面
	function doLoadPage(data) {
		var tBody = $("#tbodyId");
		tBody.empty();//清空内容
		//2.迭代records记录(循环一次取一行)
		for (var i = 0; i < data.length; i++) {
			//1.创建tr对象
			var tr = $("<tr value = "+ data[i].oid +"></tr>");
			//2.创建多个td对象
			var tds = doCreateTds(data[i]);
			//3.将td对象追加到tr中
			tr.append(tds);
			//4.将tr追加到tbody中
			tBody.append(tr);
		}
	}
	
	//加载一行购物车商品信息
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
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="col-md-offset-1 col-md-10">

		<div class="panel panel-primary" style="margin-top: 100px">
			<div class="panel-heading" id="biaodan">
				<h3 class="panel-title">
					<span class="fa fa-shopping-cart"></span> 购物车
				</h3>
			</div>

			<div class="panel-body">
				<form role="form" id="cartJz">

					<!--购物车表格开始-->
					<table class="cart-table" width="100%">
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
						<div class="total-bar">
							<button type="button" class="btn btn-black" id="deleteId">删除</button>
							<span class="pull-right">已选商品 <span id="selectCount">0</span>件
								总价¥ <span id="selectTotal">0</span>元
							</span>

						</div>
						<div>
							<span class="pull-right"> <input id = "changeState"
									type="button" value="  结  算  " class="btn btn-inverse btn-lg " />
							</span>
						</div>
				</form>
			</div>
		</div>
	</div>
	<div id="footerId">
		<%@ include file="footer.jsp"%>
	</div>

</body>
<style>
.cart-table {
	text-align: center;
}
/*表头文字居中*/
.cart-table th {
	text-align: center;
}
/*数量数字居中*/
.cart-table input {
	text-align: center;
}
/*加减按钮宽度*/
.num-btn {
	width: 30px;
}
/*每行间隙*/
.cart-table tbody tr {
	border-top: 1px dashed #cccccc;
}

/*总价条*/
.total-bar {
	margin: 20px 0;
	background-color: #f0f7fe;
	padding: 15px;
	border-radius: 5px;
}

.panel-heading {
	color: black;
}

#biaodan {
	background: black;
}
</style>
</html>