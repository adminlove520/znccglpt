var scorll_img = new Array();
scorll_img[0]="/images/carousel1.png";
scorll_img[1]="/images/carousel2.png";
scorll_img[2]="/images/carousel3.png";
scorll_img[3]="/images/carousel4.png";

var scroll_number_img = new Array();
scroll_number_img[0]="/images/brand1.png";
scroll_number_img[1]="/images/brand2.png";
scroll_number_img[2]="/images/brand3.png";
scroll_number_img[3]="/images/brand4.png";



var NowFrame = 1;
var MaxFrame = 4;
function loopShow1(d1){
    if(Number(d1)){
        NowFrame = d1;
    }
    for(var i=1;i<=MaxFrame;i++){
        if(i==NowFrame){
            if(i != MaxFrame){
                document.getElementById("dd_scroll").src = scorll_img[i];
            }
            else{
                document.getElementById("dd_scroll").src = scorll_img[0];
            }
        }
    }
    if (NowFrame ==MaxFrame){
        NowFrame =1;
        document.getElementById("scroll_number_img[NowFrame-1]").src = '/images/enter1.png';
        document.getElementById("scroll_number_img[MaxFrame-1]").src = '/images/enter2.png';
    }
    else{
        NowFrame ++;
        document.getElementById("scroll_number_img[NowFrame-1]").src = '/images/enter1.png';
        document.getElementById("scroll_number_img[NowFrame-1]").src = '/images/enter2.png';
    }
}
var theTimer = setInterval('loopShow1()',3000);
function loopShow(d1){
    var scroll = document.getElementById('scroll_number');
    scroll.onmouseover = function () {
        clearInterval(theTimer);
    }
    scroll.onmouseout = function () {
        theTimer = setInterval(loopShow1,3000);
    }
    for(var i=1;i<=MaxFrame;i++){
        if(i==d1){
            if(i==MaxFrame){
                document.getElementById("dd_scroll").src = scorll_img[MaxFrame-1];
            }
            else {
                document.getElementById("dd_scroll").src = scorll_img[i-1];
            }
            document.getElementById("scroll_number_img[NowFrame-1]").src = '/images/enter1.png';
        }
        else {
            document.getElementById("scroll_number_img[NowFrame-1]").src = '/images/enter2.png';
        }
        NowFrame =d1;
    }
}
function loopHide(d1) {
    for(var i=1;i<=MaxFrame;i++){
        document.getElementById("scroll_number_img[NowFrame-1]").src = '/images/enter2.png';
    }
    document.getElementById("scroll_number_img[NowFrame-1]").src = '/images/enter1.png';
}