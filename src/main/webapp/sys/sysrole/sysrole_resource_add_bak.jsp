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
			<label class="form-label col-xs-2 col-sm-3">分配资源：</label>
			<div class="formControls col-xs-10 col-sm-9">
			 		<ul id="treeDemo" class="ztree"></ul>
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
var setting = {
		view: {
			dblClickExpand: false,
			showLine: false,
			selectedMulti: false
		},
        check: {
            chkboxType: {"Y": "p", "N": "s"},
            chkStyle: "checkbox",
            enable: true,
            autoCheckTrigger: true
        },
		data: {
			simpleData: {
				enable:true,
				idKey: "id",
				pIdKey: "pId",
				rootPId: ""
			}
		},
		callback: {
			beforeClick: function(treeId, treeNode) {
				var zTree = $.fn.zTree.getZTreeObj("tree");
				if (treeNode.isParent) {
					zTree.expandNode(treeNode);
					return false;
				} else {
					demoIframe.attr("src",treeNode.file + ".html");
					return true;
				}
			}
		}
	};

	var zNodes =[
		{ id:1, pId:0, name:"一级分类", open:true},
		{ id:11, pId:1, name:"二级分类"},
		{ id:111, pId:11, name:"三级分类"},
		{ id:112, pId:11, name:"三级分类"},
		{ id:113, pId:11, name:"三级分类"},
		{ id:114, pId:11, name:"三级分类"},
		{ id:115, pId:11, name:"三级分类"},
		{ id:12, pId:1, name:"二级分类 1-2"},
		{ id:121, pId:12, name:"三级分类 1-2-1"},
		{ id:122, pId:12, name:"三级分类 1-2-2"},
	];
			
	var code;
	function showCode(str) {
		if (!code) code = $("#code");
		code.empty();
		code.append("<li>"+str+"</li>");
	}
			
	$(document).ready(function(){
		var t = $("#treeDemo");
		t = $.fn.zTree.init(t, setting, zNodes);
		var zTree = $.fn.zTree.getZTreeObj("tree");
		zTree.selectNode(zTree.getNodeByParam("id",'11'));
	});


</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>