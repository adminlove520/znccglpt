var parameter = window.location.href.split("?")[1];
var parameterList = parameter.split("&");
var username = decodeURIComponent(parameterList[0]);
var type = parameterList[1];
//进入页面显示个人资料
$.ajax({
    type: "post",
    url: "/ssm/doSelect",
    data: {
        username: username
    },
    success: function (data) {
        // console.log("success");
        // console.log(data);
        $("#id").val(data.user.id);
        $("#username").val(data.user.username);
        $("#password").val(data.user.password);
        $("#realname").val(data.user.realname);
        $("#phonumber").val(data.user.phonumber);
        $("#type").val(data.user.type);
        $("#director").val(data.user.director);
        $("#userdescribe").val(data.user.userdescribe);
    },
    error: function (data) {
        // console.log("error");
        // console.log(data);
    }
});
//保存修改
$("#update").click(function (){
    var id = $("#id").val();
    var username = $("#username").val();
    var password = $("#password").val();
    var realname = $("#realname").val();
    var phonumber = $("#phonumber").val();
    var type = $("#type").val();
    var director = $("#director").val();
    var userdescribe = $("#userdescribe").val();
    $.ajax({
        type: "post",
        url: "/ssm/doUpdate",
        data: {
            id:id,
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
            alert("更新成功！")
            window.location.href = "znccglpt_userinfo?"+username+"";
        },
        error: function (data) {
            // console.log("error");
            // console.log(data);
        }
    });
});