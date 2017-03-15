<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>add</title>
<script src="js/jquery-1.7.2.min.js"></script>
<script>
  $(document).ready(function(){
	   $.ajax({
		  url:"add",
		  type:"post",
		  dataType:"json",
		  success:function(data){
			alert(data);  
			var length=data.length; 
			alert(length);
			var $select=$("#select");
		   for(var i=0;i<length;i++)
			   {
			  
			   $select.append("<option value="+data[i].name+">"+data[i].name+"</option>");
			   }
		  },
		  error:function(){
			  alert("你好!");
		  }
	   })  
  })
function f(){

	  if($("#description").val()==""&&$("#title").val()!="")
		  {
		  alert("description不能为空");
		  }
      
	
	  if($("#description").val()!=""&&$("#title").val()=="")

	  {
	  alert("title不能为空");
	  }
	  if($("#description").val()==""&&$("#title").val()=="")
		  {
		  alert("title和description不能为空!");
		  }
	  if($("#description").val()!=""&&$("#title").val()!="")
		  {

		  alert("sf");
		  var selectdom=$("#select").get()[0];
		  var index=selectdom.selectedIndex;
		  var option=selectdom.options[index];

		  $.ajax({
			  url:"fupdate2",
			  type:"post",
			  data:{"id":$("#hidden").val(),"title":$("#title").val(),"description":$("#description").val(),"name":option.value},
			  dataType:"text",
			  success:function(data){
			  alert("ff");
			  window.location.href="editsuccess.jsp"
			  } ,
			  error:function(){
				  alert("Ff");
			  }
		  })
		  }  
		
  }
</script>
<style type="text/css">
.button {
	width: 100px;
	 height:40px; 
}

.button:hover {
	color: red;
}
body{
margin:0px auto;
padding:0px;
border:0px;
}
div{
margin:0px auto;
padding:0px;
border:0px;
}
table.collapse {
	border: 1px solid black;
	border-collapse: collapse;
}

td {

   font-size:30px;
	text-align: center;
	width: 250px;
	height: 50px;
	border: 1px solid black;
}
</style>
</head>

<body>
你好:<%=session.getAttribute("username") %>
&nbsp;&nbsp;&nbsp;&nbsp;
<a href="show1">返回主页</a>
&nbsp;&nbsp;&nbsp;&nbsp;
<a href="exit.jsp">退出</a>
<br><br><br>
<form id="form"  >
<div  align="center">
       <table class="collapse">

       <caption style="font-weight: bold;font-size:50pt;">编辑</caption>
       <tr>
          <td>title:</td>
          <td><input type="text" id="title" name="title" value=""/></td>
        </tr>
        <tr>
           <td>description:</td>
           <td><input type="text"  id="description" name="description" value="" ></td>
        </tr>  
        <tr>
          <td>name:</td>
           <td><select id="select"></select></td>
       </table>

       <input type="button" class="button" value="编辑" id="fsubmit" onclick="f();"/><input type="reset" value="重置" class="button" /> 

 <input type="hidden"  id="hidden" value="<%=session.getAttribute("id").toString() %>">
</div>
</form>
</body>
</html>