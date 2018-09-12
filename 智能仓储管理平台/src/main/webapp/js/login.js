// 用户登录
var username;
var password;
var vcode;
var type;
$("#login").click(function (){
    username = $("#username").val();
    password = $("#password").val();
    vcode = $("#vcode").val();
    type = $('input:radio[name="type"]:checked').val();
    if(username == ""){
        alert("请输入用户名！");
    }
    else if(password == ""){
        alert("请输入密码！");
    }
    else if(vcode == ""){
        alert("请输入验证码！");
    }
    else if(type == null){
        alert("请选择身份权限！");
    }
    else{
        $.ajax({
            type: "post",
            url: "/ssm/doLogin",
            data: {
                username: username,
                password: password,
                vcode: vcode,
                type: type
            },
            success: function(data) {
                // console.log("success");
                // console.log(data.result);
                // console.log(data.type);
                switch(data.result){
                    case 1:
                        alert("该用户未注册!");
                        clean();
                        break;
                    case 2:
                        alert("用户名或密码错误!");
                        clean();
                        break;
                    case 3:
                        alert("验证码错误!");
                        clean();
                        break;
                    case 4:
                        alert("权限错误!");
                        clean();
                        break;
                    case 0:
                        // console.log("登录成功!")
                        window.location.href = "znccglpt?"+username+"&"+data.type+"";
                        break;
                }
            },
            error:function (data) {
                // console.log("error");
                // console.log(data);
            }
        });
    }
});

//点击刷新验证码
$("#vcode_pic").click(function (){
    $("#vcode_pic").attr("src","/ssm/doGetVcode?" + new Date().getTime());
});

//退出
$("#quit").click(function (){
    window.location.href = "index";
});

//清空输入框
function clean() {
    $("#password").val("");
    $("#vcode").val("");
    $("#vcode_pic").attr("src","/ssm/doGetVcode?" + new Date().getTime());
    // $("#usertype").removeAttr('checked');
    // $("#admintype").removeAttr('checked');
}