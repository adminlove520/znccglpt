// 品牌轮播
var brandarr=["/picture/brand1.jpg","/picture/brand2.png","/picture/brand3.jpg","/picture/brand4.png","/picture/brand5.jpg","/picture/brand6.jpg"];
var brand=document.getElementById('brand').getElementsByTagName('div');
var start=0;
var end=4;
function brand_shuffling() {
    changebrand(0,4);
}
function left(){
    start--;
    end--;
    changebrand(start,end);
}
function right(){
    start++;
    end++;
    changebrand(start,end);
}
function changebrand(start,end){
    this.start=start;
    this.end=end;
    for(var i=0,j=start;i<=(end-start),j<=end;i++,j++){
        brand[i].style.backgroundImage="url("+brandarr[j]+")";
    }
    if(start==4){
        changebrand(-2,2);
    }
    if(end==1){
        changebrand(3,7);
    }
}
function show(){
    document.getElementById('left').style.display="block";
    document.getElementById('right').style.display="block";
}
function display(){
    document.getElementById('left').style.display="none";
    document.getElementById('right').style.display="none";
}




