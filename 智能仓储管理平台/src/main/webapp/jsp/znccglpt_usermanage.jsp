<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户管理</title>
    <link rel="stylesheet" href="/css/znccglpt_usermanage.css"/>
    <script src="/js/jquery-3.3.1.min.js"></script>
</head>
<body>
    <div class="shandow"></div>
    <div id="usermanage">
        <div id="title">用户管理</div>
        <div id="manage">
            <div id="managebutton" align="center">
                <input id="select" type="search" placeholder="请输入ID/用户名">
                <button id="selectByIdOrUserName">查询</button>
                <button id="adduser">新增</button>
                <button id="deleteusers">批量删除</button>
            </div>
            <div style="height: 85%;">
                <table id="userlist">
                    <tbody>
                    <tr>
                        <th><span style="cursor: pointer;">全选</span></th>
                        <th>用户ID</th>
                        <th>用户名</th>
                        <th>真实姓名</th>
                        <th>联系方式</th>
                        <th>权限</th>
                        <th>上级</th>
                        <th>操作</th>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div id="fenye">
                <div id='totalcount'></div>
                <div id="previous" class="fanye">上一页</div>
                <div id="next" class="fanye">下一页</div>
                <div id="pageCount"></div>
                <input id="pageNo" type="text"/>
                <input id="Go" type="submit" value="GO"/>
            </div>
        </div>
    </div>
    <div id="detail" tabindex="0">
        <table>
            <th colspan="2" style="text-align: center;">
                —————— <span id="detailtitle">用户信息编辑</span> ——————
            </th>
            <tr>
                <td>用户&emsp;ID：<span id="id"></span></td>
            </tr>
            <tr>
                <td>用&nbsp;&thinsp;户&thinsp;&nbsp;名：<span id="username"></span></td>
                <td>账号密码：<span id="password"></span></td>
            </tr>
            <tr>
                <td>真实姓名：<span id="realname"></span></td>
                <td>联系方式：<span id="phonumber"></span></td>
            </tr>
            <tr>
                <td>权&emsp;&emsp;限：<span id="type"></span></td>
                <td>上&emsp;&emsp;级：<span id="director"></span></td>
                <span id="userdescribe" style="display: none"></span>
            </tr>
        </table>
        <div  id="operation">
            <div id="save">保存</div>
            <div id="cancel">取消</div>
        </div>
    </div>
    <script type="text/javascript" src="/js/znccglpt_usermanage.js"></script>
</body>
</html>
