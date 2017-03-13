<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<a href="index.jsp">返回登录页面</a>
<br><br><br><br><br>
<center style="font-size:30pt;font-weight: bold;">成功退出</center>
<%session.invalidate(); %>
</body>
</html>