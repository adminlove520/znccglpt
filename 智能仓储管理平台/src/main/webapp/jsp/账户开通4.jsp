<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>账户开通3</title>
    <link rel="stylesheet" href="/css/title.css">
    <link rel="stylesheet" href="/css/button.css">
    <style type="text/css">
        #body1{
            width: 100%;
            height: 550px;
            text-align: center;
            position: relative;
        }
        #body2{
            width: 100%;
            height: 480px;
            text-align: center;
            position: relative;
        }
        #box1{
            width: 325px;
            height: 300px;
            position: absolute;
            margin: auto;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
        }
        #box1-1{
            width: 120px;
            height: 34px;
            float: left;
            color: white;
            text-align: center;
            line-height: 34px;
            font-size: 16px;
            background-color: #6B6B6B;
        }
        #box1-2{
            width: 200px;
            height: 30px;
            font-size: 16px;
            float: left;
            text-align: center;
        }
        #box1-3{
            width: 120px;
            height: 34px;
            float: left;
            color: white;
            text-align: center;
            line-height: 34px;
            font-size: 16px;
            position: relative;
            top: 30px;
            background-color: #6B6B6B;
        }
        #box1-4{
            width: 200px;
            height: 30px;
            float: left;
            font-size: 16px;
            text-align: center;
            position: relative;
            top: 30px;
        }
        #box1-7{
            width: 320px;
            height: 30px;
            float: left;
            font-size: 16px;
            text-align: center;
            position: relative;
            top: 60px;
        }
        #box1-8{
            width: 200px;
            height: 30px;
            float: left;
            font-size: 16px;
            position: relative;
            top: 90px;
            left: 60px;
        }
    </style>
    
</head>
<body>
    <div id="title">
        <font style="padding-left: 5em">欢迎来到智能仓储管理系统</font>
        <ul>
            <li>
                <a class="a1" href="#">关注新浪微博</a>
                <ul>
                    <li>
                        <div class="menu">
                            <div class="QRcode"><img src="/picture/QRcode1.png" width="100%" height="100%"></div>
                        </div>
                    </li>
                </ul>
            </li>
            <li>
                <a class="a1" href="#">关注微信</a>
                <ul>
                    <li>
                        <div class="menu">
                            <div class="QRcode"><img src="/picture/QRcode2.png" width="100%" height="100%"></div>
                        </div>
                    </li>
                </ul>
            </li>
            <li><a class="a1" href="#">服务电话：020-26298802</a></li>
        </ul>
    </div>
    <div id="logo">
        <ul>
            <li><a class="a2" href="/ssm/index">首页</a></li>
            <li><a class="a2" href="/ssm/产品中心">产品中心</a></li>
            <li><a class="a2" href="#">解决方案</a></li>
            <li><a class="a2" href="#">个性化服务</a></li>
            <li><a class="a2" href="#">关于我们</a></li>
            <li>
                <div id="touch"><a class="a2" href="#">联系我们</a></div>
            </li>
        </ul>
    </div>
    <div id="body1">
        <div id="box1">
            <div id="box1-1">账户名称</div>
            <input id="box1-2" type="text" name="username" disabled="true">
            <div id="box1-3">账户密码</div>
            <input id="box1-4" type="text" name="password" disabled="true">
            <form action="/ssm/账户开通2">
                <input id="box1-7" type="text" name="username" value="账号已被注册，请重新注册账号！" disabled="true">
                <input id="box1-8" type="submit" name="submit" value="重新注册">
            </form>
        </div>
    </div>
    <div id="bottom">
        <div id="bottom-1">
        <br>
            <p id="p1">Rovinj.cn</p>
            <p id="p2">时尚行业RFID应用专家</p>
            <div id="line3"></div>
            <div id="line4"></div>
            <p id="p3">020-26298802</p>
        </div>
        <div id="bottom-2">
            <div id="box">关注微博</div>
            <div id="QRcode1"><img src="/picture/QRcode1.png" width="100%" height="100%"></div>
            <div id="QRcode2"><img src="/picture/QRcode2.png" width="100%" height="100%"></div>
        </div>
        <div id="bottom-3"><font color="white">Copyright ©2016 广州罗维尼信息科技有限公司 版权所有 | 粤ICP备05001008号</font></div>
    </div>
</body>
<script type="text/javascript">
    var parameter = window.location.href.split("?")[1];
    var parameterList = parameter.split("&");
    var username = decodeURIComponent(parameterList[0]);
    var password = parameterList[1];
    document.getElementById("box1-2").value = username;
    document.getElementById("box1-4").value = password;
</script>
</html>