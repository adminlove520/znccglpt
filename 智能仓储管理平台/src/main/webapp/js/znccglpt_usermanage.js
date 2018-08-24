// 用户管理
var parameter = window.location.href.split("?")[1];
var parameterList = parameter.split("&");
var username = decodeURIComponent(parameterList[0]);
var type = parameterList[1];
//进入页面显示个人资料
$.ajax({
    type: "post",
    url: "/ssm/doSelectByDirector",
    data: {
        username: username
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
    insertHtml(userList.length);
};
var insertHtml = function (count) {
    for(var i=0;i<count;i++) {
        var userinfo = userList[i];
        var strhtml = '<tr id="' + i + '" arrId="' + i + '">';
        strhtml = strhtml + '<td style="width: 5%;"><input type="checkbox" style="width: 20px;height: 20px;"></td>';
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
        console.log(userinfo);
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
                console.log("success");
                console.log(data);
                if(data.result == 0){
                    alert("删除成功！");
                }
                if(data.result == 1){
                    alert("删除失败，该用户不存在！");
                }
                window.location.href = "znccglpt_usermanage?"+username+"";
            },
            error: function (data) {
                // console.log("error");
                // console.log(data);
            }
        });
    });
};
