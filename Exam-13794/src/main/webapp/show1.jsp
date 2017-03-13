<%@ page language="java"  import="www.bean.Film,www.bean.Customer,java.util.*"  contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; utf-8">
<title>show1</title>
<script src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#select").bind("change",function(e){
		alert("Fsf");
		 var ob=e.target; //dom对象
		   alert(ob.value);
		if(ob.value="1")
			{
			window.location.href="add.jsp";
			}
		else if(ob.value="2")
			{
			window.location.href="delete.jsp";
			
			}
		else if(ob.value="3")
			{
			window.location.href="bianji.jsp";
			}
		else {
			
			window.location.href="show1.jsp";
		}
	})
	
	
	
})

</script>
<style type="text/css">
table.collapse{
width:100%;

border:1px solid red;
border-collapse: collapse;
}
td{
text-align:center;
width:25%px;
height:30px;
border:1px solid red;
}
</style>
<body>
</head>
<body>
你好:<%=session.getAttribute("username") %>
&nbsp;&nbsp;&nbsp;&nbsp;
管理:<select id="select" >
       <option value="" selected="selected">其它</option>
       <option value="1">增加</option>
        <option value="2">删除</option>
        <option value="3">编辑</option>
</select>
&nbsp;&nbsp;&nbsp;&nbsp;
<a href="exit.jsp">退出</a>
<br><br><br>
<form action=""  method="post">
<div id="div" align="center"> 
    <table id="table" class="collapse">
    <caption style="font-size:30pt;font-weight: bold;">信息</caption>
    <tr>
        <td>Film_id</td>
        <td>Title</td>
        <td>Description</td>
        <td>Name</td>
    </tr>
    <%
      List<Film> l=(List<Film>)request.getAttribute("list");
    for(Film li:l)
    {
    %>
    <tr>
    	<td><%=li.getFilm_id()%></td>
    	<td><%=li.getTitle()%></td>
    	<td><%=li.getDescription()%></td>
    	<td><%=li.getName()%></td>
    	
    	</tr>
   <% 
    }
    %>
    </table>
</div>
</form>
</body>
</html>