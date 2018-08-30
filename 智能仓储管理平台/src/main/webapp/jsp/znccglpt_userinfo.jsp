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
                <form method="post" enctype="multipart/form-data" id="updateform">
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
                    <td>
                        <div class="block"></div>
                        <input id="id" name="id">
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>用户名：</td>
                    <td>
                        <div class="block"></div>
                        <input id="username" name="username">
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>密码：</td>
                    <td>
                        <div class="block"></div>
                        <input type="password" id="password" name="password" >
                    </td>
                </tr>
                <tr>
                    <td>真实姓名：</td>
                    <td>
                        <div class="block"></div>
                        <input id="realname" name="realname">
                    </td>
                    <td></td>
                    <td>联系方式：</td>
                    <td>
                        <div class="block"></div>
                        <input id="phonumber" name="phonumber">
                    </td>
                </tr>
                <tr>
                    <td>权限：</td>
                    <td>
                        <div class="block"></div>
                        <input id="type" name="type">
                    </td>
                    <td></td>
                    <td>上级：</td>
                    <td>
                        <div class="block"></div>
                        <input id="director" name="director">
                    </td>
                </tr>
                <tr>
                    <td>个人简介：</td>
                    <td colspan="4">
                        <div class="textareablock"></div>
                        <textarea id="userdescribe" name="userdescribe"></textarea>
                    </td>
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
