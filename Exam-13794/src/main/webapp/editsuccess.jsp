<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
你好:<%=session.getAttribute("username") %>
&nbsp;&nbsp;&nbsp;&nbsp;
<a href="show1">返回主页</a>
&nbsp;&nbsp;&nbsp;&nbsp;
<a href="exit.jsp">退出</a>
<br><br><br><br>
<h1 align="center">更新成功!</h1>
</body>
</html>