// 用户管理
var length; //数据总条数
var start; //从第几条数据开始显示
var end; //到第几条数据结束显示
var pageSize = 10; //每页显示数据数目
var pageCount; //总页数
var infoType; //0：新增    1：编辑
var parameter = window.location.href.split("?")[1];
var parameterList = parameter.split("&");
var username = decodeURIComponent(parameterList[0]);
var searchword = decodeURIComponent(parameterList[1]);
var pageNo = parameterList[2];
var UserName = username; //UserName为当前登录者的用户名，以避免和下面获取到的用户列表用户名冲突

$("#select").val(searchword);
$("#pageNo").val(pageNo);

//进入页面显示个人资料
$.ajax({
    type: "post",
    url: "/ssm/doSelectByIdOrUserName",
    data: {
        searchword: searchword,
        username:UserName
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
        infoType = 1;
        $("#detailtitle").text("用户信息编辑");
        var i  = $(this).parent().parent().attr("arrId");
        var userinfo = userList[i];
        $('#detail').show();
        $(".shandow").show().css('z-index', '11');
        $("#id").text(userinfo.id);
        $("#username").text(userinfo.username);
        $("#password").html("<input type='password' value='"+userinfo.password+"'>");
        $("#realname").html("<input value='"+userinfo.realname+"'>");
        $("#phonumber").html("<input value='"+userinfo.phonumber+"'>");
        $("#type").text(userinfo.type);
        $("#director").text(userinfo.director);
        $("#userdescribe").text(userinfo.userdescribe);
    });
    //删除
    $("#userlist").on("click","tr td #deleteuser",function () {
        var r=confirm("请确认是否删除用户？");
        if (r==true){
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
                    // if(data.result == 0){
                    //     alert("删除成功！");
                    // }
                    // if(data.result == 1){
                    //     alert("删除失败，该用户不存在！");
                    // }
                    window.location.href = "znccglpt_usermanage?"+UserName+"&&1";
                },
                error: function (data) {
                    // console.log("error");
                    // console.log(data);
                }
            });
        }
    });
};
//查询
$("#selectByIdOrUserName").bind("click", function() {
    var searchword = $("#select").val();
    window.location.href = "znccglpt_usermanage?"+UserName+"&"+searchword+"&1";
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
    if(pId.length == 0){
        alert("请勾选要批量删除的用户！");
    }
    else{
        var r=confirm("请确认是否删除用户？");
        if (r==true){
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
            // alert("删除成功！");
            window.location.href = "znccglpt_usermanage?"+UserName+"&&1";
        }
    }
});
//翻页
$("#previous").bind("click", function() {
    pageno = pageNo * 1 - 1;
    if(pageno <= 0){
        alert("没有上一页！");
    }
    else{
        window.location.href = "znccglpt_usermanage?"+UserName+"&&"+pageno;
    }
});
$("#next").bind("click", function() {
    pageno = pageNo * 1 + 1;
    if(pageno > pageCount){
        alert("没有下一页！");
    }
    else{
        window.location.href = "znccglpt_usermanage?"+UserName+"&&"+pageno;
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
        window.location.href = "znccglpt_usermanage?"+UserName+"&&"+pageno;
    }
});
//新增
$("#adduser").bind("click", function() {
    infoType = 0;
    $('#detail').show();
    $(".shandow").show().css('z-index', '11');
    $("#detailtitle").text("用户新增");
    // $("#id").text("系统自动生成");
    // $("#username").html("<input type='username'>");
    // $("#password").html("<input type='password'>");
    $("#a").html("用&nbsp;&thinsp;户&thinsp;&nbsp;名：<span id='username'><input type='username'></span>");
    $("#b").html("账号密码：<span id='password'><input type='password'></span>");
    $("#c").html("确认密码：<span id='password2'><input type='password'></span>");
    $("#realname").html("<input type='realname'>");
    $("#phonumber").html("<input type='phonumber'>");
    $("#type").text("1");
    $("#director").text(UserName);
});
//保存编辑
$("#save").bind("click", function() {
    if(infoType == 0){
        var username = $('#username').children("input").val();
        var password = $('#password').children("input").val();
        var password2 = $('#password2').children("input").val();
        var realname = $('#realname').children("input").val();
        var phonumber = $('#phonumber').children("input").val();
        var type = $('#type').text();
        var director = $('#director').text();
        if((username == "")||(password == "")||(password2 == "")||(realname == "")||(phonumber == "")){
            alert("请输入新增用户信息！");
        }
        else if(password != password2){
            alert("密码不一致，请重新输入！");
        }
        else if(phonumber.length != 11){
            alert("请输入正确的手机号码！");
        }
        else{
            addUser(username,password,realname,phonumber,type,director);
        }
    }
    else if(infoType == 1){
        var id = $('#id').text();
        var username = $('#username').text();
        var password = $('#password').children("input").val();
        var realname = $('#realname').children("input").val();
        var phonumber = $('#phonumber').children("input").val();
        var type = $('#type').text();
        var director = $('#director').text();
        var userdescribe = $('#userdescribe').text();
        if(phonumber.length != 11){
            alert("请输入正确的手机号码！");
        }
        else{
            updateUser(id,username,password,realname,phonumber,type,director,userdescribe);
        }
    }
});
//取消编辑
$("#cancel").bind("click", function() {
    $('#detail').hide();
    $(".shandow").hide().css('z-index','-1');
});
var addUser = function (username,password,realname,phonumber,type,director) {
    $.ajax({
        type: "post",
        url: "/ssm/doAddNormalUser",
        data: {
            username: username,
            password: password,
            realname: realname,
            phonumber: phonumber,
            type: type,
            director: director
        },
        success: function (data) {
            // console.log("success");
            // console.log(data);
            switch(data.result) {
                case 1:
                    alert("该用户已存在!");
                    break;
                case 0:
                    alert("新增成功!");
                    window.location.href = "znccglpt_usermanage?"+UserName+"&&1";
                    break;
            }
        },
        error: function (data) {
            // console.log("error");
            // console.log(data);
        }
    });
};
var updateUser = function (id,username,password,realname,phonumber,type,director,userdescribe) {
    $.ajax({
        type: "post",
        url: "/ssm/doUpdate",
        data: {
            id: id,
            username: username,
            password: password,
            realname: realname,
            phonumber: phonumber,
            type: type,
            director: director,
            userdescribe: userdescribe
        },
        success: function (data) {
            // console.log("success");
            // console.log(data);
            alert("修改成功！");
            window.location.href = "znccglpt_usermanage?" + UserName + "&" + searchword + "&" + pageNo;
        },
        error: function (data) {
            // console.log("error");
            // console.log(data);
        }
    });
};