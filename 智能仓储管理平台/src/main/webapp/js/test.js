// 账户注册
var username;
var password;
var realname;
var phonumber;
$("#register").bind("click", function() {
    username = $("#username").val();
    password = $("#password").val();
    realname = $("#realname").val();
    phonumber = $("#phonumber").val();
    $.ajax({
        type: "post",
        url: "/ssm/doRegister",
        data: {
            username: username,
            password: password,
            realname: realname,
            phonumber: phonumber
        },
        dataType: 'JSON',
        xhrFields: {
            withCredentials: true
        },
        success: function(data) {
            console.log(data.username);
            console.log(data.password);
            console.log(data.realname);
            console.log(data.phonumber);
        }
    });
});