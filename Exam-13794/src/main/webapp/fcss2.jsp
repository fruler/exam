<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>css项目</title>
<!-- <link href="style/style.css" rel="stylesheet" type="text/css" /> -->
<style type="text/css">
*{
	padding:0px;
	margin:0px;
}
#div1{
	background-color:grey;
	height:49px;
 
}
#img1{
  width:33px;
  height:33px;
  margin:10px 50px;
}
#img2{
  width:15px;
  height:15px;
 
}
 #div2{
 position:absolute;
 top: 0px;
 left:100px;
 }
 ul li{
 list-style: none;
 } 
 #ul{
 display:none; 
 /* background-color:silver; */
 }
 #ul li{

  margin:20px auto;
  text-align:center;
 }
 #div3{
 text-align:center;
 font-size:20px;
 width:110px;
  height:50px;
   font-weight: bold;
  line-height: 50px;
 
 }
 #div4,#ul2 li{
    display:inline-block;
 }
 #div4{
 height:48px;
 width:300px;
 text-align:center;
 position:absolute;
 top:0px;
 left:250px;
 
 }
 #ul2 li{
 margin:auto 10px;

 }
 .div{
 display:inline-block;
height:47px;
line-height: 47px;
 }
 #img3{
 width:116px;
 height:113px;
 }
 
 #img6{
 width:27px;
  height:26px;
 }
 #img7{
 width:21px;
  height:24px;
 }
 #div5{
 width:220px;
 height:330px;
 
 position:absolute;
 left:269px;
 display:none;
 background-color:silver;
 }
 #ul3 li{
  
 width:180px;
 text-align:center;
 margin:20px auto;
 }
 #ul3 #li9,#ul3 #li10{
 border:1px solid pink;
 background-color:grey;
 }
 #li9,#li10{
 height:42px;
 line-height:42px;
 }
 #div6{
 width:400px;
 height:200px;
 /* border:1px solid red; */
 background-color: orange;
 position: absolute;
 left:361px;
 display:none;
 }
 #img8{
 width:55px;
 height:85px;
 float:left;
 display:inline-block;
 margin:20px;
 }
  a{
 text-decoration: none;
 color:black;
 }
 #div8{
 display:inline-block;
 width:410px;
 height:130px;
 /* border:1px solid red; */
 }
 #div7{
  margin-top:30px;
 }
 #a1{
 color:red;
 display:none;
 }
 #div9{
 height:30px;
 /* border:1px solid red; */
 }
 #div10{
 text-align:center;
 height:40px;
 line-height: 40px;
  color:silver;
 }
 .a:hover{
 color:red;
 }
 li #a1{
 margin:auto 20px;
 }
 #div11{
 width:430px;
 height:280px;
 /* border:1px solid red; */
 background-color:pink;
 position:absolute;
 left:453px;
 display:none;
 }
 .testone{
 display:inline-block;
 margin:15px 16px;
 }
 .fli{
 margin:10px 16px;
 font-weight: bold;
 font-size:20px;
 }
 
 #test{
 display:inline-block;
  margin-top:15px;
  margin-bottom:15px;
  margin-left:16px;
  magrin-right:10px;
 } */
</style>
<script src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
$(function(){
	/* $("#div3").bind("mouseover",function(){
		
		
	}) */
$("#div2").hover(function(){
	
	$("#ul").css("display","block");
	$("#div2").css({"background-color":"silver","border-top":"1px solid red"});
},
function(){	
	$("#ul").css("display","none");
	$("#div2").css({"background-color":"","border-top":""}); 
}
)
$("#ul3 li a").hover(function(){
	
	$(this).css("color","red");
},
function(){
	
	$(this).css("color","");	
	})
	$("#ul2 #li4 div").hover(
	function(){
		
		$("#div5").css("display","block");
		$("#ul2 #li4 div").css({"background-color":"silver","border-top":"1px solid red"});
	},
	function(){
		$("#div5").css("display","none");
		$("#ul2 #li4 div").css({"background-color":"","border-top":""});
	}
	)
	$("#div5").hover(function(){
		$("#div5").css("display","block");
		$("#ul2 #li4 div").css({"background-color":"silver","border-top":"1px solid red"});
	},
	function(){
		$("#div5").css("display","none");	
		$("#ul2 #li4 div").css({"background-color":"","border-top":""});
	}
	)
	$("#ul2 #li5 div").hover(
	function(){
		
		$("#div6").css("display","block");
		$("#ul2 #li5 div").css({"background-color":"orange","border-top":"1px solid red"});
	},
	function(){
		$("#div6").css("display","none");
		$("#ul2 #li5 div").css({"background-color":"","border-top":""});
	}
	)
	$("#div6").hover(function(){
		$("#div6").css("display","block");
		$("#ul2 #li5 div").css({"background-color":"orange","border-top":"1px solid red"});
	},
	function(){
		$("#div6").css("display","none");	
		$("#ul2 #li5 div").css({"background-color":"","border-top":""});
	}
	)
	$("#div8").hover(function(){
		$("#div9").css("background-color","black");
		$("#a1").css("display","inline");
	},
	function(){
		
		$("#div9").css("background-color","");
		$("#a1").css("display","none");
	}
	)
	$("#li6 div").hover(function(){
		$("#div11").css("display","block");
		$("#li6 div").css({"background-color":"pink","border-top":"1px solid red"});
	},
	function(){
		
		$("#li6 div").css({"background-color":"","border-top":""});
		$("#div11").css("display","none");
	}
	)
	$("#div11").hover(function(){
		$("#div11").css("display","block");
		$("#li6 div").css({"background-color":"pink","border-top":"1px solid red"});
	},
	function(){
		$("#li6 div").css({"background-color":"","border-top":""});
		$("#div11").css("display","none");
	}
	)
})
</script>
</head>

<body>
<div id="div1">
 <img  id="img1" src="img/12.png"/>
</div>
<div id="div2"><div id="div3">起点中文网</div>
  <ul id="ul">
      <li id="li1"><a href="#">起点女生网</a></li>
      <li id="li2"><a href="#">创世中文网</a></li>
      <li id="li3"><a href="#">云气书店</a></li>
   </ul>   
 </div> 
 <div id="div4">
    <ul id="ul2">
       <li id="li4"><div class="div">手机阅读</div></li>
       <li id="li5"><div class="div">最近阅读</div></li>
        <li id="li6"><div class="div"><img id="img2" src="img/13.png" />快速导航</div></li>
    </ul>
 </div>
 <div id="div5">
    <ul id="ul3">
         <li id="li7">扫描下载起点读书客户端</li>
         <li id="li8"><img id="img3" src="img/14.png" /></li>
         <li id="li9"><img id="img6" src="img/15.png"><a href="#">app下载</a></li>
         <li id="li10"><img id="img7" src="img/16.png"><a href="#">app下载</a></li>
    </ul>
 </div> 
 <div id="div6">
 
        <div id="div8">
        <img src="img/17.png" id="img8">
        <div id="div7">
           <ul id="ul4">
              <li id="li11"><a href="#" style="font-weight:bold;font-size:20px;">寒天帝</a></li>
              <li id="li12" style="color:silver">最新章节:<a href="#" class="a">第十二章 天人划别</a></li>
              <li id="li13" style="color:silver;float:left">看到:<a href="#" class="a">第一章 沉沦地狱九万年</a></li>
              <li><a id="a1" href="#">继续阅读</a></li>
           </ul>
        </div>
       
        </div>
       
        <div id="div9">
        
        </div>
        <div id="div10" >
        <a href="#"  class="a">查看全部</a><img src="img/18.png" width="10px" height="11px">
        </div>
        </div>
 <div  id="div11">
           <ul id="ul5"> 
           <li class="fli">分类频道</li>
           <li>
               <ul id="ul6">
                <li class="testone"><a href="#">玄幻</a></li>
                 <li class="testone"><a href="#">奇幻</a></li>
                  <li class="testone"><a href="#">武侠</a></li>
                   <li class="testone"><a href="#">仙侠</a></li>
                    <li class="testone"><a href="#">都市</a></li>
                     <li class="testone"><a href="#">职场</a></li>
                      <li class="testone"><a href="#">历史</a></li>
                       <li class="testone"><a href="#">军事</a></li>
                       <li class="testone"><a href="#">游戏</a></li>
                 <li class="testone"><a href="#">体育</a></li>
                  <li class="testone"><a href="#">科幻</a></li>
                   <li class="testone"><a href="#">灵异</a></li>
                    <li id="test"><a href="#">二次元</a></li>
                     <li class="testone"><a href="#">完本</a></li>
                      <li class="testone"><a href="#">女生</a></li>
                       <li class="testone"><a href="#">三江</a></li>
                       
                </ul>
           </li>
           <li class="fli">其它</li>
           <li>
               <ul id="ul7">
                  <li class="testone"><a href="#">投稿</a></li>
                  <li class="testone"><a href="#">签约</a></li>
                  <li class="testone"><a href="#">福利</a> </li>
               </ul>
           </li>
           </ul>
 </div>
</body>

</html>