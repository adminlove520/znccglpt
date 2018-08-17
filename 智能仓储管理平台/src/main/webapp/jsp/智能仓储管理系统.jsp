<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>智能仓储管理系统</title>
    <link rel="stylesheet" type="text/css" href="/css/title.css">
    <link rel="stylesheet" type="text/css" href="/css/button.css">
    <link rel="stylesheet" type="text/css" href="/css/pic_shuffling.css">
    <link rel="stylesheet" type="text/css" href="/css/brand_shuffling.css">
    <style type="text/css">
        #begin{
            width: 100%;
            height: 110px;
        }
        #title{
            position: fixed;
            top: 0;
            z-index : 10;
        }
        .menu{
            z-index: 20;
        }
        #logo{
            position: fixed;
            top: 30px;
            z-index: 5;
        }
        #body2{
            width: 100%;
            height: 100px;
            font-size: 20px;
            position: relative;
        }
        #function{
            width: 95%;
            height: 100px;
            position: absolute;
            margin: auto;
            left: 0;
            right: 0;
            background-color: rgb(1,150,147);
        }
        #enter{
            width: 100%;
            height: 80px;
            position: absolute;
            margin: auto;
            top: 0;
            bottom: 0;
        }
        #enter img{
            vertical-align:middle;
        }
        .enter1{
            width: 24.9%;
            height: 80px;
            float: left;
            line-height: 80px;
            text-align: center;
            border-right: 1px dashed white;
        }
        .enter2{
            width: 24.9%;
            height: 80px;
            float: left;
            line-height: 80px;
            text-align: center;
        }
        .blank{
            width: 100%;
            height: 50px;
        }
        #process{      /*350*650*/
            width: 102px;
            height: 18px;
            position: fixed;
            top: 90px;
            left: 1212px;
            z-index: 9999;
            opacity: 0;
            transition: 1s;
            overflow: hidden;
        }
        #service1{
            width: 100%;
            height: 8.3333333333%;/*40px*/
            color: white;
            font-size: 20px;
            line-height: 40px;
            background-color: #6B6B6B;
        }
        #serpic{
            width: 6.153846154%;/*40px*/
            height: 100%;/*40px*/
            float: left;
            border-radius: 50%;
            background-size: 100% 100%;
            background-image: url(/picture/serpic1.png);
        }
        #serword{
            width: 87.69230769%;
            height: 100%;
            float: left;
            background-size: 100% 100%;
            background-image: url(/picture/serpic2.png);
        }
        #serout{
            width: 3.076923077%;/*20px*/
            height: 50%;/*20px*/
            float: right;
            position: relative;
            top: 25%;/*10px*/
            right: 10px;
            background-size: 100% 100%;
            background-image: url(/picture/out.png);
        }
        #service2{
            width: 100%;
            height: 68.75%;/*330*/
            background-size: 100% 100%;
            background-image: url(/picture/talk1.png);
        }
        #service3{
            width: 100%;
            height: 22.916666667%;/*110*/
            padding-left: 5px;
            padding-right: 5px;
            background-size: 100% 100%;
            background-image: url(/picture/talk2.png);
        }
        #out{
            width: 60px;
            height: 30px;
            position: relative;
            top: -40px;
            left: 505px;
        }
        #offer{
            width: 60px;
            height: 30px;
            position: relative;
            top: -40px;
            left: 515px;
        }
        #body3{
            width: 100%;
            height: 400px;
            position: relative;
        }
        #ad{
            width: 95%;
            height: 400px;
            text-align: center;
            position: absolute;
            margin: auto;
            left: 0;
            right: 0;
            background-size:100% 100%;
            background-image: url(/picture/handshake.jpg);
        }
        #ad p{
            color: white;
            font-size: 40px;
            font-family: 隶书;
            line-height: 750px;
        }
        #ad p font{
            font-family: LiSu;
        }
    </style>
</head>
<body>
    <div id="begin"></div>
    <div id="title">
        <font style="padding-left: 5em;">欢迎来到智能仓储管理系统</font>
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
            <li style="font-size:15.3px;"><a class="a1" href="#">服务电话：020-26298802</a></li>
        </ul>
    </div>
    <div id="logo">
        <ul id="ul">
            <li><a class="a2" href="#">首页</a></li>
            <li><a class="a2" href="/ssm/产品中心">产品中心</a></li>
            <li><a class="a2" href="#">解决方案</a></li>
            <li><a class="a2" href="#">个性化服务</a></li>
            <li><a class="a2" href="#">关于我们</a></li>
            <li>
                <div id="touch"><a class="a2" href="#" onclick="service()">联系我们</a></div>
            </li>
        </ul>
    </div>
    <div id="body1">
        <div id="picture">
            <ul id="carousel">
                <li><img></li>
                <li><img></li>
                <li><img></li>
                <li><img></li>
            </ul>
            <ul id="chooseul">
                <li><div class="btr"></div></li>
                <li><div class="btr"></div></li>
                <li><div class="btr"></div></li>
                <li><div class="btr"></div></li>
            </ul>
        </div>
        <div id="process">
            <div id="service1">
                <div id="serpic"></div>
                <div id="serword"></div>
                <div id="serout" onclick="out()"></div>
            </div>
            <div id="service2"></div>
            <input id="service3" type="textarea" name="text">
            <input id="out" type="button" name="" value="关闭" onclick="out()">
            <input id="offer" type="button" name="" value="提交" onclick="submit()">
        </div>
    </div>
    <div id="body2">
        <div id="function">
            <div id="enter">
                <div class="enter1"><a class="a1" href="/ssm/产品中心"><img src="/picture/enter1.png">产品在线</a></div>
                <div class="enter1"><a class="a1" href="/ssm/账户开通"><img src="/picture/enter2.png">账户开通</a>
                </div>
                <div class="enter1"><a class="a1" href="/ssm/进入系统"><img src="/picture/enter3.png">进入系统</a></div>
                <div class="enter2"><a class="a1" href="#"  onclick="service()"><img src="/picture/enter4.png">在线客服</a></div>
            </div>
        </div>
    </div>
    <div class="blank"></div>
    <div id="body3">
        <div id="ad">
            <p><font>国内RFID首选，用户口碑业内领先</font></p>
        </div>
    </div>
    <div class="blank"></div>
    <div id="body4">
        <div id="cooperate">
            <div id="pic" onmouseover="show()" onmouseleave="display()">
                <font size="5">合作客户</font><br>
                <font size="3">Cooperative client</font><br>
                <div id="line">
                    <div class="line1"></div>
                    <div class="line2"></div>
                    <div class="line1"></div>
                </div>
                <div id="container">
                    <div id="left" onclick="left()"><</div>
                    <div id="right" onclick="right()">></div>
                    <div id="brand">
                        <div id="brand1"></div>
                        <div id="brand2"></div>
                        <div id="brand3"></div>
                        <div id="brand4"></div>
                        <div id="brand5"></div>
                    </div>
                </div>
            </div>
            <div id="picline"></div>
        </div>
    </div>
    <div class="blank"></div>
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

    <script type="text/javascript">
        window.onload=function(){
           pic_shuffling();
           brand_shuffling();
        }
    </script>

    <%--对话框--%>
    <script type="text/javascript">
        function service(){
            document.getElementById("process").style.opacity="1";
            document.getElementById("process").style.top="120px";
            document.getElementById("process").style.left="350px";
            document.getElementById("process").style.width="650px";
            document.getElementById("process").style.height="480px";
        }
        function out(){
            document.getElementById("process").style.opacity="0";
            document.getElementById("process").style.top="90px";
            document.getElementById("process").style.left="1212px";
            document.getElementById("process").style.width="102px";
            document.getElementById("process").style.height="18px";
        }
        function submit(){

        }
    </script>

    <%--图片轮播--%>
    <script type="text/javascript" src="/js/pic_shuffling.js"></script>
    <%--品牌轮播--%>
    <script type="text/javascript" src="/js/brand_shuffling.js"></script>
</body>
</html>