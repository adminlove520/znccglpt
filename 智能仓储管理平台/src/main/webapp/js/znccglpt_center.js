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
	$("#2").hide();
}
//进入该页面自动加载个人资料页面
window.onload=function(){
    $("#1").trigger("click");
}
//下拉框
$("#head").click(function (e){
    e.stopPropagation(); //阻止冒泡 
    $("#set").toggle();
    if($("#set").is(":visible")){ //判断子菜单是否可见   
        $(document).one("click",function(){ //如果可见就为documnet对象绑定个一次性的单击事件       
            $("#set").hide();
        });
    }
});
var iframe = document.getElementById('iframe');
iframe.onload = function() {
    iframe.contentDocument.onclick = function () {
        $("#set").hide();
    }
};
var Url = ["",
    "znccglpt_userinfo?"+username+"",
    "znccglpt_usermanage?"+username+"&&1"
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