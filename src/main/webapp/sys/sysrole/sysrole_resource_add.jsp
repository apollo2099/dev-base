<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>

<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
<jsp:include page="/common/_meta.jsp"></jsp:include>

<title>新建网站角色 - 管理员管理 - H-ui.admin v2.3</title>
<meta name="keywords" content="H-ui.admin v2.3,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description" content="H-ui.admin v2.3，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
<article class="page-container">
	<form action="/sys/sysroleres/save" method="post" class="form form-horizontal" id="form-menu-add">
	<input type="hidden" class="input-text" placeholder="" value="${roleId }" name="sysRoleResource.role_id">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">分配资源：</label>
			<div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select class="select" size="1" name="sysRoleResource.resource_id">
					<option value="" selected>请选择角色</option>
					<c:forEach items="${menuList }" var="menu">
					  <option value="${menu.menuId }">${menu.menuName }</option>
					</c:forEach>
				</select>
				</span> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">菜单备注：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea name="sysMenu.description" cols="" rows="" class="textarea"  placeholder="说点什么...最少输入10个字符" onKeyUp="textarealength(this,100)"></textarea>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<button type="submit" class="btn btn-success radius" id="admin-role-save" name="admin-role-save"><i class="icon-ok"></i> 确定</button>
			</div>
		</div>
	</form>
</article>

<jsp:include page="/common/_footer.jsp"></jsp:include>

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript">
$(function(){	
	$("#form-menu-add").validate({
		rules:{
			"sysMenu.menu_name":{
				required:true,
			},
			"sysMenu.menu_url":{
				required:true,
			},
			"sysMenu.menu_icon":{
				required:true,
			},
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$(form).ajaxSubmit();
			var index = parent.layer.getFrameIndex(window.name);
			parent.location.reload();
			parent.layer.close(index);
		}
	});
});
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>