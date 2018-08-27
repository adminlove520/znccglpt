// znccglpt
var parameter = window.location.href.split("?")[1];
var parameterList = parameter.split("&");
var username = decodeURIComponent(parameterList[0]);
var type = parameterList[1];
var realname;
//根据用户名获取其真实姓名
$.ajax({
    type: "post",
    url: "/ssm/doSelect",
    data: {
        username: username,
    },
    success: function(data) {
        // console.log("success");
        // console.log(data);
        realname = data.user.realname;
        if(type == 0){
            $("#LoginName").html(username+"("+realname+")[管理员]");
        }
        if(type == 1){
            $("#LoginName").html(username+"("+realname+")[用户]");
        }
    }
});
var Url = ["",
	"inManagement?&"+realname,
	"select?&"+realname,
	"check?&"+realname,
	"outManagement?&"+realname,
	"movesRecord?&"+realname,
	"warehouseManagement?&"+realname
];
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
$(".list").bind("click",function(){
	$(this).css("border-left","3px solid #7FFF00");
	$(this).css("background-color","#526C85");
	$(this).siblings().css("border-left","3px solid transparent");
	$(this).siblings().css("background-color","rgba(51, 68, 83, 1)");
	$('#form1').attr('action',Url[$(this).attr("id")]);
	$('#form1').submit();
});
// 个人中心
$("#center").click(function (){
    window.location.href = "znccglpt_center?"+username+"&"+type+"";
});

//退出
$("#logout").click(function (){
    window.location.href = "进入系统";
});