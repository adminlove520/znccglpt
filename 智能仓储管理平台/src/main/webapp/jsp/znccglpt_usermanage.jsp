<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户管理</title>
    <link rel="stylesheet" href="/css/znccglpt_usermanage.css"/>
    <script src="/js/jquery-3.3.1.min.js"></script>
</head>
<body>
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
    <script type="text/javascript" src="/js/znccglpt_usermanage.js"></script>
</body>
</html>
