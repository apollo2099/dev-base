<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
<jsp:include page="/common/_meta.jsp"></jsp:include>
<title>管理员列表</title>
</head>
<body>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
	   <span class="l">
	   <a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
	   <a href="javascript:;" onclick="admin_add('添加菜单','/sys/sysroleres/add?roleId=${roleId}','800','500')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 分配资源</a>
	   </span> 
	</div>
	<table class="table table-border table-bordered table-bg table-sort">
		<thead>
			<tr>
				<th scope="col" colspan="9">菜单列表</th>
			</tr>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="" value=""></th>
				<th width="40">ID</th>
				<th width="250">菜单名称</th>
				<th width="100">操作</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
</div>
<!-- 底部文件 -->
<jsp:include page="/common/_footer.jsp"></jsp:include>
<script type="text/javascript">
/*
	参数解释：
	title	标题
	url		请求的url
	id		需要操作的数据id
	w		弹出层宽度（缺省调默认值）
	h		弹出层高度（缺省调默认值）
*/
/*管理员-增加*/
function admin_add(title,url,w,h){
	layer_show(title,url,w,h);
}
/*管理员-删除*/
function admin_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		 $.ajax({   
		     url:'/sys/sysroleres/delete',   
		     type:'post',   
		     data:'id='+id,   
		     async : true, //默认为true 异步   
		     error:function(){   
		        alert('error');   
		     },   
		     success:function(data){   
				$(obj).parents("tr").remove();
				layer.msg('已删除!',{icon:1,time:1000});
                // 刷新数据表格
				refreshTable();
		     }
	      });
	});
}

var defTable = $('.table-sort').dataTable(
        {
            "sPaginationType": "full_numbers", //分页风格，full_number会把所有页码显示出来（大概是，自己尝试）
            "sDom": "<'row-fluid inboxHeader'<'span6'<'dt_actions'>l><'span6'f>r>t<'row-fluid inboxFooter'<'span6'i><'span6'p>>", //待补充
            "iDisplayLength": 10,//每页显示10条数据
            "bAutoWidth": false,//宽度是否自动，感觉不好使的时候关掉试试
            "bLengthChange": false, 
            "bFilter": false,
            "oLanguage": {//下面是一些汉语翻译
                "sSearch": "搜索",
                "sLengthMenu": "每页显示 _MENU_ 条记录",
                "sZeroRecords": "没有检索到数据",
                "sInfo": "显示 _START_ 至 _END_ 条 &nbsp;&nbsp;共 _TOTAL_ 条",
                "sInfoFiltered": "(筛选自 _MAX_ 条数据)",
                "sInfoEmtpy": "没有数据",
                "sProcessing": "正在加载数据...",
                "sProcessing": "<img src='http://localhost:8080/static/h-ui/images/ajax-loader.gif'/>", //这里是给服务器发请求后到等待时间显示的 加载gif
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
            "sAjaxSource": "/sys/sysroleres/query?roleId=${parentId}", //给服务器发请求的url
			"createdRow" : function(row, mData, index) {
				$('td:eq(0)', row).html("<input type='checkbox' name='chx_default' value='" + mData.id + "'/>");
			},
            "aoColumns": [ //这个属性下的设置会应用到所有列，按顺序没有是空
                           {"mData": 'id'},
                           {"mData": 'id'},
                           {"mData": 'menu_name'}, //mData 表示发请求时候本列的列明，返回的数据中相同下标名字的数据会填充到这一列
                         ],
            "aoColumnDefs": [//和aoColums类似，但他可以给指定列附近爱属性
                {sDefaultContent: '',aTargets: [ '_all' ]},
                {"bSortable": false, "aTargets": [1]},  //这句话意思是第1,3,6,7,8,9列（从0开始算） 不能排序
                {"bSearchable": false, "aTargets": [1, 2,3]}, //bSearchable 这个属性表示是否可以全局搜索，其实在服务器端分页中是没用的
            ],
            "aaSorting": [[2, "desc"]], //默认排序
            "fnRowCallback": function(nRow, aData, iDisplayIndex) {// 当创建了行，但还未绘制到屏幕上的时候调用，通常用于改变行的class风格
                $('td:eq(3)', nRow).html('<a title="删除" href="javascript:;" onclick="admin_del(this,\''+aData.menu_id+'\')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>');            	
                return nRow;
            },
            "fnServerParams": function(aoData) {
                aoData.push({"name": "menuName","value": $("#menuName").val()});
            },
            "fnInitComplete": function(oSettings, json) { //表格初始化完成后调用 在这里和服务器分页没关系可以忽略
                $("input[aria-controls='DataTables_Table_0']").attr("placeHolder", "请输入高手用户名");
            }

        }
);


function refreshTable(toFirst) {
	//defaultTable.ajax.reload();
	if(toFirst){//表格重绘，并跳转到第一页
		defTable.fnDraw();
	}else{//表格重绘，保持在当前页
		defTable.fnDraw(false);
	}
}
</script>
</body>
</html>