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
        strhtml = strhtml + '<td style="width: 5%;"><input type="checkbox" id="delete" class="checkbox" style="width: 20px;height: 20px;"></td>';
        strhtml = strhtml + '<td style="width: 10%;">' + userinfo.id + '</td>';
        strhtml = strhtml + '<td style="width: 15%;">' + userinfo.username + '</td>';
        strhtml = strhtml + '<td style="width: 15%;">' + userinfo.realname + '</td>';
        strhtml = strhtml + '<td style="width: 20%;">' + userinfo.phonumber + '</td>';
        if(userinfo.type == 0){
            strhtml = strhtml + '<td style="width: 8%;">管理员</td>';
        }
        if(userinfo.type == 1){
            strhtml = strhtml + '<td style="width: 8%;">用户</td>';
        }
        strhtml = strhtml + '<td style="width: 8%;">' + userinfo.director + '</td>';
        strhtml = strhtml + '<td style="width: 19%;"><button id="userdetail">详情</button>|<button id="changeuserinfo">编辑</button>|<button id="deleteuser">删除</button></td>';
        $("#userlist").append(strhtml);
    }
    //详情
    $("#userlist").on("click","tr td #userdetail",function () {
        $('#userinfodetail').show();
        $(".shandow").show().css('z-index', '11');

        var i  = $(this).parent().parent().attr("arrId");
        var userinfo = userList[i];
        if(userinfo.imgurl == ""){
            $("#userphoto").attr("src", "/picture/system/1.jpeg");
        }
        else{
            $("#userphoto").attr("src", userinfo.imgurl);
        }
        $("#id").text(userinfo.id);
        $("#username").text(userinfo.username);
        $("#password").text(userinfo.password);
        $("#realname").text(userinfo.realname);
        $("#phonumber").text(userinfo.phonumber);
        $("#type").text("用户");
        $("#director").text(UserName);
        $("#userdescribe").text(userinfo.userdescribe);
    });
    //编辑
    $("#userlist").on("click","tr td #changeuserinfo",function () {
        infoType = 1;
        $('#updatedetail').show();
        $(".shandow").show().css('z-index', '11');
        $("#userphoto_u").css("cursor","pointer");

        var i  = $(this).parent().parent().attr("arrId");
        var userinfo = userList[i];
        if(userinfo.imgurl == ""){
            $("#userphoto_u").attr("src", "/picture/system/1.jpeg");
        }
        else{
            $("#userphoto_u").attr("src", userinfo.imgurl);
        }
        $("#id_u").val(userinfo.id);
        $("#username_u").val(userinfo.username);
        $("#password_u").val(userinfo.password);
        $("#realname_u").val(userinfo.realname);
        $("#phonumber_u").val(userinfo.phonumber);
        $("#type_u").val("用户");
        $("#director_u").val(UserName);
        $("#userdescribe_u").val(userinfo.userdescribe);
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
var pId = [];
var pid;
//全选删除
$("#all").click(function () {
    var xz = $(this).prop("checked"); //判断全选按钮的选中状态
    $(".checkbox").prop("checked",xz); //让class名为checkbox的选项的选中状态和全选按钮的选中状态一致
    $(".checkbox").each(function() {
        if (this.checked) {
            var i = $(this).parent().parent().attr("arrId");
            if(pId.indexOf(userList[i].id) == -1){
                pId.push(userList[i].id);
            }
        }
        else{
            pId.splice(0,pId.length);
        }
    });
});
//批量删除
$("#userlist").on("click","tr td #delete",function () {
    var i = $(this).parent().parent().attr("arrId");
    if($(this).is(':checked')) {
        if(pId.indexOf(userList[i].id) == -1){
            pId.push(userList[i].id);
        }
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
//头像预览
$("#userphoto_a").click(function () {
    $("#file_a").click();
    $("#file_a").on("change",function() {
        var files = event.target.files, file;
        if (files && files.length > 0) {
            // 获取目前上传的文件
            file = files[0]; //文件大小校验的动作
            if (file.size > 1024 * 1024 * 2) {
                alert('图片大小不能超过 2MB!');
                return false;
            }
            var URL = window.URL || window.webkitURL;
            // 通过 file 生成目标 url
            var imgURL = URL.createObjectURL(file);
            //用attr将img的src属性改成获得的url
            $("#userphoto_a").attr("src", imgURL);
        }
    });
});
$("#userphoto_u").click(function () {
    $("#file_u").click();
    $("#file_u").on("change",function() {
        var files = event.target.files, file;
        if (files && files.length > 0) {
            // 获取目前上传的文件
            file = files[0]; //文件大小校验的动作
            if (file.size > 1024 * 1024 * 2) {
                alert('图片大小不能超过 2MB!');
                return false;
            }
            var URL = window.URL || window.webkitURL;
            // 通过 file 生成目标 url
            var imgURL = URL.createObjectURL(file);
            //用attr将img的src属性改成获得的url
            $("#userphoto_u").attr("src", imgURL);
        }
    });
});
//新增
$("#adduser").bind("click", function() {
    infoType = 0;
    $('#adddetail').show();
    $(".shandow").show().css('z-index', '11');
    $("#userphoto_a").css("cursor","pointer");

    $("#type_a").val("用户");
    $("#director_a").val(UserName);
});
//保存编辑
$(".save").bind("click", function() {
    if(infoType == 0){
        var username = $('#username_a').val();
        var password = $('#password_a').val();
        var password2 = $('#password2_a').val();
        var realname = $('#realname_a').val();
        var phonumber = $('#phonumber_a').val();

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
            addUser();
        }
    }
    else if(infoType == 1){
        updateUser();
    }
});
//取消编辑
$(".cancel").bind("click", function() {
    if(infoType == 0){
        $('#adddetail').hide();
    }
    else if(infoType == 1){
        $('#updatedetail').hide();
    }
    $(".shandow").hide().css('z-index','-1');
});
//确认详情
$("#quit").bind("click", function() {
    $('#userinfodetail').hide();
    $(".shandow").hide().css('z-index', '-1');
});
var addUser = function () {
    var formData = new FormData($("#adduserinfoform")[0]);
    $.ajax({
        type: "post",
        url: "/ssm/doAddNormalUser",
        data: formData ,
        async: false,
        cache: false,
        contentType: false,
        processData: false,
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
var updateUser = function () {
    var formData = new FormData($("#updateuserinfoform")[0]);
    $.ajax({
        type: "post",
        url: "/ssm/doUpdate",
        data: formData ,
        async: false,
        cache: false,
        contentType: false,
        processData: false,
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