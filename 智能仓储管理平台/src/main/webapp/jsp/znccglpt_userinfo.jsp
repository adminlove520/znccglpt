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
                <form method="post" enctype="multipart/form-data" id="upload">
                <tr>
                    <td rowspan="3">头像：</td>
                    <td rowspan="3" style="position: relative">
                       <img src="/picture/system/1.jpeg" id="userphoto">
                       <input type="file" id="file" name="file" style="display:none;" disabled="disabled">
                       <div id="userphotoinfo">
                           只能上传小于2M的jpg/png格式图片
                       </div>
                    </td>
                    <td width="100px"></td>
                    <td>ID：</td>
                    <td><input id="id" name="id" readonly = "readonly"></td>
                </tr>
                <tr>
                    <td></td>
                    <td>用户名：</td>
                    <td><input id="username" name="username" readonly = "readonly"></td>
                </tr>
                <tr>
                    <td></td>
                    <td>密码：</td>
                    <td><input type="password" id="password" name="password" disabled="disabled"></td>
                </tr>
                <tr>
                    <td>真实姓名：</td>
                    <td><input id="realname" name="realname" disabled="disabled"></td>
                    <td></td>
                    <td>联系方式：</td>
                    <td><input id="phonumber" name="phonumber" disabled="disabled"></td>
                </tr>
                <tr>
                    <td>权限：</td>
                    <td><input id="type" name="type" readonly = "readonly"></td>
                    <td></td>
                    <td>上级：</td>
                    <td><input id="director" name="director" readonly = "readonly"></td>
                </tr>
                <tr>
                    <td>个人简介：</td>
                    <td colspan="4"><textarea id="userdescribe" name="userdescribe" disabled="disabled"></textarea></td>
                </tr>
                </form>
            </table>
            <div id="button">
                <button id="change">修改</button>
                <button id="update" disabled="disabled">保存</button>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="/js/znccglpt_userinfo.js"></script>
</body>
</html>
