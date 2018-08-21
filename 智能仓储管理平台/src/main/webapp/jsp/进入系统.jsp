<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" href="/css/login.css"/>
    <script src="/js/jquery-3.3.1.min.js"></script>
</head>
<body>
    <div id="left"></div>
    <div id="right">
        <div id="quit"></div>
        <div id="loginInput">
            <input id="username" type="text" class="loginInput" placeholder="用户名"/>
            <input id="password" type="password" class="loginInput" placeholder="密码" /><br>
            <div id="user">
                <input type="radio"  name="type" class="loginRadio" value="1"/>用户
            </div>
            <div id="admin">
                <input type="radio" name="type" class="loginRadio" value="0"/>管理员<br>
            </div>
            <input id="login" type="submit" value="登录" onmouseover="this.style.backgroundColor ='#1AAAE8';" onmouseout="this.style.backgroundColor = '#1699D5';" />
        </div>
    </div>
    <script type="text/javascript" src="/js/login.js"></script>
</body>
</html>
