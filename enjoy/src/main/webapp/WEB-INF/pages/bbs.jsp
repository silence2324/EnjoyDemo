<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		<input type="hidden" id="userIndexId" value="${ok}">
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
						<img src="builder/imgs/bbslb1.jpg"  style="width: 100%;height: 230px;" alt="...">
					</div>
					<div class="item">
						<img src="builder/imgs/bbslb2.jpg" style="width: 100%;height: 230px;" alt="...">
					</div>
					<div class="item">
						<img src="builder/imgs/bbslb3.jpg" style="width: 100%;height: 230px;" alt="...">
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
						<th width="15%">序号</th>
						<th width="30%">标题</th>
						<th width="15%">作者</th>
						<th width="20%">发帖日期</th>
						<!-- <th width="10%">浏览数</th>
	        			<th width="10%">收藏</th> -->
					</tr>
				</thead>
				<tbody id="mybody">
				<%--<c:forEach items="${ list }" var="topic" varStatus="status">--%>
					<%--<tr>--%>
						<%--<td>${ status.count }<input type="hidden" name="tuid" value="${topic.tuid}"/><input type="hidden" name="tuid" value="${ topic.tid }"/></td>--%>

						<%--<td class="titleTd"><a id="title_1" href="bbsreply">${ topic.ttopic }</a></td>--%>
						<%--<td class="authorTd"><p id="author_1">${ topic.author }</p></td>--%>
						<%--<td class="dateTd"><p id="date_1"><fmt:formatDate value="${topic.ttime}" pattern="yyyy-MM-dd HH:mm:ss"/></p></td>--%>
						<%--<!-- <td class="scanTd"><a id="scan_1" href="#"></a></td>--%>
						<%--<td class="saveTd"><a id="save_1" href="#"></a></td> -->--%>
					<%--</tr>--%>
				<%--</c:forEach>--%>
					<tr>
						<td colspan="7">数据加载中...</td>
					</tr>
				</tbody>
			</table>

		</div>
		<!-- 分页 -->
		<div id="pageId" class="row">

		</div>
		<%--绑定分页加载--%>
        <script src="builder/js/get-bbsTopic.js"></script>
        <!-- 发帖 -->
		<div class="row">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">发布帖子</h3>
				</div>
				<div class="panel-body">
					<form action="newTopic" id="pushTopicbbsForm" class="form-horizontal" role="form" method="post" enctype="multipart/form-data">
						<!---获取用户名-->
						<div class="form-group">
							<div class="col-xs-12">
								<span>当前发帖用户:${userInfo.username}</span>
							</div>
						</div>
						<!-- 发帖内容 -->
						<div class="form-group">
							<div class="col-xs-12">
								<input name="ttopic" type="text" class="form-control" id="titlename"
									placeholder="请输入标题">
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-12">
								<textarea name="tcontents" class="form-control" rows="3" placeholder="请输入内容"
									id="content"></textarea>
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-6">
								<%--<img src="${basePath}${user.image}" class="img-rounded" id="avatar" />--%>
								<%--<img src="builder/upload/dfc917be-d41e-4c8f-bc1f-15f01de4f0af.png" class="img-rounded" id="avatar" />--%>
							</div>
							<%--<div class="col-xs-6">--%>
								<%--<input type="button" value="图片预览" class="btn btn-default">--%>
							<%--</div>--%>
						</div>
						<div class="form-group">
							<div class="col-xs-10">
							<input type="file" name="file" id="fileUpload">
							</div>
							<div class="col-xs-10">
							<button type="button" onclick="checkUpload()" class="btn btn-default">加载文件</button>
							<script type="text/javascript">
                                function checkUpload(){
                                    var fileInput = $('#fileUpload').get(0).files[0];
                                    console.info(fileInput);
                                    if(fileInput){
                                        alert("文件已加载！");
                                    }else{
                                        alert("请先选择需要上传文件！");
                                    }
                                }
                                // $("#btn-upload").click(function(){
                                // var url = "/upLoad";
                                // var data = new FormData($("#btn-upload")[3]);
                                // console.log(data);
                                // $.ajax({
                                //     "url":url,
                                //     "data":data,
                                //     "contentType": false,/* 因为是由<form>表单构造的FormData对象，所以这里设置为false。 */
                                //     "processData": false,/* 因为data值是FormData对象，不需要对数据做处理。 */
                                //     "type":"POST",
                                //     "dataType":"json", /* 响应头里有此表示 application/json */
                                //     "success":function(){
                                //        alert("已加载");
                                // }
                                // });
                                // $.post("/upLoad",function(result){
                                //     alert(result.measure);
                                // });
                                // });
							</script>
							</div>
							<div class="col-xs-10">
								<button type="button" class="btn btn-default" onclick="checkedSubmit(this)">发布帖子</button>
							</div>
						</div>
					</form>
					<%--绑定发布按钮事件--%>
                    <script>
                        function checkedSubmit(obj) {
                            var userIdex = $('#userIndexId').val();
                            if(userIdex=='-1'){
                                alert('请先登录后再发帖');
                                return false;
                            }
                            if($('#titlename').val().length<=0 || $('#content').val().length <= 0){
                                alert('请输入标题或内容');
                                return false;
                            }
                            $("#pushTopicbbsForm").submit();
                        }
                    </script>
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