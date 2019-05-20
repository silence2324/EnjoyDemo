<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%--  以下若是在被加载的页面中已经引用过了，会出现js等冲突，所以确认只需要引用当前必须的，切记！！！！ --%>
    <%--<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->--%>
    <%--<!-- Bootstrap -->--%>
    <%--<link href="builder/css/bootstrap.min.css" rel="stylesheet">--%>
    <%--<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->--%>
    <%--<script src="builder/js/jquery-3.2.1.min.js"></script>--%>
    <%--<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->--%>
    <%--<script src="builder/js/bootstrap.min.js"></script>--%>
    <%--<link href="builder/css/bootstrapValidator.min.css" rel="stylesheet">--%>
    <%--<script src="builder/js/bootstrapValidator.js"></script>--%>
    <%--<title></title>--%>
</head>
<body>
<ul class="pagination pagination-sm no-margin pull-right">
    <li><a class="first">首页</a></li>
    <li><a class="pre">上一页</a></li>
    <li><a class="next">下一页</a></li>
    <li><a class="last">尾页</a></li>
    <li><a class="rowCount">总记录数(0)</a></li>
    <li><a class="pageCount">总页数(0)</a></li>
    <li><a class="pageCurrent">当前页(1)</a></li>
</ul>

<%--绑定页面按钮点击事件--%>
<script type="text/javascript">
    $(function () {
        //在pageId内部的子元素(.first...)上注册点击事件，同时对多个元素注册时间使用on函数
        $("#pageId").on("click", ".first,.pre,.next,.last", doJumpToPage)
    });

    function doJumpToPage() {
        //$(this):当前被点击的对象;.prop():为jQuery中的一个函数，用户获取或为对象属性赋值或获取属性值
        var cls = $(this).prop("class");
        console.log(cls);
        //2.基于class属性的值修改当前页面值
        //2.1获取当前页码值以及总页数
        var pageCurrent = $("#pageId").data("pageCurrent");
        var pageCount = $("#pageId").data("pageCount");
        //2.2基于class属性的值修改当前页码值
        if (cls == "first") {
            pageCurrent = 1;
        } else if (cls == "pre" && pageCurrent > 1) {//上一页
            pageCurrent--;
        } else if (cls == "next" && pageCurrent < pageCount) {//下一页
            pageCurrent++;
        } else if (cls == "last") {//最后一页
            pageCurrent = pageCount;
        } else {
            return;
        }
        //3.对pageCurrent值进行重新绑定
        $("#pageId").data("pageCurrent", pageCurrent);
        //4.基于新的pageCurrent的值进行当前页数据查询
        doGetObjects();
    }

    //初始化分页信息
    function doSetPagination(pageObject) {
        //1.初始化总记录数
        $(".rowCount").html("总记录数(" + pageObject.rowCount + ")")
        //2.初始化总页数
        $(".pageCount").html("总页数(" + pageObject.pageCount + ")")
        //3.初始化当前页码
        $(".pageCurrent").html("当前页(" + pageObject.pageCurrent + ")")
        console.log(pageObject.pageCurrent)
        //4.存储当前页码值以及总页数:data()相当于put()
        $("#pageId").data("pageCurrent", pageObject.pageCurrent);
        $("#pageId").data("pageCount", pageObject.pageCount);
        //其中jQuery为每个html元素对象都定义了一个data函数，类似java语言map对象中的put方法和get方法
        //当方法中有两个参数时，就是存key,value数据，一个参数时就表示取数据
    }
</script>
</body>
</html>