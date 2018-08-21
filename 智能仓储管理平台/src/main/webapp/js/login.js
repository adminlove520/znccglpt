// 用户登录
var username;
var password;
var type;
$("#login").click(function (){
    username = $("#username").val();
    password = $("#password").val();
    type = $('input:radio[name="type"]:checked').val();
    if(username == ""){
        alert("请输入用户名！");
    }
    else if(password == ""){
        alert("请输入密码！");
    }
    else if(type == null){
        alert("请选择身份权限！");
    }
    else{
        console.log(username);
        console.log(password);
        console.log(type);
    }
});
