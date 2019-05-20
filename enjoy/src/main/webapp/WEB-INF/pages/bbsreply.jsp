<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link rel="stylesheet" type="text/css" href="builder/css/bbsreply.css"/>
    <title>享受·生活</title>
</head>
<body>
<%@ include file="header.jsp" %>
<input type="hidden" id="userIndexId" value="${ok}">
<a name="top"></a>
<div id="page-content">
    <div id="go-to-btn-container">
        <div class="go-to-btn-shadow"></div>
        <div class="go-to-btn-shadow"></div>
        <a href="#top" data-action="go-to-top" class="go-to-btn go-to-top"
           title="返回顶部"></a> <a href="#bottom" data-action="go-to-bottom"
                                class="go-to-btn go-to-bottom" title="返回底部"></a>
    </div>
    <div id="page-post">
        <div class="post-body" id="post-read">
            <%--<div class="paging paging-top">--%>
                <%--<div class="paging-button n">--%>
                    <%--<a class="link" href="#"></a>返回社区--%>
                <%--</div>--%>
                <%--<div class="paging-button n active">--%>
                    <%--<a class="link" href="#"></a>1--%>
                <%--</div>--%>
                <%--<div class="paging-button n">--%>
                    <%--<a class="link" href="#"></a>2--%>
                <%--</div>--%>
                <%--<div class="paging-button n">--%>
                    <%--<a class="link" href="#"></a>下一页 &gt;--%>
                <%--</div>--%>
                <%--<div class="paging-input-wrapper">--%>
                    <%--<input type="number" data-role="goto-input" max="2" min="1"--%>
                           <%--value="1">--%>
                <%--</div>--%>
                <%--<div>/ 2</div>--%>
                <%--<div class="paging-button">--%>
                    <%--<a data-action="goto-link" class="link"></a>跳转--%>
                <%--</div>--%>
            <%--</div>--%>
            <header>
                <h3>${topList.ttopic}</h3>

                <img src=""> </span> </span>
            </header>
            <div class="card-list">
                <div class="post-card">
                    <div id=""
                         style="position: absolute; visibility: hidden; top: -170px;"></div>
                    <div class="post-owner">
                        <span class="lz-tag">楼主</span>
                        <a class="portrait-container" href="">
                            <img class="portrait" src="builder/imgs/flybut.jpg">
                    </a>
                        <p class="username">
                            <a href="#">${topList.author}</a>
                        </p>
                        <%--<p class="level-bar">12</p>--%>
                        <%--<div class="detail">--%>
                            <%--<span class="label">发帖数：</span>--%>
                        <%--</div>--%>
                        <div class="functions">
                            <div class="line"></div>
                        </div>
                    </div>
                    <div class="post-main">
                        <span class="post-id">1楼</span>
                        <div class="content">
                            <div class="body file-read image-click-view">
                                <p>${topList.tcontents}</p>
                                <c:if test="${not empty topList.timage}"><img src="${topList.timage}"></c:if>
                                <%--<img src="builder/upload/0b7ece91-8543-4ce2-b1d6-740b34be5ea5.jpg">--%>
                            </div>
                        </div>
                        <div class="operations">
                            <div class="toolbox">
                                <ul>
                                    <li><a class="disable" title="请登录后继续操作"><span
                                            class="image reply"></span><span>回帖</span></a></li>
                                    <li style="display: none"></li>
                                </ul>
                            </div>
                            <div class="right">
                                <div class="sl-triangle-container">
                                    <span class="title">
                                        <span>
                                            <fmt:formatDate value="${topList.ttime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                        </span>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <c:forEach items="${reList}" var="replay" varStatus="status">
                    <div class="post-card" data-bid="" data-postid="" data-threadid="">
                        <div
                                style="position: absolute; visibility: hidden; top: -54px;"></div>
                        <div class="post-owner">
                            <a class="portrait-container" href="user.php?uid=28124"> <img
                                    class="portrait" src="builder/imgs/Liviee.jpg">
                            </a>
                            <p class="username">
                                <a href="#">${replay.suname}</a>
                            </p>
                            <%--<div class="detail">--%>
                                <%--<span class="label">发帖数：</span>4049--%>
                            <%--</div>--%>
                            <div class="functions">
                                <div class="line"></div>
                            </div>
                        </div>
                        <div class="post-main">
                            <span class="post-id">${status.count}楼</span>
                            <div class="content">
                                <div class="body file-read image-click-view">
                                    <p>${replay.scontents}</p>
                                    <p>
                                        <br>
                                    </p>
                                </div>
                            </div>
                            <div class="operations">
                                <div class="toolbox">
                                    <ul>
                                        <li><a class="disable" title="请登录后继续操作"><span
                                                class="image reply"></span><span>回帖</span></a></li>
                                        <li style="display: none"></li>
                                    </ul>
                                </div>
                                <div class="right">
                                    <div class="sl-triangle-container">
											<span class="title">
                                                <span>
                                                    <fmt:formatDate value="${replay.stime}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
                                            </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- </div> -->
                </c:forEach>
            </div>
            <!-- start _new-thread-simple.php-->
            <!-- start new-thread-simple -->
            <form action="newReplay" method="post" id="goToReply">
                <div id="bdwm-editor" class="bdwm-editor" data-bid="162"
                     data-parentid="" data-title="" data-redirect="">
                    <input type="hidden" name="tid" value="${topList.tid}"/>
                    <input type="hidden" name="stid" value="${topList.tid}"/>
                    <div class="input-wrapper content-input">
                        <!-- scontents:回帖内容 -->
                        <textarea id="scontentsId" name="scontents" data-role="new-post-textarea"
                                  tabindex="-1" placeholder="输入您的回复..."></textarea>
                    </div>
                    <div class="row">
                        <div class="r">
                            <!-- <div class="publish-button extended" tabindex="-1">  -->
                            <%--<button type="submit" class="btn btn-default">发布</button>--%>
                            <button type="button" class="btn btn-default" onclick="checkedRepSubmit(this)">发布帖子</button>
                            <!-- </div>  -->
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <%--绑定发布按钮事件--%>
        <script>
            function checkedRepSubmit(obj) {
                var userIndex = $("#userIndexId").val();
                if (userIndex == -1){
                    alert("请先登录才可发帖");
                    return false;
                }
                if($("#scontentsId").val().length <= 0 ){
                    alert("回复内容不能为空")
                    return false;
                }
                $("#goToReply").submit();
            }
        </script>
        <!-- end new-thread-simple -->
        <!-- end _new-thread-simple.php-->
    </div>
    <a name="bottom"></a>
    <!--</div>-->
    <!-- 页脚 -->
    <div class="container-fluid">
        <%@ include file="footer.jsp" %>
    </div>
</div>
</body>
</html>