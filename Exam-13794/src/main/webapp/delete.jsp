<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>delete</title>
</head>
<script src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
 $(function(){
	$.ajax({
		url:"SelectAll",
		type:"post",
		dataType:"json",
		success:function(data){
			
			var length=data.length;
			alert(data.length);
			$("table tr:gt(0)").html("");
			for(c in data)
				{
				 $("table").append("<tr>"+
					        "+<td class='td1'><input class='checkbox' type='checkbox'/></td>"+
					        "<td class='td2'>"+ data[c].film_id+"</td>"+
					      "  <td class='td2'>"+ data[c].title+"</td>"+
					       " <td class='td2'>"+data[c].description+"</td>"+
					      "  <td class='td2'>"+data[c].name+"</td>"+
					      
					       "<td class='td1'><input type='button' onclick='f(this)' value='删除'/></td>"+
					   "</tr>");
				
				}
		},
		error:function(){
			alert("error!");
		}
	})
 })
 function f(a)
 {//a是dom对象
	var $a=$(a);
 var id=$a.parent().prev().prev().prev().prev().html();
 alert(id);
 var multicheck=$(".checkbox");
 if($a.parent().prev().prev().prev().prev().prev().children().attr("checked")=="checked")
	 {
	 alert("ffsdsddf");
	 $.ajax({
		 url:"fdelete",
		 type:"post",
		 dataType:"json",
		 data :{"id":id},
	 success:function(data){
		 var length=data.length;
			alert(data.length);
			$("table tr:gt(0)").html("");
			for(c in data)
				{
				 $("table").append("<tr>"+
					        "+<td class='td1'><input class='checkbox' type='checkbox'/></td>"+
					        "<td class='td2'>"+ data[c].film_id+"</td>"+
					      "  <td class='td2'>"+ data[c].title+"</td>"+
					       " <td class='td2'>"+data[c].description+"</td>"+
					      "  <td class='td2'>"+data[c].name+"</td>"+
					      
					       "<td class='td1'><input type='button' onclick='f(this)' value='删除'/></td>"+
					   "</tr>");
				
				}
		},
		error:function(){
			alert("error!");
		}
	 })
	 }
	 }
 function ni(){
	 alert("f");
	 if($("#checkboxall").attr("checked")=="checked")
{
		 $(".checkbox").attr("checked",true);
		 }	 
	 else{
		 $(".checkbox").attr("checked",false); 
	 }
	 
 }
 function fan(){
	 var $checkbox=$(".checkbox");
	 var length= $checkbox.length;
	 for(var x=0;x<length;x++)
	 {
		 //alert($checkbox[x].attr("checked"));
		 //牛逼
		 if($(".checkbox:eq("+x+")").attr("checked")=="checked")
			 {	 alert("ff");
              var id=$(".checkbox:eq("+x+")").parent().next().html();
              $.ajax({
         		 url:"fdelete",
         		 type:"post",
         		 dataType:"json",
         		 data :{"id":id},
         	 success:function(data){
         		 var length=data.length;
         			alert(data.length);
         			$("table tr:gt(0)").html("");
         			for(c in data)
         				{
         				 $("table").append("<tr>"+
         					        "+<td class='td1'><input class='checkbox' type='checkbox'/></td>"+
         					        "<td class='td2'>"+ data[c].film_id+"</td>"+
         					      "  <td class='td2'>"+ data[c].title+"</td>"+
         					       " <td class='td2'>"+data[c].description+"</td>"+
         					      "  <td class='td2'>"+data[c].name+"</td>"+
         					      
         					       "<td class='td1'><input type='button' onclick='f(this)' value='删除'/></td>"+
         					   "</tr>");
         				
         				}
         		},
         		error:function(){
         			alert("error!");
         		}
         	 })
			 }
	 }
 }
</script>
<style type="text/css">
table.collapse{
width:1000;

border:1px solid red;
border-collapse: collapse;
}
td.td2{
text-align:center;
width:200px;
height:50px;
border:1px solid red;
}
td.td1{
text-align:center;
width:100px;
height:50px;
border:1px solid red;
}
</style>
<body>
你好:<%=session.getAttribute("username") %>
&nbsp;&nbsp;&nbsp;&nbsp;
<a href="show1">返回主页</a>
&nbsp;&nbsp;&nbsp;&nbsp;
<a href="exit.jsp">退出</a>
<br><br><br>
<form action=""  method="post">
<div id="div" align="center"> 
    <table id="table" class="collapse">
    <caption style="font-size:30pt;font-weight: bold;">信息</caption>
    <tr>
        <td class="td1">全选<input id="checkboxall" type="checkbox" onclick="ni();"/></td>
        <td class="td2">Film_id</td>
        <td class="td2">Title</td>
        <td class="td2">Description</td>
        <td class="td2">Name</td>
        <td class="td1">删除</td>
    </tr>
   
    </table>
    <input type="button" value="删除!"  onclick="fan();" style="width:80px;height:40px;"/>
</div>
</form>
</body>
</html>