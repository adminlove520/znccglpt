<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>智能仓储管理平台</title>
    <link rel="stylesheet" href="/css/znccglpt_center.css"/>
    <script src="/js/jquery-3.3.1.min.js"></script>
</head>
<body>
    <div id="top">
        <div id="icon">
            <img src="/picture/system/icon_u4.png">
        </div>
        <div id="name">智能仓储管理平台</div>
        <div id="head"></div>
        <div id="LoginName"></div>
    </div>
    <div id="set">
        <ul>
            <li id="back">返回</li>
            <li id="logout">退出登录</li>
        </ul>
    </div>
    <div id="left">
        <ul id="menu">
            <li id="1" class="list" target="iframe_a">个人资料</li>
            <li id="2" class="list" target="iframe_a">用户管理</li>
        </ul>
    </div>
    <div id="right">
        <iframe id="iframe" src="" name="iframe_a" width="100%" height="92%" frameborder="0"></iframe>
        <form id="form" action="" target="iframe_a" method="post"></form>
    </div>
    <script type="text/javascript" src="/js/znccglpt_center.js"></script>
</body>
</html>
