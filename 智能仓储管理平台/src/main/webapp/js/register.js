// 账户注册
<!-- 密码强度 -->
function checkStrong(sPW){
    if(sPW.length<=3)
        return 1; //弱
    else if(sPW.length<=6){
        return 2; //中
    }
    else if(sPW.length<=9){
        return 3; //强
    }
}
function pwStrength(pwd){
    Dfault_color="#eeeeee"; //灰色
    L_color="#FF0000"; //红色
    M_color="#FF9900"; //橙色
    H_color="#33CC00"; //绿色
    if (pwd==null||pwd==''){
        Lcolor=Mcolor=Hcolor=Dfault_color;
    }
    else{
        S_level=checkStrong(pwd);
        switch(S_level) {
            case 0:
                Lcolor=Mcolor=Hcolor=Dfault_color;
                break;
            case 1:
                Lcolor=L_color;
                Mcolor=Hcolor=Dfault_color;
                break;
            case 2:
                Lcolor=Mcolor=M_color;
                Hcolor=Dfault_color;
                break;
            default:
                Lcolor=Mcolor=Hcolor=H_color;
        }
    }
    document.getElementById("strength_L").style.background=Lcolor;
    document.getElementById("strength_M").style.background=Mcolor;
    document.getElementById("strength_H").style.background=Hcolor;
}

<!-- 获取验证码 -->
var waittime=3; //等待时间
var time; //计时器对象
var VCODE; //验证码
var phonumber; //电话号码
function timedMsg(){
    phonumber=document.getElementById('phonumber').value;
    if(phonumber==''){
        alert("请输入手机号用以接收验证码"+'\n');
    }
    else if((phonumber.length<11)||(phonumber.length>11)){
        alert("请输入正确的手机号"+'\n');
    }
    else{
        if(waittime==0){
            VCODE=Math.floor(1000+Math.random()*8999);
            document.getElementById("box7").value="获取验证码";
            document.getElementById("blank").style.display="none";
            waittime=10;
            alert("您的手机号为："+phonumber+'\n'+'\n'+"随机验证码为："+VCODE+'\n');
            clearTimeout(time);
        }
        else{
            document.getElementById("blank").style.display="block";
            document.getElementById("box7").value="重新发送("+waittime+")";
            waittime--;
            time=setTimeout('timedMsg()',1000);
        }
    }
}

<!-- 注册验证 -->
function check(){
    console.log("点击");
    var userName=document.getElementById("username").value;
    var passWord=document.getElementById("password").value;
    var passWord2=document.getElementById("password2").value;
    var realName=document.getElementById("realname").value;
    var phoNumber=document.getElementById("phonumber").value;
    var vCode=document.getElementById("vcode").value;
    if(userName==""){
        alert("请输入用户名!");
    }
    else if(passWord==""){
        alert("请输入密码!");
    }
    else if(realName==""){
        alert("请输入真实姓名!");
    }
    else if(phoNumber==""){
        alert("请输入手机号码!");
    }
    else if(vCode==""){
        alert("请输入验证码!");
    }
    else if(passWord!=passWord2){
        alert("密码不一致，请重新输入!");
        document.getElementById("password").value="";
        document.getElementById("password2").value="";
    }
    else if(vCode!=VCODE){
        alert("验证码错误！请重新输入！");
        document.getElementById("vcode").value="";
    }
    else {
        var username = $("#username").val();
        var password = $("#password").val();
        var realname = $("#realname").val();
        var phonumber = $("#phonumber").val();
        $.ajax({
            type: "post",
            url: "/ssm/doRegister",
            data: {
                username: username,
                password: password,
                realname: realname,
                phonumber: phonumber
            },
            success: function(data) {
                window.location.href = "账户开通3?"+username+"&"+password+"";
            },
            error:function (data) {
                window.location.href = "账户开通4?"+username+"&"+password+"";
            }
        });
    }
}

document.getElementById("box7").onmouseover=function(){ //获取验证码按钮
    this.style.cursor='pointer';
}
document.getElementById("register").onmouseover=function(){ //注册按钮
    this.style.cursor='pointer';
}