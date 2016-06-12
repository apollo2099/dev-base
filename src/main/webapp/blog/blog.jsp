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
		<table id="default_table" class="table table-border table-bordered table-bg table-hover table-sort">
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
	"sPaginationType": "full_numbers", //分页风格，full_number会把所有页码显示出来（大概是，自己尝试）
	"bAutoWidth": false,//宽度是否自动，感觉不好使的时候关掉试
	   "oLanguage": {//下面是一些汉语翻译
           "sSearch": "搜索",
           "sLengthMenu": "每页显示 _MENU_ 条记录",
           "sZeroRecords": "没有检索到数据",
           "sInfo": "显示 _START_ 至 _END_ 条 &nbsp;&nbsp;共 _TOTAL_ 条",
           "sInfoFiltered": "(筛选自 _MAX_ 条数据)",
           "sInfoEmtpy": "没有数据",
           "sProcessing": "正在加载数据...",
           "sProcessing": "<img src='{{rootUrl}}global/img/ajaxLoader/loader01.gif' />", //这里是给服务器发请求后到等待时间显示的 加载gif
                   "oPaginate":
                   {
                       "sFirst": "首页",
                       "sPrevious": "前一页",
                       "sNext": "后一页",
                       "sLast": "末页"
                   }
       },
       "bProcessing": true, //开启读取服务器数据时显示正在加载中……特别是大数据量的时候，开启此功能比较好
       "bServerSide": true, //开启服务器模式，使用服务器端处理配置datatable。注意：sAjaxSource参数也必须被给予为了给datatable源代码来获取所需的数据对于每个画。 这个翻译有点别扭。开启此模式后，你对datatables的每个操作 每页显示多少条记录、下一页、上一页、排序（表头）、搜索，这些都会传给服务器相应的值。 
       "sAjaxSource": "/blog", //给服务器发请求的url
       "aoColumns": [ //这个属性下的设置会应用到所有列，按顺序没有是空
           {"mData": 'nickname'}, //mData 表示发请求时候本列的列明，返回的数据中相同下标名字的数据会填充到这一列
           {"mData": 'follower_count'},
           {"mData": 'rank'},
           {"mData": 'month_count'},
           {"mData": 'equity'},
           {"mData": 'month_ror'},
           {"mData": 'now_orders'},
           {"mData": 'profit_total'},
           {"sDefaultContent": ''}, // sDefaultContent 如果这一列不需要填充数据用这个属性，值可以不写，起占位作用
           {"sDefaultContent": '', "sClass": "action"},//sClass 表示给本列加class
       ],
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