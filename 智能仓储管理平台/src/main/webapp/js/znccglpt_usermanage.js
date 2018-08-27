// 用户管理
var length; //数据总条数
var start; //从第几条数据开始显示
var end; //到第几条数据结束显示
var pageSize = 10; //每页显示数据数目
var pageCount; //总页数
var parameter = window.location.href.split("?")[1];
var parameterList = parameter.split("&");
var username = decodeURIComponent(parameterList[0]);
var searchword = decodeURIComponent(parameterList[1]);
var pageNo = parameterList[2];
$("#select").val(searchword);
$("#pageNo").val(pageNo);
//进入页面显示个人资料
$.ajax({
    type: "post",
    url: "/ssm/doSelectByIdOrUserName",
    data: {
        searchword: searchword,
        username:username
    },
    success: function (data) {
        // console.log("success");
        // console.log(data);
        getUserList(data);
    },
    error: function (data) {
        // console.log("error");
        // console.log(data);
    }
});
var getUserList = function (data) {
    userList = data.list;
    length = userList.length;
    start = (pageNo - 1) * pageSize;
    end = pageNo * pageSize;
    pageCount = Math.ceil(length / 10);
    if(end >= length){
        end = length;
    }
    // console.log("总条数："+length);
    // console.log("总页数："+pageCount);
    // console.log("当前页数："+pageNo);
    // console.log("显示第"+start+"条到第"+end+"条数据");
    $("#totalcount").html("当前共"+length+"条记录");
    $("#pageCount").html("第"+pageNo+"页|共"+pageCount+"页");
    insertHtml(start,end);
};
var insertHtml = function (start,end) {
    for(var i=start;i<end;i++) {
        var userinfo = userList[i];
        var strhtml = '<tr id="' + i + '" arrId="' + i + '">';
        strhtml = strhtml + '<td style="width: 5%;"><input type="checkbox" id="delete" style="width: 20px;height: 20px;"></td>';
        strhtml = strhtml + '<td style="width: 10%;">' + userinfo.id + '</td>';
        strhtml = strhtml + '<td style="width: 15%;">' + userinfo.username + '</td>';
        strhtml = strhtml + '<td style="width: 15%;">' + userinfo.realname + '</td>';
        strhtml = strhtml + '<td style="width: 20%;">' + userinfo.phonumber + '</td>';
        strhtml = strhtml + '<td style="width: 10%;">' + userinfo.type + '</td>';
        strhtml = strhtml + '<td style="width: 10%;">' + userinfo.director + '</td>';
        strhtml = strhtml + '<td style="width: 15%;"><button id="changeuserinfo">编辑</button> | <button id="deleteuser">删除</button></td>';
        $("#userlist").append(strhtml);
    }
    //编辑
    $("#userlist").on("click","tr td #changeuserinfo",function () {
        var i  = $(this).parent().parent().attr("arrId");
        var userinfo = userList[i];
        $('#detail').show().focus();
        $(".shandow").show().css('z-index', '11');
        $("#id").text(userinfo.id);
        $("#username").text(userinfo.username);

        // $("#password").text(userinfo.password);
        // $("#realname").text(userinfo.realname);
        // $("#phonumber").text(userinfo.phonumber);

        $("#password").html("<input value='"+userinfo.password+"'>");
        $("#realname").html("<input value='"+userinfo.realname+"'>");
        $("#phonumber").html("<input value='"+userinfo.phonumber+"'>");


        $("#type").text(userinfo.type);
        $("#director").text(userinfo.director);
    });
    //删除
    $("#userlist").on("click","tr td #deleteuser",function () {
        var i  = $(this).parent().parent().attr("arrId");
        var userinfo = userList[i];
        var id = userinfo.id;
        $.ajax({
            type: "post",
            url: "/ssm/doDelete",
            data: {
                id: id
            },
            success: function (data) {
                // console.log("success");
                // console.log(data);
                if(data.result == 0){
                    alert("删除成功！");
                }
                if(data.result == 1){
                    alert("删除失败，该用户不存在！");
                }
                window.location.href = "znccglpt_usermanage?"+username+"&&1";
            },
            error: function (data) {
                // console.log("error");
                // console.log(data);
            }
        });
    });
};
//查询
$("#selectByIdOrUserName").bind("click", function() {
    var searchword = $("#select").val();
    window.location.href = "znccglpt_usermanage?"+username+"&"+searchword+"&1";
});
//批量删除
var pId = [];
var pid;
$("#userlist").on("click","tr td #delete",function () {
    var i = $(this).parent().parent().attr("arrId");
    if($(this).is(':checked')) {
        pId.push(userList[i].id);
    }
    else{
        pId.splice($.inArray(userList[i].id,pId),1);
    }
});
$("#deleteusers").bind("click", function() {
    for(var n = 0;n < pId.length;n ++) {
        pid = pId[n];
        $.ajax({
            type: "post",
            url: "/ssm/doDelete",
            data: {
                id: pid
            },
            success: function (data) {
                // console.log("success");
                // console.log(data);
            },
            error: function (data) {
                // console.log("error");
                // console.log(data);
            }
        });
    }
    alert("删除成功！");
    window.location.href = "znccglpt_usermanage?"+username+"&&1";
});
//翻页
$("#previous").bind("click", function() {
    pageno = pageNo * 1 - 1;
    if(pageno <= 0){
        alert("没有上一页！");
    }
    else{
        window.location.href = "znccglpt_usermanage?"+username+"&&"+pageno;
    }
});
$("#next").bind("click", function() {
    pageno = pageNo * 1 + 1;
    if(pageno > pageCount){
        alert("没有下一页！");
    }
    else{
        window.location.href = "znccglpt_usermanage?"+username+"&&"+pageno;
    }
});
//跳转
$("#Go").bind("click", function() {
    pageno = $("#pageNo").val();
    if((pageno <= 0)||(pageno > pageCount)){
        $("#pageNo").val("");
        alert("页码超出范围！");
    }
    else{
        window.location.href = "znccglpt_usermanage?"+username+"&&"+pageno;
    }
});
$("#detail").blur(function () {
    // $('#detail').hide();
    // $(".shandow").hide().css('z-index','-1');
});