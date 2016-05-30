<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
<jsp:include page="/common/_meta.jsp"></jsp:include>
<title>图片列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 博客管理 <span class="c-gray en">&gt;</span> 博客列表 <a class="btn btn-success radius r " style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
     <form action="/blog" method="post">
	<div class="text-c"> 日期范围：
		<input type="text" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}'})" id="logmin" class="input-text Wdate" style="width:120px;">
		-
		<input type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d'})" id="logmax" class="input-text Wdate" style="width:120px;">
		<input type="text" name="" id="" placeholder=" 图片名称" style="width:250px" class="input-text">
		<button name="" id="" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜博客</button>
	</div>
	</form>
	
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l">
	  <a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
	  <a class="btn btn-primary radius" onclick="admin_add('添加博客','/blog/add','850','500')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加博客</a></span> <span class="r">共有数据：<strong>${blogPage.getTotalRow()}</strong> 条</span>
    </div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-sort">
			<thead>
				<tr class="text-c">
				<th width="5%"><input type="checkbox" name="" value=""></th>
				<th width="4%">id</th>
				<th width="30%">标题</th>
				<th width="12%">操作</th>
				</tr>
			</thead>
			<tbody>
			    <c:forEach items="${blogPage.getList() }" var="blog">
				<tr class="text-c">
					<td><input name="" type="checkbox" value=""></td>
					<td>${blog.id }</td>
					<td>${blog.title }</td>
					<td class="td-manage">
					 <a style="text-decoration:none" class="ml-5"  onclick="admin_edit('管理员编辑','/blog/edit/${blog.id}','2','800','500')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a> 
					 <a style="text-decoration:none" class="ml-5" onclick="admin_del(this,'1')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<!--  -->
<jsp:include page="/common/_footer.jsp"></jsp:include>
<script type="text/javascript">
$('.table-sort').dataTable({
	"aaSorting": [[ 1, "desc" ]],//默认第几个排序
	"bStateSave": true,//状态保存
	"aoColumnDefs": [
	  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
	  {"orderable":false,"aTargets":[0,2]}// 制定列不参与排序
	]
});
/*管理员-增加*/
function admin_add(title,url,w,h){
	layer_show(title,url,w,h);
}
/*管理员-删除*/
function admin_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		
		$(obj).parents("tr").remove();
		layer.msg('已删除!',{icon:1,time:1000});
	});
}
/*管理员-编辑*/
function admin_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
</script>
</body>
</html>