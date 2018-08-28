var parameter = window.location.href.split("?")[1];
var parameterList = parameter.split("&");
var username = decodeURIComponent(parameterList[0]);
var type = parameterList[1];
var id;
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
        id = data.user.id;
        $("#id").val(data.user.id);
        $("#username").val(data.user.username);
        $("#password").val(data.user.password);
        $("#realname").val(data.user.realname);
        $("#phonumber").val(data.user.phonumber);
        if(data.user.type == 0){
            $("#type").val("管理员");
        }
        if(data.user.type == 1){
            $("#type").val("用户");
        }
        if(data.user.type == ""){
            $("#director").val("无");
        }
        else{
            $("#director").val(data.user.director);
        }
        $("#userdescribe").val(data.user.userdescribe);
        if(data.user.imgurl != ""){
            console.log(data.user.imgurl);
            $("#userphoto").attr("src",data.user.imgurl);
        }
    },
    error: function (data) {
        // console.log("error");
        // console.log(data);
    }
});
//修改
$("#change").click(function (){
    //可修改内容仅限密码，真实姓名，联系方式，个人简介
    $('#password').attr("disabled",false);
    $('#realname').attr("disabled",false);
    $('#phonumber').attr("disabled",false);
    $('#userdescribe').attr("disabled",false);
    $('#update').attr("disabled",false);
    $('#uploadfile').attr("disabled",false);
});
//头像上传
var imgURL;
$("#userphoto").click(function () {
    $("#uploadfile").click();
    $("#uploadfile").on("change",function() {
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
            imgURL = URL.createObjectURL(file);
            //用attr将img的src属性改成获得的url
            $("#userphoto").attr("src", imgURL);
        }
    });
});
//更新
$("#update").click(function (obj){
    var id = $("#id").val();
    var username = $("#username").val();
    var password = $("#password").val();
    var realname = $("#realname").val();
    var phonumber = $("#phonumber").val();
    var type = $("#type").val();
    var imgurl = $("#uploadfile").val();
    console.log(imgurl);
    console.log(imgURL);
    if(type == "管理员"){
        type = 0;
    }
    if(type == "用户"){
        type = 1;
    }
    var director = $("#director").val();
    if(director == "无"){
        director = "";
    }
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
            userdescribe: userdescribe,
            imgurl: imgurl, //虚假路径
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