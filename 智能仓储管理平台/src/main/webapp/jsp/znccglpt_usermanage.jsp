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
                <input id="select" type="search" placeholder="请输入ID/用户名/真实姓名">
                <div id="selectByIdOrUserName">查询</div>
                <div id="adduser">新增</div>
                <div id="deleteusers">批量删除</div>
            </div>
            <div style="height: 85%;">
                <table id="userlist" cellpadding="0" cellspacing="0">
                    <tbody>
                    <tr>
                        <td><span style="cursor: pointer;">全选</span></td>
                        <td>用户ID</td>
                        <td>用户名</td>
                        <td>真实姓名</td>
                        <td>联系方式</td>
                        <td>权限</td>
                        <td>上级</td>
                        <td>操作</td>
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
    <div id="userinfodetail" class="detail" tabindex="0">
        <table>
            <th colspan="2" style="text-align: center;">
                —————— <span>用户详情</span> ——————
            </th>
            <tr>
                <td rowspan="3">
                    头&emsp;&emsp;像：
                    <img id="userphoto" class="userphoto">
                </td>
                <td>用户&emsp;ID：<span id="id"></span></td>
            </tr>
            <tr>
                <td>用&nbsp;&thinsp;户&thinsp;&nbsp;名：<span id="username"></span></td>
            </tr>
            <tr>
                <td>账号密码：<span id="password"></span></td>
            </tr>
            <tr>
                <td>真实姓名：<span id="realname"></span></td>
                <td>联系方式：<span id="phonumber"></span></td>
            </tr>
            <tr>
                <td>权&emsp;&emsp;限：<span name="type" id="type" class="readonly" readonly="readonly"></span></td>
                <td>上&emsp;&emsp;级：<span name="director" id="director" class="readonly" readonly="readonly"></span></td>
            </tr>
            <tr>
                <td colspan="2">
                    个人简介：
                    <span id="userdescribe"></span>
                </td>
            </tr>
        </table>
        <div id="confirm">
            <div id="quit">取消</div>
        </div>
    </div>
    <div id="adddetail" class="detail" tabindex="0">
        <table>
            <form method="post" enctype="multipart/form-data" id="adduserinfoform">
                <th colspan="2" style="text-align: center;">
                    —————— <span>用户新增</span> ——————
                </th>
                <tr>
                    <td rowspan="3">
                        头&emsp;&emsp;像：
                        <img id="userphoto_a" class="userphoto" src="/picture/system/1.jpeg">
                        <input type="file" id="file_a" name="file" style="display:none;">
                    </td>
                    <td>用&nbsp;&thinsp;户&thinsp;&nbsp;名：<input name="username" id="username_a"></td>
                </tr>
                <tr>
                    <td>账号密码：<input type="password" name="password" id="password_a"></td>
                </tr>
                <tr>
                    <td>确认密码：<input type="password" id="password2_a"></td>
                </tr>
                <tr>
                    <td>真实姓名：<input name="realname" id="realname_a"></td>
                    <td>联系方式：<input name="phonumber" id="phonumber_a"></td>
                </tr>
                <tr>
                    <td>权&emsp;&emsp;限：<input name="type" id="type_a" class="readonly" readonly="readonly"></td>
                    <td>上&emsp;&emsp;级：<input name="director" id="director_a" class="readonly" readonly="readonly"></td>
                </tr>
            </form>
        </table>
        <div  class="operation">
            <div class="save">保存</div>
            <div class="cancel">取消</div>
        </div>
    </div>
    <div id="updatedetail" class="detail" tabindex="0">
        <table>
            <form method="post" enctype="multipart/form-data" id="updateuserinfoform">
                <th colspan="2" style="text-align: center;">
                    —————— <span>用户信息编辑</span> ——————
                </th>
                <tr>
                    <td rowspan="3">
                        头&emsp;&emsp;像：
                        <img id="userphoto_u" class="userphoto">
                        <input type="file" id="file_u" name="file" style="display:none;">
                    </td>
                    <td>用户&emsp;ID：<input name="id" id="id_u" class="readonly" readonly="readonly"></td>
                </tr>
                <tr>
                    <td>用&nbsp;&thinsp;户&thinsp;&nbsp;名：<input name="username" id="username_u"></td>
                </tr>
                <tr>
                    <td>账号密码：<input type="password" name="password" id="password_u"></td>
                </tr>
                <tr>
                    <td>真实姓名：<input name="realname" id="realname_u"></td>
                    <td>联系方式：<input name="phonumber" id="phonumber_u"></td>
                </tr>
                <tr>
                    <td>权&emsp;&emsp;限：<input name="type" id="type_u" class="readonly" readonly="readonly"></td>
                    <td>上&emsp;&emsp;级：<input name="director" id="director_u" class="readonly" readonly="readonly"></td>
                    <input name="userdescribe" id="userdescribe_u" style="display:none;">
                </tr>
            </form>
        </table>
        <div  class="operation">
            <div class="save">保存</div>
            <div class="cancel">取消</div>
        </div>
    </div>
    <script type="text/javascript" src="/js/znccglpt_usermanage.js"></script>
</body>
</html>
