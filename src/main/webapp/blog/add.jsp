<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>

<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
<jsp:include page="/common/_meta.jsp"></jsp:include>
<!--/meta 作为公共模版分离出去-->

<title>添加博客</title>
<meta name="keywords" content="H-ui.admin v2.3,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description" content="H-ui.admin v2.3，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
<article class="page-container">
	<form class="form form-horizontal" id="form-admin-add" action="/blog/save" method="post">
	<div class="row cl">
		<label class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>标题：</label>
		<div class="formControls col-xs-10 col-sm-10">
			<input type="text" class="input-text" name="blog.title" value="${blog.title}" id="blogTitle"/>${titleMsg}
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-2 col-sm-2">内容：</label>
		<div class="formControls col-xs-10 col-sm-10">
			<textarea name="blog.content" cols="80" rows="10" class="textarea" id="blogContent">${blog.content}</textarea>${contentMsg}
			<p class="textarea-numberbar"><em class="textarea-length">0</em>/1000</p>
		</div>
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
<!--/_footer /作为公共模版分离出去--> 

<!--请在下方写此页面业务相关的脚本--> 
<script type="text/javascript">
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	$("#form-admin-add").validate({
		rules:{
			blogTitle:{
				required:true,
				minlength:4,
				maxlength:64
			},
			blogContent:{
				required:true,
				minlength:20
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