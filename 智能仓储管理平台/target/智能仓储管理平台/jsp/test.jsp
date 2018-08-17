
<span style="font-size:18px;"><style type="text/css">
#content{
	width: 600px;
	height: 501px;
	position: relative;
	margin: 40px auto;
}
#content a{
	width: 50px;
	height: 50px;
	background: rgba(240,240,240,0.5);
	border: 3px #fff solid;
	font-size: 40px;
	font-weight: bold;
        color: #fff;
        text-align: center;
        position: absolute;
        top:225px;
        text-decoration: none;
}
#content a:hover{
	color:#fff;
}
#prev{
	position: absolute;
	left: 10px;
}
#next{
	position: absolute;
	right:10px;
}
#img1{
	width: 600px;
	height: 501px; 
}
</style>
<script type="text/javascript">
    window.onload=function(){
      	var oPrev=document.getElementById("prev");
      	var oNext=document.getElementById("next");
      	var oImg1=document.getElementById("img1");
      	var arrUrl=["/picture/brand1.jpg","/picture/brand2.jpg","/picture/brand3.jpg","/picture/brand4.jpg"];
        var num = 0;
        oImg1.src=arrUrl[num];
        oNext.onclick=function (){
        	  num++;
            if(num == arrUrl.length){
            	num=0;
            }
            oImg1.src=arrUrl[num];
        }
        oPrev.onclick=function (){
        	num--;
            if(num == -1){
            	num=arrUrl.length-1;
            }
            oImg1.src=arrUrl[num];
        }
    }
</script>
</head>
<body>
<div id="content">
	<a id="prev" href="javascript:;"><</a>
	<a id="next" href="javascript:;">></a>
	<img id="img1" src="/picture/brand1.jpg">
</div>
</body>
</html></span>