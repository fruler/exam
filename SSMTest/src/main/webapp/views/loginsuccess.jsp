<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登录成功</title>
<script src="<%=request.getContextPath()%>/css/jquery-3.2.0.min.js"></script>
<script type="text/javascript">
  function fload(k){
	  var str=$("#hidden").val();
		/* alert(str); */
	  $.ajax({
		  url:str+"/selectaddress",
		  type:"post",
		  dataType:"json",
		  success:function(data){
			/* alert(data); */  
			var length=data.length; 
			/* alert(length); */
			var $select=$("#selectmodel");
		   for(var i=0;i<length;i++)
			   {
			  
			   $select.append("<option value="+data[i].address+">"+data[i].address+"</option>");
			   }
		  },
		  error:function(){
			  alert("你好!");
		  }
	   })  
	 /* 每次重新访问的时候将hidden1和hidden2的值设置成1 */
	 $("#ftable tr td:even").css({"width":"150px","text-align":"right"});
	 $("#ftable tr td:odd").css({"width":"250px","text-align":"left"});
	/*  alert(k); */
	 $("#div2").html("");
	 $("#hidden1").val("1");
	 $("#hidden2").val("1");
	 $("#ul1").css("display","none");
	 $("#ul2").css("display","none");
	 $("#checkbox").bind("click",function(){
		/*  alert("dff"); */
		/*  alert($("#checkbox").get(0).checked) */
		/*  alert($("#checkbox").length); */
		/*   alert($("#checkbox").attr("checked"));  *//*有些问题   */
		 var checkboxall=$(".checkbox");
		 if($("#checkbox").get(0).checked==true)
		 {
			 /* alert("ffff"); */
		   
		     $(".checkbox").attr("checked",true);
		 }

		 else{
			 $(".checkbox").attr("checked",false);
			 
		 }
		 
	 })
	 $("#span2").bind("click",function(){
		 //首先得到隐藏标签的值
		 
		 var hidden1=$("#hidden1").val();
		 var hidden1int=parseInt(hidden1);
		 if(hidden1int%2==0)
		 {
			 /* 如果它的值是偶数的话则将display设置成 none*/
			 $("#ul1").css("display","none");
		 }
		 else{
			 $("#ul1").css("display","block");
			 
		 }
		 var hidden1string=(hidden1int+1).toString();
		 $("#hidden1").val(hidden1string);
	 })
	  $("#span3").bind("click",function(){
		 //首先得到隐藏标签的值
		
		 var hidden2=$("#hidden2").val();
		 var hidden2int=parseInt(hidden2);
		 if(hidden2int%2==0)
		 {
			 /* 如果它的值是偶数的话则将display设置成 none*/
			 $("#ul2").css("display","none");
		 }
		 else{
			 $("#ul2").css("display","block");
			 
		 }
		 var hidden2string=(hidden2int+1).toString();
		 $("#hidden2").val(hidden2string);
	 })
	 /* 查询所有的信息 */
	 var str=$("#hidden").val();
		/* alert(str); */
	 $.ajax({
		  url:str+"/fselect",
		 dataType:"json",
		 type:"post",
		 data:{"thispage2":k},
		 success:function(data){
		 var jsonarrray=data;
		/*  alert(data); */
        /*  alert("nihao"); */
      /*    alert(data.countPage); */
		  $("#table1 tr:gt(0)").html("");
			var jsonarrray=data.li;
			/* alert(jsonarrray.length); */
			for(i in jsonarrray)
	     { 
	    
	       $("#table1").append(
	       " <tr >"+
	       "<td class='fxc' style='text-align:center;'><input type='checkbox' name='checkbox' class='checkbox'/><input class='hidden'  type='hidden' value='"+jsonarrray[i].customer_id+"'/></td>"
	       +"<td class='fxc1'>"+jsonarrray[i].first_name+"</td>"+
	    "<td class='fxc2'> "+jsonarrray[i].last_name+"</td>"+
	
	    "<td class='fxc3'>"+jsonarrray[i].address+"</td>"+
	    "<td class='fxc4'>"+jsonarrray[i].email+"</td>"+
	    "<td class='fxc5'>"+jsonarrray[i].active+"</td>"+
	    "<td class='fxc6'>"+jsonarrray[i].last_update+"</td>"+
	    "<td class='fxc7'><input type='button' class='button1' value='编辑' onclick='fbianji(this)' /><input  type='hidden' value='"+jsonarrray[i].customer_id+"' /><input type='button' class='button1' value='删除' onclick='fdelete(this)' /></td>"+
	    
	       "</tr>"
	   
	       );
	     }
	   
		 
		 $("#div2").append("共<span id=span4>"+data.countRow+"条记录&nbsp;共"+data.countPage+"页"
					+"&nbsp;第<span>"+data.thispage+"页&nbsp;</span><a id=a1 href='javascript:firstpage();'>首页</a>&nbsp;"+
					"<a id=a2 href='javascript:prepage();'>上一页</a>&nbsp;")
					if(data.countRow<=5)
						{
						for(var i=1;i<=data.countRow;i++)
						$("#div2").append("<a class='fan5' onclick='return fan1(this);'>"+i+"</a>&nbsp;");
					    var fan=$(".fan1");
						for(var i=0;i<fan.length;i++)
						{
						 if(data.thispage==$(".fan5:eq("+i+")").html())
							 {
							 $(".fan1:eq("+i+")").css("color","red");
							 break;
							 }
						}
						}
					else{
						if(data.thispage<=3)
							{
							for(var i=1;i<=5;i++)
								$("#div2").append("<a class='fan2' onclick='return fan1(this);'>"+i+"</a>&nbsp;");
						/* 	alert("fsf"); */
							var fan=$(".fan2");
							alert($(".fan2:eq(0)").html());
							for(var i=0;i<fan.length;i++)
							{
							 if(data.thispage==$(".fan2:eq("+i+")").html())
								 {
								/*  alert("enter"); */
								 $(".fan2:eq("+i+")").css("color","red");
								 break;
								 }
							}
							}
						else if(data.thispage>=(data.countPage-2))
							{
							for(var i=(data.countPage-4);i<=data.countPage;i++)
								$("#div2").append("<a class='fan3' onclick='return fan1(this);'>"+i+"</a>&nbsp;");
							var fan=$(".fan3");
							for(var i=0;i<fan.length;i++)
							{
							 if(data.thispage==$(".fan3:eq("+i+")").html())
								 {
								 $(".fan3:eq("+i+")").css("color","red");
								 break;
								 }
							}
							}
						else{
							for(var i=(data.thispage-2);i<=data.thispage+2;i++)
								$("#div2").append("<a class='fan4' onclick='return fan1(this);'>"+i+"</a>&nbsp;");
							var fan=$(".fan4");
							for(var i=0;i<fan.length;i++)
							{
							 if(data.thispage==$(".fan4:eq("+i+")").html())
								 {
								 $(".fan4:eq("+i+")").css("color","red");
								 break;
								 }
							}	
						}
						}
					
					$("#div2").append("<a id=a3 href='javascript:nextpage();'>下一页</a>"+
					"&nbsp;&nbsp;&nbsp;<a id=a4 href='javascript:lastpage();'>尾页</a>"+
					"<input id='hidden9' type='hidden' value='"+data.firstPage+"'/>"+
					"<input id='hidden10' type='hidden' value='"+data.lastPage+"'/>"+
					"<input id='hidden3' type='hidden' value='"+data.prePage+"'/>"+
					"<input id='hidden4' type='hidden' value='"+data.nextPage+"'/>"+
					"<input id='hidden5' type='hidden' value='"+data.rowerPage+"'/>"+
					"<input id='hidden6' type='hidden' value='"+data.countRow+"'/>"+
					"<input id='hidden7' type='hidden' value='"+data.thispage+"'/>"+
					"<input id='hidden8' type='hidden' value='"+data.countPage+"'/>"
			
					)
					
				},
				error:function(){
					alert("error!");
				}
			})
	 
  }
 function exit(){
	var flag=confirm("是否退出!");
	var str=$("#hidden").val();
	if(flag==true)
		{
		$.ajax({
	         url:str+"/exit",
	        dataType:"text",
	        type:"post",
	        success:function(data){
	        	window.location.href=str+"/views/login.jsp";
	        }
		})
		}
 }

 function add(){
	 var str=$("#hidden").val();
	 $("#span4").html("基本信息");
	 $("#div2").html("");
	 $("#divbottom1").html("");
	 $("#divbottom1").append("<form action='"+str+"/add' method='post' onsubmit='return f();'>"+
	"<table id='table2'><tr><td class='ruler'>firstname</td><td class='ruler1'><input type='text' name='firstname' class='finput'/></td></tr>"+
	"<tr><td class='ruler'>lastname</td><td class='ruler1'><input type='text' name='lastname' class='finput'/></td></tr>"
	+"<tr><td class='ruler'>email</td><td class='ruler1'><input type='text' name='email' class='finput'/></td></tr>"+
	"<tr><td class='ruler'>address</td><td class='ruler1'><select id='select1'></select></td></tr>"+
	"<tr><td class='ruler'><input type='submit'  value='添加' /></td><td class='ruler1'><input type='button' value='取消' onclick='cancel();'/></td></tr></table></form>"
	 )
	 $.ajax({
	         url:str+"/selectaddress",
	        dataType:"json",
	        type:"post",
	        success:function(data){
	        	for(var i=0;i<data.length;i++)
	        		{
	        	$("#select1").append("<option>"+data[i].address+"</option>");		
	        }}
		})
 }
 function cancel(){
	 var str=$("#hidden").val();
	 var k=confirm("是否取消!");
	 if(k==true)
		 {
		  window.location.href=str+"/views/loginsuccess.jsp";
		 }
 }
 function f()
 {  var k=true;
	var finput=$(".finput").get();
	if(finput[0].value==""||finput[1].value==""||finput[2].value=="")
	{
		alert("不能有任何一项为空!");
		k=false;
	}
	 return k;
 }
 function fan1(a)
 {
	 /* alert(a.innerHTML); */
	 fload(a.innerHTML);
	 return false;
 }
 /* 第一页 */
 function firstpage(){	
	 fload(1);
}
 /* 上一页  */
 function prepage(){
	/* alert("ff2");	 */
	var page=$("#hidden3").val(); 
	alert(page);
	fload(page);
 }
/* 下一页 */
function nextpage(){
 alert("ff3");
 var page=$("#hidden4").val(); 
	/* alert(page); */
	fload(page);	 
}

/* 最后一页 */
function  lastpage(){
 alert("ff4");
 var page=$("#hidden10").val(); 
   
 fload(page);
}
/* 批量删除使用ajax把它们一个个的删除 */
function deletemore(){
 alert("f");
	 var checkbox1=document.getElementsByName("checkbox");
	 alert(checkbox1.length);
	 var hidden1=$(".hidden");
	 var flag=true;
	 var domhidden1=hidden1.get();
	    for(var i=0;i<checkbox1.length;i++)
	    {
	      if(checkbox1[i].checked==true)
	      {
	       //通过ajax把它们一个个的删除
	       fandelete(domhidden1[i].value);
	       flag=false;
	      }
	     
	    }
	    if(flag==true)
	    	{
	    	alert("请勾选!");
	    	}
	 }
function overlay(){
    var e1 = document.getElementById('modal-overlay');			
    e1.style.visibility =  (e1.style.visibility == "visible"  ) ? "hidden" : "visible";
    return false;
}
function finalbianji(){
	
 	var finput=$(".finput").get();
 	if(finput[0].value==""||finput[1].value==""||finput[2].value=="")
 	{
 		alert("不能有任何一项为空!");
 		k=false;
 	}
 	if(finput[0].value!=""&&finput[1].value!=""&&finput[2].value!="")
 		{
 		/* alert("f"); */
 		var str=$("#hidden").val();
 		/* alert(str); */
 		var firstname=finput[0].value;
 		/* alert(firstname); */
 		var lastname=finput[1].value;
 		/* alert(lastname); */
 		var email=finput[2].value;
 		/* alert(email); */
 		var id=$("#hiddenid").val();
 		/* alert(id); */
 		 $.ajax({
	         url:str+"/edit1",
	        dataType:"text",
	        type:"post",
	        data:{"firstname":firstname,"lastname":lastname,"email":email,"id":id},
	        success:function(data){
	        
	        	window.location.href=str+"/views/loginsuccess.jsp";
	        },
	        error:function(){
	        	alert("error");
	        }
 		 })
 		}
  }
function fbianji(a){
	/* 模态框 */
	
	/* alert(a.nodeName);
	alert($(a).next().get(0).nodeName); */
	var checkbox=$(a).parent().prev().prev().prev().prev().prev().prev().prev().children();
	var checkbox1=checkbox.get();
	var id=$(a).next().val();
	/* alert(id);
	alert(checkbox1[0].checked); */
	if(checkbox1[0].checked==true)
	{
		overlay();
	   $("#hiddenid").val(id);
	}
	else{
	alert("请打勾");
	}
	}
	function fdelete(b)
	{
	var checkbox=$(b).parent().prev().prev().prev().prev().prev().prev().prev().children();
	 var id=$(b).prev().val();
	/*  alert(id); */
	 var checkbox2=checkbox.get();
	if(checkbox2[0].checked==true){
	  fandelete(id);
	}
	else{alert("请打勾!");}
	}
	function  fandelete(a)
	{    
		 var str=$("#hidden").val();
	$.ajax({
	         url:str+"/deleteuserinfo",
	        data:"id="+a,
	        dataType:"json",
	        type:"post",
	        success:function(data){
	         var jsonarrray=data;
	       /*   alert(data);
	         alert("nihao");
	         alert(data.countPage); */
			  $("table tr:gt(0)").html("");
				var jsonarrray=data.li;
				alert(jsonarrray.length);
				for(i in jsonarrray)
		     { 
		    
		       $("#table1").append(
		       " <tr >"+
		       "<td class='fxc' style='text-align:center;'><input type='checkbox' name='checkbox'class='checkbox'/><input class='hidden'  type='hidden' value='"+jsonarrray[i].customer_id+"'/></td>"
		       +"<td class='fxc1'>"+jsonarrray[i].first_name+"</td>"+
		    "<td class='fxc2'> "+jsonarrray[i].last_name+"</td>"+
		
		    "<td class='fxc3'>"+jsonarrray[i].address+"</td>"+
		    "<td class='fxc4'>"+jsonarrray[i].email+"</td>"+
		    "<td class='fxc5'>"+jsonarrray[i].active+"</td>"+
		    "<td class='fxc6'>"+jsonarrray[i].last_update+"</td>"+
		    "<td class='fxc7'><input type='button' class='button1' value='编辑' onclick='fbianji(this)' /><input  type='hidden' value='"+jsonarrray[i].customer_id+"' /><input type='button' class='button1' value='删除' onclick='fdelete(this)' /></td>"+
		    
		       "</tr>"
		   
		       );
		     }
		   
				 $("#div2").html("");
			 $("#div2").append("共<span id=span4>"+data.countRow+"条记录&nbsp;共"+data.countPage+"页"
						+"&nbsp;第<span>"+data.thispage+"页&nbsp;</span><a id=a1 href='javascript:firstpage();'>首页</a>&nbsp;"+
						"<a id=a2 href='javascript:prepage();'>上一页</a>&nbsp;")
						if(data.countRow<=5)
							{
							for(var i=1;i<=data.countRow;i++)
							$("#div2").append("<a class='fan5' onclick='return fan1(this);'>"+i+"</a>&nbsp;");
						    var fan=$(".fan1");
							for(var i=0;i<fan.length;i++)
							{
							 if(data.thispage==$(".fan5:eq("+i+")").html())
								 {
								 $(".fan1:eq("+i+")").css("color","red");
								 break;
								 }
							}
							}
						else{
							if(data.thispage<=3)
								{
								for(var i=1;i<=5;i++)
									$("#div2").append("<a class='fan2' onclick='return fan1(this);'>"+i+"</a>&nbsp;");
							/* 	alert("fsf"); */
								var fan=$(".fan2");
								/* alert($(".fan2:eq(0)").html()); */
								for(var i=0;i<fan.length;i++)
								{
								 if(data.thispage==$(".fan2:eq("+i+")").html())
									 {
									/*  alert("enter"); */
									 $(".fan2:eq("+i+")").css("color","red");
									 break;
									 }
								}
								}
							else if(data.thispage>=(data.countPage-2))
								{
								for(var i=(data.countPage-4);i<=data.countPage;i++)
									$("#div2").append("<a class='fan3' onclick='return fan1(this);'>"+i+"</a>&nbsp;");
								var fan=$(".fan3");
								for(var i=0;i<fan.length;i++)
								{
								 if(data.thispage==$(".fan3:eq("+i+")").html())
									 {
									 $(".fan3:eq("+i+")").css("color","red");
									 break;
									 }
								}
								}
							else{
								for(var i=(data.thispage-2);i<=data.thispage+2;i++)
									$("#div2").append("<a class='fan4' onclick='return fan1(this);'>"+i+"</a>&nbsp;");
								var fan=$(".fan4");
								for(var i=0;i<fan.length;i++)
								{
								 if(data.thispage==$(".fan4:eq("+i+")").html())
									 {
									 $(".fan4:eq("+i+")").css("color","red");
									 break;
									 }
								}	
							}
							}
						
						$("#div2").append("<a id=a3 href='javascript:nextpage();'>下一页</a>"+
						"&nbsp;&nbsp;&nbsp;<a id=a4 href='javascript:lastpage();'>尾页</a>"+
						"<input id='hidden9' type='hidden' value='"+data.firstPage+"'/>"+
						"<input id='hidden10' type='hidden' value='"+data.lastPage+"'/>"+
						"<input id='hidden3' type='hidden' value='"+data.prePage+"'/>"+
						"<input id='hidden4' type='hidden' value='"+data.nextPage+"'/>"+
						"<input id='hidden5' type='hidden' value='"+data.rowerPage+"'/>"+
						"<input id='hidden6' type='hidden' value='"+data.countRow+"'/>"+
						"<input id='hidden7' type='hidden' value='"+data.thispage+"'/>"+
						"<input id='hidden8' type='hidden' value='"+data.countPage+"'/>"
				
						)
						
					},
					error:function(){
						alert("error!");
					}
				})
	}

</script>
<style type="text/css">
.finput{
 width:200px;
 height:20px;
}
#table2{
 border-collapse: collapse;
}
.ruler{
  border:1px solid gray;
  text-align:right;
  width:150px;
}
.ruler1{
border:1px solid gray;
  text-align:left;
  width:250px;
}
*{
 padding:0px;
 margin:0px;
}
#img1 {
	width: 30px;
	height: 30px;
	display: inline-block;
	margin: 5px 10px;
}
#span1 {
	position: absolute;
	top: 10px;
	font-weight: bold;
	font-size: 20px;
}
#span1:hover,#fspan:hover{
 color:white;
}
#header{
weight:46px;
border:1px solid gray;
background-color:rgb(63,194,236);
}
#li1,#li3{
 font-size:20px;
font-weight: bold;
 background-color:rgb(250,251,246);
/*  border:1px solid silver; */
}
#li1{
border-bottom:1px solid silver;
}
#li3{
border-bottom:1px solid silver;
border-top:1px solid silver;
}
li{

width:200px;
}
#UL{

list-style-type: none;
}
#ul1,#ul2{
list-style-type: none;
display:none;
}
#ul1 li,#ul2 li{
 /* background-color: rgb(250,250,250); */ 
 background-color:silver;
}
.fan{
border-bottom:1px solid gray;
}
#span2,#span3{
float:right;
cursor: pointer;
}
#img2,#img3{
 display:inline-block;
 width:10px;
 height:10px;
margin-left:5px;
margin-right:5px;
}
a{
 text-decoration: none;
 color:black;
 display:inline-block;
 margin-left:20px;
}
#divleft{
 border:1px solid silver;
 width:200px;
 height:599px;
}
#divtop{

  height:35px;
  border:1px solid silver;
  width:1152px;
  position:absolute;
  top:41px;
  left:201px;
  line-height: 35px;
  padding-left:10px;
  font-size: 20px;
  font-weight: bold;
  background-color: rgb(255,255,255);
}
#divbottom{
 width:1153px;
 height:400px;
 border:1px solid silver;
 position:absolute;
  top:77px;
  left:201px;
  margin:5px;
  /* margin-bottom:5px;
  margin-left:5px; */
}
#fimg,#fspan{
float:right;
display:inline-block;
}
#fimg{
width:30px;
height: 30px;
margin:5px;
}
#fspan{
font-size:20px;
font-weight: bold;
margin:5px 10px;;
}
#divtop1{
height:30px;
border:1px solid silver;
}
 input{
 width:50px;
 height:30px;
 background-color:blue;
} 
#fbutton1{
 position:absolute;
 left:500px;
}
#fbutton2{
 position:absolute;
 left:1040px;
 width:100px;
}
.button:hover,.button1:hover{
color:white;
}
#span4{
font-size:15px;
display:inline-block;
margin:5px;
}
#divbottom1{
width:1140px;
 height:352px;
 border:1px solid gray;
 margin:5px;
}
#table1{
border-collapse: collapse;
}
#table1 th,#table1 td{
margin:0px;
 border:1px solid silver;
 text-align:left;
 height:30px;
 background-color: gray;
}
.fxc{
 width:72px;
}
.fxc1{
width:90px;
}
.fxc2{
 width:90px;
}
.fxc3{
width:280px;
}
.fxc4{
 width:285px;
}
.fxc5{
width:70px;
}
.fxc6{
 width:180px;
}
.fxc7{
width:110px;
}
#end{
width:1160px;
height:130px;
border-left:1px solid gray;
position:absolute;
bottom:0px;
left:201px;
background-color: rgb(238,238,238);
}
#checkbox,.checkbox{
display:inline-block;
width:15px;
height:15px;
}
a{
text-decoration: none;
}
a:hover{
 color:red;
}
#div2 a{
cursor: pointer;
}
#div2{
border:1px solid gray;
position:absolute;
left:201px;
top:483px;
width:1158px;
text-align:right;
}

/* 模态框 */
#modal-overlay {
    visibility: hidden;    
    position: absolute;   /* 使用绝对定位或固定定位  */
    left: 0px;    
    top: 0px;
    width:1347px;
    height:635px;
    text-align:center;
    z-index: 1000; 
    background-color: rgb(255,255,255); 
    opacity: 0.5;    /* 背景半透明 */
}
/* 模态框样式 */
#ftable{
 border-collapse: collapse;
 width:400px;
  margin: 100px auto;
  background-image: url("/SSMTest/imgs/timg6.jpg");
	background-repeat: no-repeat;
	background-position: center;
	background-attachment: scroll;
}
.modal-data{
	 width:300px;
    margin: 100px auto;
    background-color: #fff;
    border:1px solid #000;
    padding:15px;
    text-align:left;
}
</style>
</head>
<body onload="fload(1);">
<div id="header">
			<img id="img1" src="<%=request.getContextPath()%>/imgs/FF.png" /><span id="span1">13794-范旭超</span><span id="fspan">${username}</span><img id="fimg" src="<%=request.getContextPath()%>/imgs/12.jpg" onclick="exit();"/>
</div>
		<div id="divleft">
		
		<ul id=UL>
		<li id="li1"><img id="img2" src="<%=request.getContextPath()%>/imgs/11.png"/>Customer管理<span id="span2">></span><input id="hidden1" type="hidden" value="1"/></li>
		  <li id="li2">
		    <ul id="ul1">
		      <li class="fan"><a href="">Customer你好</a></li>
		      <li class="fan"><a href="">Customer你好</a></li>
		      <li ><a href="">Customer你好</a></li>
		      </ul>
		  </li>
		  <li id="li3"><img id="img3" src="<%=request.getContextPath()%>/imgs/11.png"/>Film设置<span id="span3">></span><input id="hidden2" type="hidden" value="1"/></li>
		  <li id="li4">
		      <ul id="ul2">
		       <li class="fan"><a href="">Film设置</a></li>
		       <li class="fan"><a href="">Film设置</a></li>
		       <li class="fan"><a href="">Film设置</a></li>
		   </ul>
		  </li>
		</ul>
		</div>
		
		  <div id="divtop">客户管理</div>
		  <div id="divbottom">
		     <div id="divtop1"><span id="span4">客户列表</span><input id="fbutton1" class="button" type="button" value="新建" onclick="add();"/><input id="fbutton2" class="button" type="button" value="批量删除" onclick="deletemore();"/></div>
		      <div id="divbottom1">
		      <table  id="table1">
		       <tr>
		       <th class="fxc"><label id="label" for="checkbox">全选:</label><input type="checkbox" id="checkbox"/></th>
		        
		          <th class="fxc1">FirstName</th>
		            <th class="fxc2">LastName</th>
		              <th class="fxc3">Address</th>
		                <th class="fxc4">Email</th>
		                  <th class="fxc5">active</th>
		                    <th class="fxc6">LastUpdate</th>
		                    <th class="fxc7">操作</th>
		       </tr>
		       </table>
		      
		      </div>
		      
		  </div>
		 <div id="div2" align="center"></div>
		<div id="end"></div>
	 <input  id="hidden" type="hidden"  value="<%=request.getContextPath() %>"/> 
	
	
	 <div id="modal-overlay"> 
	
	    <table id="ftable">

       <caption style="font-weight: bold;font-size:20pt; text-align:left">编辑信息</caption>
       <tr>
          <td>firstname:</td>
          <td><input type="text" id="title" name="firstname" value="" class="finput" /></td>
        </tr>
        <tr>
           <td>lastname:</td>
           <td><input type="text"  id="description" name="lastname" value="" class="finput" /></td>
        </tr>  
         <tr>
           <td>email:</td>
           <td><input type="text"  id="description" name="email" value="" class="finput" /></td>
        </tr> 
        <tr>
          <td>address</td>
           <td><select id="selectmodel"></select></td>
           </tr>
           <tr>
          <td><input type="button" value='编辑' onclick="finalbianji();"/><input type="hidden" id="hiddenid" name="id"/></td>
           <td><input type="button" value="取消" onclick="overlay();"></td>
           </tr>
       </table>
	
</div> 

</body>
</html>