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
	background-color: rgba(255, 255, 255, 0.2);
	box-shadow: 0px 0px 20px 0px black;
}

td {
	text-align: left;
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
									id="oldpwd" required="required" placeholder="请输入原密码"><input
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
			<li><a href="<%=basePath%>useRecord_addRecordPage" class="a">添加实验记录</a></li>
			<li class="active"><a
				href="<%=basePath%>useRecord_getMyRecord.action?page=1">我的实验记录</a></li>
		</ul>
	</div>
	<div class="content">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>仪器编号</th>
					<th>仪器名称</th>
					<th>实验地点</th>
					<th>开始时间</th>
					<th>结束时间</th>
					<th>运行情况</th>
				</tr>
			</thead>
			<s:if test="pageBean.list != null">
				<tbody>
					<s:iterator var="r" value="pageBean.list">
						<s:if test="#r.status == 0">
							<tr class="danger">
								<td><s:property value="#r.equipmentInfo.eid" /></td>
								<td><s:property value="#r.equipmentInfo.ename" /></td>
								<td><s:property value="#r.equipmentInfo.site" /></td>
								<td><s:property value="#r.start" /></td>
								<td><s:property value="#r.end" /></td>
								<td>异常</td>
							</tr>
						</s:if>
						<s:if test="#r.status == 1">
							<tr>
								<td><s:property value="#r.equipmentInfo.eid" /></td>
								<td><s:property value="#r.equipmentInfo.ename" /></td>
								<td><s:property value="#r.equipmentInfo.site" /></td>
								<td><s:property value="#r.start" /></td>
								<td><s:property value="#r.end" /></td>
								<td>正常</td>
							</tr>
						</s:if>
					</s:iterator>
				</tbody>
				<thead>

					<tr>
						<th colspan="6" style="text-align: center;">
							<ul class="pagination">
								<s:if test="pageBean.page !=1">
									<li><a
										href="<%=basePath%>useRecord_getMyRecord.action?page=<s:property value="pageBean.page-1"/>">&laquo;</a></li>
								</s:if>

								<s:iterator var="i" begin="1" end="pageBean.totalPage">
									<s:if test="pageBean.page != #i">
										<li><a
											href="<%=basePath%>useRecord_getMyRecord.action?page=<s:property value="#i"/>"><s:property
													value="#i" /></a></li>
									</s:if>
									<s:else>
										<li class="active"><a href="#"><s:property value="#i" /></a></li>
									</s:else>
								</s:iterator>
								<s:if test="pageBean.page != pageBean.totalPage">
									<li><a
										href="<%=basePath%>useRecord_getMyRecord.action?page=<s:property value="pageBean.page+1"/>">&raquo;</a></li>
								</s:if>
							</ul>
						</th>
					</tr>
				</thead>
			</s:if>
			<s:else>
				<tr>
					<td colspan="6" style="text-align: center;">目前没有实验记录</td>
				</tr>
			</s:else>

		</table>
	</div>
</body>
<script type="text/javascript">
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
</script>


</html>