<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<title>登录</title>
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
<script src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
<script src="<%=basePath%>js/bootstrap.min.js"></script>
</head>
<style>
* {
	margin: 0;
	padding: 0;
}

body {
	background-color: black;
	position: relative;
}

#bgimg {
	width: 1366px;
}

.login {
	position: absolute;
	top: 80px;
	left: 340px;
	width: 700px;
	height: 400px;
	text-align: center;
	float: left;
	background-color: rgba(255, 255, 255, 0.2);
	vertical-align: middle;
	box-shadow: 0px 0px 20px 0px gray;
}

.inner {
	height: 400px;
}

label {
	color: white;
}

.form {
	text-align: center;
	vertical-align: middle;
	width: 450px;
	display: inline-block;
}

#captcha {
	width: 200px;
}
</style>

<body>
	<img id="bgimg" src="<%=basePath%>img/loginbg.jpg">
	<div class="login">
		<div class="inner">
			<h1 style="color: skyblue; font-weight: 600;">
				实验仪器管理系统 /<small style="font-style: italic; color: #CCCCCC;">LOGIN</small>
			</h1>
			<br /> <br /> <br /> <br />
			<div class="form">
				<form class="form-horizontal" role="form" action="student_login" method="post">
					<div class="form-group">
						<label for="firstname" class="col-sm-2 control-label">用户名</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="sid" name="sid">
						</div>
					</div>
					<div class="form-group">
						<label for="lastname" class="col-sm-2 control-label">密 码</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" id="password"
								name="password">
						</div>
					</div>
					<div class="form-group">
						<label for="lastname" class="col-sm-2 control-label">验证码</label>
						<div class="col-sm-10">
							<table>
								<tr>
									<td><input type="text" class="form-control" id="captcha"
										name="captcha"></td>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td><img id="checkImg" src="<%=basePath%>checkImg.action"
										onclick="change()" title="点击更换验证码"></td>
								</tr>

							</table>
						</div>
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-primary">登&nbsp;&nbsp;&nbsp;录</button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="reset" class="btn btn-primary">重&nbsp;&nbsp;&nbsp;置</button>
					</div>
					<div class="form-group">
						<s:actionerror />
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
	function change() {
		var img1 = document.getElementById("checkImg");
		img1.src = "${pageContext.request.contextPath}/checkImg.action?nowtime=" + new Date().getTime();
	}
</script>

</html>
