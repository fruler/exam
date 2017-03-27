<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登录</title>
<style>
* {
	margin: 0px;
	padding: 0px;
}

#main {
	/*  */
	background-color: rgb(252, 251, 247);
	height: 556px;
	/* border: 1px solid red; */
	background-image: url("/SSMTest/imgs/10.jpg");
	background-repeat: no-repeat;
	background-position: center;
	background-attachment: scroll;
}

#img1 {
	width: 30px;
	height: 30px;
	display: inline-block;
	margin: 5px 10px;
}

#header {
	/* border: 1px solid red; */
	height: 46px;
}

#span1 {
	position: absolute;
	top: 10px;
	font-weight: bold;
	font-size: 20px;
}

#center {
	/* border: 1px solid black; */
	height: 200px;
	width: 450px;
	margin: 138px auto;
	background-image: url("/SSMTest/imgs/timg2.jpg");
	background-repeat: repeat;
	background-attachment: scroll;
	border-radius:10px;
}

#footer {
	background-color: silver;
	/* border: 1px solid black; */
	height: 34px;
}

#end {
	background-color: grey;
	height: 53px;
	line-height: 53px;
	text-align: center;
	font-weight: bold;
	font-size: 20px;
}

#div1 {
/* 	border: 1px solid silver; */
	padding: 5px 10px;
	font-weight: bold;
	font-size: 20px;
}

table.collapse {
	border-collapse: collapse;
	/*  border:1px solid red;  */
}

td {
	/* border:1px solid red;  */
	height: 30px;
}

td.td1 {
	width: 150px;
	text-align: right;
	font-weight: bold;
	font-size: 20px;
}

.input {
	height: 30px;
	width: 200px;
}

td.td2 {
	width: 300px;
	text-align: left;
}

table {
	margin-top: 30px;
}

#button {
	height: 30px;
	width: 60px;
	background-color: rgb(209, 219, 210);
	font-weight: bold;
	font-size:20px;
}

#button:hover {
	background-color: black;
	color: red;
}

#div3 {
	height: 35px;
	font-size: 20px;
	text-align: center;
	font-weight: bold;
	line-height: 35px;
}

.input:focus {
	height: 50px;
	width: 300px;
	background-color: black;
	color: red;
	font-size: 20px;
}
#span1:hover{
 color:white;
}
</style>
</head>
<body>
<form action="<%=request.getContextPath()%>/login" method="post">
	<div id="main">
		<div id="header">
			<img id="img1" src="<%=request.getContextPath()%>/imgs/FF.png" /><span id="span1">13794-范旭超</span>
		</div>
		<div id="center">
			<div id="div1">电影租凭管理系统</div>

			<table class="collapse">
				<tr>
					<td class="td1">用户名:</td>
					<td class="td2"><input name="username" class="input" /></td>
				</tr>
				<tr>
					<td class="td1">密码:</td>
					<td class="td2"><input name="password" class="input" /></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="登录" id="button" /></td>
				</tr>
			</table>
			<div id="div3"></div>
		</div>
		<div id="footer"></div>
	</div>
	<div id="end">如有雷同,纯属巧合!</div>
	</form>
</body>
</html>