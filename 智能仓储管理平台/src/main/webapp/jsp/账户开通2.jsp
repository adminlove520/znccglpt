<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>账户开通2</title>
    <link rel="stylesheet" href="/css/title.css">
    <link rel="stylesheet" href="/css/button.css">
    <script src="/js/jquery-3.3.1.min.js"></script>
    <style type="text/css">
        #body{
            width: 100%;
            height: 630px;
            position: relative;
        }
        #info{
            width: 325px;
            height: 440px;
            position: absolute;
            margin: auto;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
        }
        #box1{
            width: 325px;
            height: 50px;
            font-size: 30px;
            line-height: 50px;
            text-align: center;
            position: relative;
            top: -50px;
        }
        #box2{
            width: 120px;
            height: 34px;
            float: left;
            color: white;
            text-align: center;
            line-height: 34px;
            font-size: 16px;
            background-color: #6B6B6B;
            position: relative;
            top: -30px;
        }
        #username{
            width: 200px;
            height: 30px;
            font-size: 16px;
            float: left;
            position: relative;
            top: -30px;
        }
        #box3{
            width: 120px;
            height: 34px;
            float: left;
            color: white;
            text-align: center;
            line-height: 34px;
            font-size: 16px;
            position: relative;
            top: 0px;
            background-color: #6B6B6B;
        }
        #password{
            width: 200px;
            height: 30px;
            float: left;
            font-size: 16px;
            position: relative;
            top: 0px;
        }
        #box4{
            width: 120px;
            height: 34px;
            float: left;
            color: white;
            text-align: center;
            line-height: 34px;
            font-size: 16px;
            position: relative;
            top: 10px;
            background-color: #6B6B6B;
        }
        #password2{
            width: 200px;
            height: 30px;
            float: left;
            font-size: 16px;
            position: relative;
            top: 10px;
        }
        #box5{
            width: 120px;
            height: 34px;
            float: left;
            color: white;
            text-align: center;
            line-height: 34px;
            font-size: 16px;
            position: relative;
            top: 40px;
            background-color: #6B6B6B;
        }
        #realname{
            width: 200px;
            height: 30px;
            float: left;
            font-size: 16px;
            position: relative;
            top: 40px;
        }
        #box6{
            width: 120px;
            height: 34px;
            float: left;
            color: white;
            text-align: center;
            line-height: 34px;
            font-size: 16px;
            position: relative;
            top: 70px;
            background-color: #6B6B6B;
        }
        #phonumber{
            width: 200px;
            height: 30px;
            float: left;
            font-size: 16px;
            position: relative;
            top: 70px;
        }
        #box7{
            width: 120px;
            height: 34px;
            float: left;
            color: white;
            text-align: center;
            line-height: 34px;
            font-size: 16px;
            position: relative;
            top: 100px;
            background-color: #6B6B6B;
        }
        #vcode{
            width: 201px;
            height: 30px;
            float: right;
            font-size: 16px;
            position: relative;
            top: 100px;
        }
        #register{
            width: 200px;
            height: 30px;
            float: left;
            font-size: 16px;
            position: relative;
            top: 130px;
            left: 60px;
        }
        #blank{
            width: 120px;
            height: 32px;
            position: relative;
            top: 271px;
            opacity: 0.5;
            display: none;
            background-color: #CCCCCC;
        }
        #safe{
            width: 323px;
            height: 20px;           
            text-align: center;
            line-height: 20px;
            position: relative;
            top: 5px;
        }
        #safename{
            width: 120px;
            float: left;
        }
        #strength_L{
            width: 67px;
            float: left;
            background-color: #eeeeee;
            border-right: 1px dashed #6B6B6B;
        }
        #strength_M{
            width: 67px;
            float: left;
            background-color: #eeeeee;
        }
        #strength_H{
            width: 67px;
            float: left;
            background-color: #eeeeee;
            border-left: 1px dashed #6B6B6B;
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
    <div id="body">
        <div id="info">
            <div id="box1"><font>账号注册</font></div>
            <div id="box2">账户名称</div>
            <input id="username" type="text" placeholder="不支持中文和特殊字符"/>
            <div id="box3">设置密码</div>
            <input id="password" type="password" placeholder="设置账号密码" onKeyUp="pwStrength(this.value)" onBlur="pwStrength(this.value)"/>
            <div id="safe">
                <div id="safename">安全系数：</div>
                <div id="strength_L" bgcolor="#eeeeee">低</div>
                <div id="strength_M" bgcolor="#eeeeee">中</div>
                <div id="strength_H" bgcolor="#eeeeee">高</div>
            </div>
            <div id="box4">确认密码</div>
            <input id="password2" type="password" placeholder="重新输入密码">
            <div id="box5">真实姓名</div>
            <input id="realname" type="text" placeholder="请输入真实姓名"/>
            <div id="box6">手机号码</div>
            <input id="phonumber" type="text" placeholder="请输入手机号"/>
            <input id="box7" type="button" value="获取验证码" onClick="timedMsg()">
            <input id="vcode" type="text" placeholder="请输入手机收到的验证码">
            <input id="register" type="submit" value="下一步" onclick="check()">
            <div id="blank"></div>
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
    <script type="text/javascript" src="/js/register.js"></script>
</body>
</html>