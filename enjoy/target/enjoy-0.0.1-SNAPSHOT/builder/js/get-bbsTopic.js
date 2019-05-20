$(function(){
    /*页面加载完成，异步加载分页div*/
    $("#pageId").load("doPageUI",function(){//异步load之后，启动function的工作线程
        doGetObjects();
    });

});

//根据条件查询数据
function doGetObjects(){
    //$("#checkAll").prop("checked",false);
    //debugger//控制台窗口打开时才有意义，才会进入调试
    //1.定义请求参数，json格式的js对象
    var pageCurrent=$("#pageId").data("pageCurrent");
    if(!pageCurrent)pageCurrent=1;
    var params = {"pageCurrent":pageCurrent};
    //当用户查询时获取用户输入的用户名并添加到参数对象中
    var uname = $("#searchNameId").val();
    if(uname) params.username=uname;
    //2.定义请求的url
    var url = "doFindPageObjects";
    //3.发送异步请求：jQuery对象，提供get()函数---jQuery内部的一个异步请求函数,至少传入url参数，再传一个回调函数
    $.getJSON(url,params,function(result){//当服务器端有结果返回时，会回调function()函数，即响应结束时调用此匿名function()函数，函数内的参数可以省略
        console.log(result);
        //处理服务端的响应结果
        doHandleResponseResult(result);
    });
    //},"json");//type：默认是json格式的js的Object，如果配置是"text"就是字符串格式，如果是"json"就是json格式的字符串；getJSON()是一个特殊的get函数,type就是json格式
}
function doHandleResponseResult(result){//result==JsonResult
    if(result.state==1){//jsonResult.state
        //1.呈现当前页的记录信息
        //测试是否能拿到数据
        console.log(result.data.records);//jsonResult.data.records==pageObject.records==List<SysLog>
        doSetTableBodyRows(result.data.records);//更新table中tbody内部的数据
        //2.呈现当前页的分页页码信息
        doSetPagination(result.data);//pageObject
    }else{
        //给出相关提示
        alert(result.message);
    }
}
//创建一行中的多个td
function doSetTableBodyRows(records){
    //1.获取tbody对象并清空原有内容
    var tBody = $("#mybody");
    tBody.empty();//清空tBody中的内容
    //2.迭代记录并将其内容添加到tBody中
    for(var i=0;i<records.length;i++){
        //2.1构建tr对象
        var tr=$("<tr></tr>")
        //2.2构建多个td对象
        var tds=doCreateTds(records[i],i);
        //2.3将td追加到tr中
        tr.append(tds);
        //2.4将tr追加到tBody中
        tBody.append(tr);
    }
}
function doCreateTds(data,i){
    console.log("data:"+data);
    var tds="<td><input type='hidden' name='tuid' value='"+data.tuid+"'/>" +
        "<input id='getid' type='hidden' name='tid' value='"+data.tid+"'/>"+(parseInt(i)+1)+"</td>"+
        "<td class='titleTd'><a name='title_1' href='javascript:void(0)' " +
        "onclick='gotoReply(this)'>"+data.ttopic+"</a></td>"+
        "<td class='authorTd'><p id='author_1'>"+data.author+"</p></td>"+
        "<td class='dateTd'><p id='date_1'>"+new Date(data.ttime).toLocaleString() +"</p></td>";
    return tds;
}


//注册跳转reply点击事件
function gotoReply(obj) {
    var tid = $(obj).parent().parent().find("input[name='tid']").val();
    window.location.href="replyList?tid="+tid;
}