// 图片轮播
var imgarr=["/picture/carousel1.png","/picture/carousel2.png","/picture/carousel3.png","/picture/carousel4.jpeg"];
var baseWidth=document.documentElement.clientWidth||document.body.clientWidth;
var timer=null;
var btns=document.getElementsByClassName('btr');
var imgul=document.getElementById('carousel');
var images=document.getElementById('carousel').getElementsByTagName('li');
//自动轮播图片
function pic_shuffling(){
    for (var i=0;i<imgarr.length;i++){
        images[i].getElementsByTagName('img')[0].src=imgarr[i];
        images[i].getElementsByTagName('img')[0].style.width=baseWidth*0.95+'px';
        images[i].getElementsByTagName('img')[0].style.height=400+'px';
    }
    change(1,0);
}
//点击切换图片
for (var i =0;i<btns.length; i++){
    btns[i].setAttribute('i',i);
    btns[i].onmousedown=function(){
        clear(); //清除自动轮播选中标签
        clearInterval(timer); //清除定时器
        var index=parseInt(this.getAttribute('i'))+1;
        var temp=index-1;
        imgul.style.left=-baseWidth*0.95*parseInt(this.getAttribute('i'))+'px'; // 将当前播放图片置为点击的图片
        change(index,temp);
    }
}
function change(index,temp){
    btns[temp].style.background="white";
    timer=setInterval(function changeimg(){
        if(index==4){ //即手动点击第四个图片时
            index=1;
            temp=0;
            clear(); //清除自动轮播选中标签
            imgul.style.left=-baseWidth*0.95*(index-1)+'px'; //切换为第一张图片
            change(index,temp); //进入自动轮播
        }
        else{
            imgul.style.left=-baseWidth*0.95*index+'px';
            btns[index].style.background="white";
            btns[temp].style.background="none";
            index++;
            temp++;
        }
        if(index==4){ //显示到第四个标签时，重置index
            index=0;
        }
        if(temp==4){ //显示到第一个标签时，重置temp
            temp=0;
        }
    },3000);
}
function clear(){
    for (var i=0;i<btns.length;i++){
        btns[i].style.background='none';
    }
}