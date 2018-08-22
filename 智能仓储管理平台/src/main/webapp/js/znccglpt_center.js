// 个人中心
var parameter = window.location.href.split("?")[1];
var parameterList = parameter.split("&");
var username = decodeURIComponent(parameterList[0]);
var type = parameterList[1];
if(type == 0){
	$("#LoginName").html(username+"[管理员]");
}
if(type == 1){
	$("#LoginName").html(username+"[用户]");
}
//进入该页面自动加载个人资料页面
window.onload=function(){
    $("#1").trigger("click");
}
//下拉框
var isShow = 0;		//0为隐藏，1为显示
$("#head").click(function (){
	if (0 == isShow) {
		$("#set").show();
		isShow = 1;		
	}else if (1 == isShow) {
		$("#set").hide();
		isShow = 0
	}
});
var Url = ["",
    "znccglpt_userinfo?"+username+"",
    "znccglpt_usermanage?"+username+""
];
$(".list").bind("click",function(){
	$(this).css("border-left","3px solid #7FFF00");
	$(this).css("background-color","#526C85");
	$(this).siblings().css("border-left","3px solid transparent");
	$(this).siblings().css("background-color","rgba(51, 68, 83, 1)");
	$('#form').attr('action',Url[$(this).attr("id")]);
	$('#form').submit();
});
//返回
$("#back").click(function (){
    window.location.href = "znccglpt?"+username+"&"+type+"";
});
//退出
$("#logout").click(function (){
    window.location.href = "进入系统";
});