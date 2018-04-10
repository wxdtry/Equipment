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
<title>首页</title>
<link rel="
stylesheet" href="<%=basePath%>css/bootstrap.min.css">
<script src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
<script src="<%=basePath%>js/bootstrap.min.js"></script>
<script src="<%=basePath%>js/laydate/laydate.js"></script>
</head>


<style>
body {
	background-image: url("<%=basePath%>/img/bg9.jpg");
	background-size: cover;
}

#myModal {
	text-align: center;
}

.title {
	width: 300px;
	position: absolute;
	left: 100px;
}

.content {
	position: absolute;
	top: 120px;
	left: 100px;
	width: 970px;
	height: 450px;
	text-align: center;
	background-color: rgba(0, 0, 0, 0.2);
	box-shadow: 0px 0px 20px 0px black;
}

.recordform {
	text-align: center;
	/* padding: 10px 20px;
	background-color: #fff;
	margin: 10px auto; */
}

td {
	height: 50px;
}

.a {
	background-color: #00706B;
	color: #FFFFFF;
}
</style>

<body style="position: relative;">
	<h1 style="color: #28A4C9; font-weight: 600;">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;实验仪器管理系统
		/ <small style="font-style: italic; color: #5E5E5E;"><s:property
				value="#session.student.classInfo.academy.aname" /></small>
	</h1>
	<div
		style="position: absolute; top: 10px; right: 20px; font-size: large;">
		<a href="#" class="dropdown-toggle" data-toggle="dropdown"> <span
			class="glyphicon glyphicon-user"><s:property
					value="#session.student.name" /></span> <b class="caret"></b>
		</a>,欢迎您
		<ul class="dropdown-menu" style="min-width: 100px;">
			<li style="background-color: white;" data-toggle="modal"
				data-target="#myModal"><a>修改密码</a></li>
			<li class="divider"></li>
			<li style="background-color: white;"><a
				href="<%=basePath%>student_exit">退&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;出</a>
			</li>
		</ul>

	</div>
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">修改密码</h4>
				</div>
				<form class="form-horizontal" role="form" action="student_changePwd"
					method="post" onsubmit="return checkForm();">
					<div class="modal-body" id="formpwd">

						<div class="form-group">
							<label for="firstname" class="col-sm-2 control-label">原密码</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" name="oldpwd"
									id="oldpwd" required="required" placeholder="请输入原密码"> <input
									type="password" id="pwd" hidden="hidden"
									value="<s:property value='#session.student.password' />">
							</div>
						</div>
						<div class="form-group">
							<label for="lastname" class="col-sm-2 control-label">新密码</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" name="newpwd"
									id="newpwd" required="required"
									placeholder="请输入新密码，长度为6~20位的字母、数字">
							</div>
						</div>
						<div class="form-group">
							<label for="lastname" class="col-sm-2 control-label">确认密码</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="checkpwd"
									required="required" placeholder="请再次输入新密码">
							</div>
						</div>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="submit" class="btn btn-primary">提交更改</button>
					</div>
				</form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>

	<div class="title">
		<ul class="nav nav-pills nav-justified">
			<li class="active"><a href="#" id="">添加实验记录</a></li>
			<li><a href="<%=basePath%>useRecord_getMyRecord.action?page=1"
				class="a">我的实验记录</a></li>
		</ul>
	</div>
	<div class="content">
		<form class="recordform" action="<%=basePath%>useRecord_addRecord"
			method="post" onsubmit="return checkaddForm();">
			<br> <br>
			<table align="center">
				<tr>
					<td>仪器编号：<input type="text" id="eid" name="equipmentInfo.eid"
						required="required" onblur="getEname();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" name="student.sid" hidden="hidden"
						value="<s:property value="#session.student.sid" />">
					</td>
					<td>仪器名称：<input type="text" id="ename" disabled="disabled"
						value=""></td>
				</tr>
				<tr>
					<td>开始时间：<input type="datetime" name="start" id="start" required="required"
						onclick="laydate({istime: true,format: 'YYYY-MM-DD hh:mm:ss',festival: true})">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td>结束时间：<input type="datetime" name="end" id="end" required="required"
						onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss',festival: true})"></td>
				</tr>
				<tr>
					<td colspan="2" align="left">运行情况： <input type="radio"
						value="1" name="status" checked="checked" onclick="change();"> 正常&nbsp;&nbsp;&nbsp;<input
						id="status" type="radio" value="0" name="status"
						onclick="change();"> 异常

					</td>
				</tr>
				<tr>
					<td colspan="2" align="left"><div hidden="hidden" id="textarea">
							<table>
								<tr>
									<td valign="top"><span>异常情况：</span></td>
									<td><textarea rows="3" cols="55" id="description"
											name="description"></textarea></td>
								</tr>
							</table>

							<%-- <span>异常情况：</span>
							<textarea rows="3" cols="60" id="description" name="description"></textarea> --%>
						</div></td>
				</tr>
				<tr>
					<td colspan="2"><button type="submit" class="btn btn-primary">提&nbsp;&nbsp;&nbsp;交</button></td>
				</tr>
			</table>
		</form>
	</div>
</body>
<script type="text/javascript">
	function checkaddForm() {
		var ename = document.getElementById("ename").value;
		if (ename.length == 0) {
			alert("没有该仪器，请确认后重试！！");
			return false;

		}
		return true;
	}
	function getEname() {
		var eid = document.getElementById("eid").value;
		// 1.创建异步交互对象
		var xhr = createXmlHttp();
		// 2.设置监听
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4) {
				if (xhr.status == 200) {
					document.getElementById("ename").value = xhr.responseText;
				}
			}
		}
		// 3.打开连接
		xhr.open("GET", "${pageContext.request.contextPath}/equipment_getEname.action?time=" + new Date().getTime() + "&eid=" + eid, true);
		// 4.发送
		xhr.send(null);
	}
	function change() {
		var status = document.getElementById("status");
		var description = document.getElementById("description");
		var textarea = document.getElementById("textarea");
		description.required = status.checked;
		textarea.hidden = !status.checked;
	}
	laydate.skin('molv');
	function checkForm() {
		var pwd = document.getElementById("pwd").value;
		var oldpwd = document.getElementById("oldpwd").value;
		var newpwd = document.getElementById("newpwd").value;
		var checkpwd = document.getElementById("checkpwd").value;
		var pattern = /^[a-zA-Z0-9]{6,20}$/;
		if (pwd != oldpwd) {
			alert("原密码输入错误！");
			return false;
		}
		if (!pattern.test(newpwd)) {
			alert("新密码必须为6-20位");
			return false;
		}
		if (newpwd != checkpwd) {
			alert("两次密码输入不一致");
			return false;
		}
		return true;
	}
	function createXmlHttp() {
		var xmlHttp;
		try { // Firefox, Opera 8.0+, Safari
			xmlHttp = new XMLHttpRequest();
		} catch (e) {
			try { // Internet Explorer
				xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {}
			}
		}

		return xmlHttp;
	}
</script>

</html>