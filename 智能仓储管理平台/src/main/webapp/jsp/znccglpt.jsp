<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<title>智能仓储管理平台</title>
		<link rel="stylesheet" href="/css/znccglpt.css"/>
		<script src="/js/jquery-3.3.1.min.js"></script>
	</head>
	<body>
		<div id="top">
			<div id="icon">
				<img src="/picture/system/icon_u4.png">
			</div>
			<div id="name">智能仓储管理平台</div>
			<img id="head" src="/picture/system/1.jpeg"></img>
			<div id="LoginName"></div>
		</div>
		<div id="set">
			<ul>
				<li id="center">个人中心</li>
				<li>选项设置</li>
				<li id="logout">退出登录</li>
			</ul>
		</div>
		<div id="left">
			<ul id="menu">
                <li id="1" class="list" target="iframe_a">入库管理</li>
                <li id="2" class="list" target="iframe_a">物品查询</li>
                <li id="3" class="list" target="iframe_a">物品盘点</li>
                <li id="4" class="list" target="iframe_a">出库管理</li>
                <li id="5" class="list" target="iframe_a">物品位置移动记录</li>
                <%--<li id="6" class="list" target="iframe_a">仓库管理</li>--%>
            </ul>
		</div>
		<div id="right">
            <iframe id="iframe" src="/ssm/znccglpt_index" name="iframe_a" width="100%" height="92%" frameborder="0"></iframe>
            <form id="form1" action="" target="iframe_a" method="post"></form>
       </div>
		<script type="text/javascript" src="/js/znccglpt.js"></script>
	</body>
</html>
