<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<aside class="Hui-aside">
	<input runat="server" id="divScrollValue" type="hidden" value="" />
	<div class="menu_dropdown bk_2">		 
		<dl id="menu-admin">
			<dt><i class="Hui-iconfont">&#xe62d;</i> 管理员管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a _href="admin-role.html" title="角色管理">角色管理</a></li>
					<li><a _href="admin-permission.html" title="权限管理">权限管理</a></li>
					<li><a _href="/sysuser" data-title="管理员列表" href="javascript:void(0)">管理员列表</a></li>
				</ul>
			</dd>
		</dl>

		<dl id="menu-system">
			<dt><i class="Hui-iconfont">&#xe62e;</i> 系统管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a _href="system-base.html" title="系统设置">系统设置</a></li>
					<li><a _href="system-category.html" title="栏目管理">栏目管理</a></li>
					<li><a _href="system-data.html" title="数据字典">数据字典</a></li>
					<li><a _href="system-shielding.html" title="屏蔽词">屏蔽词</a></li>
					<li><a _href="system-log.html" title="系统日志">系统日志</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-article">
			<dt><i class="Hui-iconfont">&#xe616;</i> 博客管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a _href="/blog" data-title="博客管理" href="javascript:void(0)">博客管理</a></li>
				</ul>
			</dd>
		</dl>
	</div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>