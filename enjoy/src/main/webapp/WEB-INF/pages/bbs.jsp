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
<style type="text/css">
h1 {
	margin-top: 0px;
	text-align: center;
}

#mybody p {
	margin-bottom: 0px;
}
</style>
</head>
<body style="padding-top: 5.5%;">
	<!-- 页眉部分 -->
	<%@ include file="header.jsp" %>
	<div class="container-fluid">
		<div class="container">
			<!-- 轮播图 -->
			<div id="carousel-example-generic" class="carousel slide"
				data-ride="carousel">
				<!-- 图片个数 -->
				<ol class="carousel-indicators">
					<li data-target="#carousel-example-generic" data-slide-to="0"
						class="active"></li>
					<li data-target="#carousel-example-generic" data-slide-to="1"></li>
					<li data-target="#carousel-example-generic" data-slide-to="2"></li>
				</ol>
				<!-- 图片源 -->
				<div class="carousel-inner" role="listbox">
					<div class="item active" >
						<img src="builder/imgs/lb1.jpg"  style="width: 100%;height: 230px;" alt="...">
					</div>
					<div class="item">
						<img src="builder/imgs/lb2.jpg" style="width: 100%;height: 230px;" alt="...">
					</div>
					<div class="item">
						<img src="builder/imgs/lb3.jpg" style="width: 100%;height: 230px;" alt="...">
					</div>
				</div>
				<!-- 手动播放 -->
				<a class="left carousel-control" href="#carousel-example-generic"
					role="button" data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#carousel-example-generic"
					role="button" data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>
	</div>
	<!-- 主体部分 -->
	<div class="container">
		<!-- 帖子列表 -->
		<div class="row">
			<br />
			<h1>享受·生活</h1>
			<table class="table table-hover" width="100%">
				<thead>
					<tr>
						<th width="50%">标题</th>
						<th width="10%">作者</th>
						<th width="20%">发帖日期</th>
						<!-- <th width="10%">浏览数</th>
	        			<th width="10%">收藏</th> -->
					</tr>
				</thead>
				<tbody id="mybody">
					<tr>
						<td class="titleTd"><a id="title_1" href="bbsreply">享受·生活，第一帖</a></td>
						<td class="authorTd"><p id="author_1">组内测试</p></td>
						<td class="dateTd"><p id="date_1">2019-04-15</p></td>
						<!-- <td class="scanTd"><a id="scan_1" href="#"></a></td>
						<td class="saveTd"><a id="save_1" href="#"></a></td> -->
					</tr>
				</tbody>
			</table>
		</div>
		<!-- 分页 -->
		<div class="row">
			<nav aria-label="Page navigation" style="text-align: center;">
				<ul class="pagination">
					<li><a href="#" aria-label="Previous"> <span
							aria-hidden="true">&laquo;</span>
					</a></li>
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#" aria-label="Next"> <span
							aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>
		</div>
		<!-- 发帖 -->
		<div class="row">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">发布帖子</h3>
				</div>
				<div class="panel-body">
					<form class="form-horizontal" role="form">
						<!---获取用户名-->
						<div class="form-group">
							<div class="col-xs-12">
								<span>null</span>
							</div>
						</div>
						<!-- 发帖内容 -->
						<div class="form-group">
							<div class="col-xs-12">
								<input type="text" class="form-control" id="titlename"
									placeholder="请输入标题">
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-12">
								<textarea class="form-control" rows="3" placeholder="请输入内容"
									id="content"></textarea>
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-6">
								<img src="imgs/" class="img-rounded" id="avatar" />
							</div>
							<div class="col-xs-6">
								<button type="button" class="btn btn-default"
									onclick="showAction()" style="margin-top: 100px">上传图片</button>
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-10">
								<button type="submit" class="btn btn-default">发布帖子</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 页脚 -->
	<div class="container-fluid">
		<%@ include file="footer.jsp" %>	
	</div>
</body>
</html>