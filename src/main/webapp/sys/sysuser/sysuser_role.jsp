<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>

<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
<jsp:include page="/common/_meta.jsp"></jsp:include>
<!--/meta 作为公共模版分离出去-->

<title>添加用户 - H-ui.admin v2.3</title>
<meta name="keywords" content="H-ui.admin v2.3,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description" content="H-ui.admin v2.3，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
<article class="page-container">
	<form action="/sys/sysuser/dealRole" method="post" class="form form-horizontal" id="form-member-add">
	<input type="hidden" class="input-text" name="sysUserRole.user_id" value="${sysUser.userId }">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>用户名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text"  placeholder="" id="loginName" name="sysUser.login_name" value="${sysUser.loginName }" readonly="readonly">
			</div>
		</div>
       <div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">分配角色：</label>
			<div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select class="select" size="1" name="sysUserRole.role_id">
					<option value="" selected>请选择角色</option>
					<c:forEach items="${roleList }" var="role">
					  <option value="${role.roleId }">${role.roleName }</option>
					</c:forEach>
				</select>
				</span> </div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
			</div>
		</div>
	</form>
</article>

<!--_footer 作为公共模版分离出去--> 
<jsp:include page="/common/_footer.jsp"></jsp:include>

<!--请在下方写此页面业务相关的脚本--> 
<script type="text/javascript">
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	$("#form-member-add").validate({
		rules:{
			"sysUser.login_name":{
				required:true,
				minlength:2,
				maxlength:16
			},
			"sysUser.password":{
				required:true,
			},
			"sysUser.status":{
				required:true,
			},
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$(form).ajaxSubmit();
			var index = parent.layer.getFrameIndex(window.name);
			parent.$('.btn-refresh').click();
			parent.location.reload();
			parent.layer.close(index); 
		}
	});
});
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>