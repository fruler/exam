<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>edit</title>
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
					        
					        "<td class='td2'>"+ data[c].film_id+"</td>"+
					      "  <td class='td2'>"+ data[c].title+"</td>"+
					       " <td class='td2'>"+data[c].description+"</td>"+
					      "  <td class='td2'>"+data[c].name+"</td>"+
					      
					       "<td class='td1'><input type='button' onclick='f(this)' value='编辑'/></td>"+
					   "</tr>");
				
				}
		},
		error:function(){
			alert("error!");
		}
	})
 })
 function f(f){
	 var $a=$(f);
	 var id=$a.parent().prev().prev().prev().prev().html();
	 window.location.href="fupdate1?id="+id;
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
width:200px;
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
    <caption style="font-size:30pt;font-weight: bold;">编辑信息</caption>
    <tr>
        
        <td class="td2">Film_id</td>
        <td class="td2">Title</td>
        <td class="td2">Description</td>
        <td class="td2">Name</td>
        <td class="td1">编辑</td>
    </tr>
   
    </table>
   
</div>
</form>
</body>
</html>