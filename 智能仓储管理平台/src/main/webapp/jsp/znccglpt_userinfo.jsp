<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人资料</title>
    <link rel="stylesheet" href="/css/znccglpt_userinfo.css"/>
    <script src="/js/jquery-3.3.1.min.js"></script>
</head>
<body>
    <div id="userinfo">
        <div id="title">我的资料</div>
        <div id="info">
            <table id="table">
               <tr>
                   <td rowspan="3">头像：</td>
                   <td rowspan="3" style="position: relative">
                       <div id="userphoto"></div>
                       <div id="userphotoinfo">
                           只能上传小于2M的jpg/png格式图片
                       </div>
                   </td>
                   <td width="100px"></td>
                   <td>ID：</td>
                   <td><input id="id" disabled="disabled"></td>
               </tr>
                <tr>
                    <td></td>
                    <td>用户名：</td>
                    <td><input id="username" disabled="disabled"></td>
                </tr>
                <tr>
                    <td></td>
                    <td>密码：</td>
                    <td><input type="password" id="password" disabled="disabled"></td>
                </tr>
                <tr>
                    <td>真实姓名：</td>
                    <td><input id="realname" disabled="disabled"></td>
                    <td></td>
                    <td>联系方式：</td>
                    <td><input id="phonumber" disabled="disabled"></td>
                </tr>
                <tr>
                    <td>权限：</td>
                    <td><input id="type" disabled="disabled"></td>
                    <td></td>
                    <td>上级：</td>
                    <td><input id="director" disabled="disabled"></td>
                </tr>
                <tr>
                    <td>个人简介：</td>
                    <td colspan="4"><textarea id="userdescribe" disabled="disabled"></textarea></td>
                </tr>
            </table>
            <div id="button">
                <button id="change">修改</button>
                <button id="update">保存</button>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="/js/znccglpt_userinfo.js"></script>
</body>
</html>
