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
<link href="builder/css/bootstrapValidator.min.css" rel="stylesheet">
<script src="builder/js/bootstrapValidator.js"></script>

<link href="https://cdn.bootcss.com/bootstrap-select/2.0.0-beta1/css/bootstrap-select.min.css" rel="stylesheet">
<script src="https://cdn.bootcss.com/bootstrap-select/2.0.0-beta1/js/bootstrap-select.min.js"></script>
<title></title>
<style type="text/css">
#btn-display {
	width: 172px;
	z-index: 1;
	position: absolute;
	border: 1px solid black;
	background: white;
	display: none;
}

.click_work {
	border-bottom: 1px solid lavender;
}
</style>
<script>
	$(function() {
		//当键盘键被松开时发送Ajax获取数据
		$('#btn-search').keyup(
				function() {
					var keywords = $(this).val();
					if (keywords.trim() == '') {
						$('#btn-display').hide();
						return
					}

					$.ajax({
						url : 'doSearchByName?itemName=' + keywords,
						dataType : 'json',
						//回调函数的参数名(键值)key
						// jsonpCallback: 'fun', //回调函数名(值) value
						success : function(data) {
							$('#btn-display').empty().show();
							if (data.data == null) {
								$('#btn-display').append(
										'<div class="error">Not find  "'
												+ keywords + '"</div>');
							}
							$.each(data.data, function() {
								$('#btn-display').append(
										'<div class="click_work">'
												+ this.item_name + '</div>');
							})
						},
						error : function() {
							$('#btn-display').empty().show();
							$('#btn-display').append(
									'<div class="click_work">Fail "' + keywords
											+ '"</div>');
						}
					})
				})
		//点击搜索数据复制给搜索框
		$(document).on('click', '.click_work', function() {
			var word = $(this).text();
			$('#btn-search').val(word);
			$('#btn-display').hide();
			// $('#texe').trigger('click');触发搜索事件
		})
		$(document).on('mouseover', '.click_work', function() {
			$(this).css("background-color", "silver");
		})
		$(document).on('mouseout', '.click_work', function() {
			$(this).css("background-color", "white");
		})
		$(document).on("click","#btn-go",function () {
				//先查询出商品对应的id
				var par=$("#btn-search").val().trim();
				var url='doSearchByName?itemName='+par;
				$.get(url,function (r1) {
					console.log(r1);
					if (r1.data==null||r1.data.length<1)
					// {
                     //
                     //    return false;
					// }
                    alert("该商品不存在");
					$(location).attr("href","goods_byid?item_id="+r1.data[0].item_id.toString());
				},"json");

			})

	})

	//注册点击事件
	$(function() {
		$("#registerId").click(doPostMessage);
		$(".btn-danger").click(doCloseMessage);
		$("#closeId").click(CloseMessage);
		$("#Authen").click(dologinAuthen);
		$("#bbsId").click(doBbsUi);
		//	$("#indexId").click(doAuthro);
		doAuthenLogin();
	});

	//跳转到用户订单页面
	function doMyOrderUI() {
		$.ajax({
			type : "get",
			url : "user/doAuthor",
			async : false,//同步：意思是当有返回值以后才会进行后面的js程序。
			success : function(result) {
				window.location.href = "order";
			}
		})
	}

	//跳转到用户购物车页面
	function doMyCartUI() {
		$.ajax({
			type : "get",
			url : "user/doAuthor",
			async : false,//同步：意思是当有返回值以后才会进行后面的js程序。
			success : function(result) {
				window.location.href = "cart";
			}
		})
	}

	//退出登录
	function doExit() {
		$.ajax({
			type : "POST",
			url : "user/outLogin",
			async : false,//同步：意思是当有返回值以后才会进行后面的js程序。
			success : function(result) {
				alert(result.message);
				window.location.href = "index";
			}
		})
	}

	//检查登录验证状态
	function doAuthenLogin() {
		$
				.ajax({
					type : "POST",
					url : "user/doAuthenLogin",
					async : true,//同步：意思是当有返回值以后才会进行后面的js程序。
					success : function(result) {
						if (result.state == 1) {
							//	console.log(result);
							$(".dropdown-toggle").text(result.data.username);
							$(".change1")
									.replaceWith("<a id = 'exit'>退出登录</a>");
							$(".change2")
									.replaceWith(
											"<a data-toggle='modal' data-target= '#login' >切换账户</a>");
							$("#exit").click(doExit);
							if (result.data.password == "0") {
								$("#addLi").append(
										"<li><a id='myCartUI'>购物车</a></li>")
								$("#addLi").append(
										"<li><a id='myOrderUI'>我的订单</a></li>")
								$("#myOrderUI").click(doMyOrderUI);
								$("#myCartUI").click(doMyCartUI);
							} else {
								$("#addLi").append(
										"<li><a id='tables'>报表管理</a></li>")
								$("#tables").click(doTablesUI);
							}
						} else {

						}
					}
				})
	}

	//判断是否为管理员，并且跳转到报表页面
	function doTablesUI() {
		$.ajax({
			type : "get",
			url : "user/doTableUI",
			async : true,//同步：意思是当有返回值以后才会进行后面的js程序。
			success : function(result) {
				if (result.state == 1) {//根据返回值进行跳转
					alert(result.message);
					window.location.href = "adminLoginUI";
				} else {
					alert("请登录后，重试");
				}
			}
		})
	}

	function doBbsUi() {
		doAuthor("bbs");
	}

	//检查是否登录，通过登录状态，判断是否拥有权限
	function doAuthor(UI) {
		$.ajax({
			type : "POST",
			url : "user/doAuthor",
			async : true,//同步：意思是当有返回值以后才会进行后面的js程序。
			success : function(result) {
				if (result.state == 1) {//根据返回值进行跳转
					window.location.href = UI;
				} else {
					alert("请登录后，重试");
				}
			}
		})
	}

	//异步登录注册
	function dologinAuthen() {
		$.ajax({
			type : "POST",
			url : "user/doUserLogin",
			data : {
				"username" : $("#username").val(),
				"password" : $("#password").val(),
			},
			async : true,//同步：意思是当有返回值以后才会进行后面的js程序。
			success : function(result) {
				if (result.state == 1) {
					alert(result.message);
					console.log("1");
					window.location.href = "index";
				} else {
					alert(result.message);
					console.log("2");
				}
			}
		})
	}

	/* function doLoginPage(data) {
		//		console.log("123456");
		$(".dropdown-toggle").text(data.username);
	} */

	//异步请求注册
	function doPostMessage() {
		var url = "user/doUserRegister";
		var param = {
			"username" : $("#usernameId").val(),
			"password" : $("#passwordId").val(),
			"agenPassword" : $("#agenPasswordId").val(),
			"email" : $("#emailId").val(),
            "age" : $("#ageId").val(),
            "gender" : $("input[name='gender']:checked").val(),
            "height" : $("#heightId").val(),
            "weight": $("#weightId").val()
		};
		console.log(param);
		$.post(url, param, function(result) {
			if (result.state == 1) {
				alert(result.message);
				window.location.href = "index";
			} else {
				alert(result.message);
			}
		})
	}

	//清除已输入信息
	function CloseMessage() {
		$("#username").val("");
		$("#password").val("");
	}
	//清除已输入信息
	function doCloseMessage() {
		$("#usernameId").val("");
		$("#passwordId").val("");
		$("#agenPasswordId").val("");
		$("#emailId").val("");
        $("#ageId").val("");
        $("#heightId").val("");
        $("#weightId").val("");
        $("input[type='radio']").eq(0).prop("checked",1);
	}
</script>

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
						<a id="indexId" class="navbar-brand" href="index"> 享受·生活 </a>
					</div>
					<!-- 左侧按钮选项 -->
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul id="addLi" class="nav navbar-nav">
							<li><a href="sports">运动健康</a></li>
							<li><a href="sports#store1">购物商城</a></li>
							<li><a href="topicList">社区论坛</a></li>
						</ul>
						<form class="navbar-form navbar-left">
							<div class="form-group">
								<input autocomplete="off" name="itemName" id="btn-search"
									type="text" class="form-control" placeholder="搜你所想~">
								<div id="btn-display"></div>
							</div>
							<button id="btn-go" class="btn btn-default">GO</button>
						</form>


						<!-- 搜索框 -->
						<!-- 右侧按钮 -->
						<ul class="nav navbar-nav navbar-right">
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">加入我们 <span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a class="change1" data-toggle="modal"
										data-target="#login">登陆</a></li>
									<li><a class="change2" data-toggle="modal"
										data-target="#register">注册</a></li>
								</ul></li>
						</ul>
					</div>
					<!-- /.navbar-collapse -->
				</div>
				<!-- /.container-fluid -->
			</nav>
		</div>
		<!--登录-->
		<div id="login" class="modal fade" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
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
						<form id="login" class="form-group" action="">
							<div class="form-group">
								<label for="">用户名</label> <input id="username"
									class="form-control" type="text" placeholder="输入您的用户名"
									name="username">
							</div>
							<div class="form-group">
								<label for="">密码</label> <input id="password"
									class="form-control" type="password" placeholder="输入您的密码"
									name="password">
							</div>
							<div class="text-right">
								<button id="Authen" class="btn btn-primary" type="button">登录</button>
								<button id="closeId" class="btn btn-danger" type="button">清除</button>
							</div>
							<a href="" data-toggle="modal" data-dismiss="modal"
								data-target="#register">还没有账号？点我注册</a>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- 注册 -->
		<div id="register" class="modal fade" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
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
						<form id="re" class="form-group">
							<div class="form-group">
								<label for="">用户名</label> <input id="usernameId" name="username"
									class="form-control" type="text" placeholder="6-15位字母或数字">
							</div>
							<div class="form-group">
								<label for="">密码</label> <input id="passwordId" name="password"
									class="form-control" type="password" placeholder="至少6位字母或数字">
							</div>
							<div class="form-group">
								<label for="">再次输入密码</label> <input id="agenPasswordId"
									name="agenPassword" class="form-control" type="password"
									placeholder="至少6位字母或数字">
							</div>
							<div class="form-group">
								<label for="">邮箱</label> <input id="emailId" name="email"
									class="form-control" type="email" placeholder="例如:123@123.com">
							</div>
							<div class="form-group">
								<label for="">年龄</label> <input id="ageId" name="age"
									class="form-control" type="text" placeholder="例如:23">
							</div>
                            <div class="form-group">
                                <label for="">身高(米)</label> <input id="heightId" name="height"
                                class="form-control" type="text" placeholder="例如:1.78">
                            </div>
                            <div class="form-group">
                                <label for="">体重(公斤)</label> <input id="weightId" name="weight"
                                class="form-control" type="text" placeholder="例如:69.0">
                            </div>
                            <div class="form-group">
                                <label for="">性别</label>
                                <input name="gender" type="radio" value="1"  checked="checked"/>男
                                <input name="gender" type="radio" value="0" />女
                            </div>
							<div class="text-right">
								<button id="registerId" class="btn btn-primary" type="button">提交</button>
								<button class="btn btn-danger" type="button">清除</button>
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
<script type="text/javascript">
	//注册数据 js验证
	$('#re').bootstrapValidator({
		/*根据验证结果显示的各种图标*/
		feedbackIcons : {
			valid : 'glyphicon glyphicon-ok',
			invalid : 'glyphicon glyphicon-remove',
			validating : 'glyphicon glyphicon-refresh'
		},
		/*去校验表单元素  用户名  密码*/
		/*校验状态：未校验 NOT_VALIDATED 正在校验 VALIDATING  校验成功 VALID 校验失败 INVALID */
		/*校验规则：是需要去配置*/
		/* fields 字段 --->  表单内的元素*/
		fields : {
			/*指定需要校验的元素  通过name数据去指定*/
			username : {
				/*配置校验规则  规则不止一个*/
				validators : {
					/*配置具体的规则*/
					notEmpty : {
						/*校验不成功的提示信息*/
						message : '请您输入用户名'
					},
					/*自定义规则*/
					callback : {
						message : '用户名错误'
					}
				}
			},
			password : {
				validators : {
					notEmpty : {
						message : '请您输入密码'
					},
					stringLength : {
						min : 6,
						max : 18,
						message : '密码长度必须在6到30之间'
					},
					/*自定义规则*/
					callback : {
						message : '密码错误'
					}
				}

			},

			agenPassword : {
				validators : {
					notEmpty : {
						message : '请确认密码'
					},
					stringLength : {
						min : 6,
						max : 30,
						message : '密码长度必须在6到30之间'
					},
					identical : {//相同
						field : 'password',
						message : '两次密码不一致'
					}
				}
			},
			email : {
				validators : {
					notEmpty : {
						message : '邮箱不能为空'
					},
					emailAddress : {
						message : '请输入正确的邮箱地址 如：47125@qq.com'
					}
				}
			}
		}
	})

	//登录js验证
	$('#login').bootstrapValidator({
		feedbackIcons : {
			valid : 'glyphicon glyphicon-ok',
			invalid : 'glyphicon glyphicon-remove',
			validating : 'glyphicon glyphicon-refresh'
		},
		fields : {
			/*指定需要校验的元素  通过name数据去指定*/
			username : {
				/*配置校验规则  规则不止一个*/
				validators : {
					/*配置具体的规则*/
					notEmpty : {
						/*校验不成功的提示信息*/
						message : '请您输入用户名'
					},
					/*自定义规则*/
					callback : {
						message : '用户名错误'
					}
				}
			},
			password : {
				validators : {
					notEmpty : {
						message : '请您输入密码'
					},
					stringLength : {
						min : 6,
						max : 18,
						message : '密码长度应该在6到30之间'
					},
					/*自定义规则*/
					callback : {
						message : '密码错误'
					}
				}

			}
		}
	})
</script>

</html>
