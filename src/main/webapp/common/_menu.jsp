<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<aside class="Hui-aside">
	<input runat="server" id="divScrollValue" type="hidden" value="" />
	<div class="menu_dropdown bk_2">		 
		<dl id="menu-system">
			<dt><i class="Hui-iconfont">&#xe62e;</i> 系统管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a _href="/sys/sysmenu" data-title="系统设置" href="javascript:void(0)">菜单管理</a></li>
					<li><a _href="/sys/sysrole" data-title="角色管理" href="javascript:void(0)">角色管理</a></li>
					<li><a _href="/sys/sysuser" data-title="用户管理" href="javascript:void(0)">用户管理</a></li>
					<li><a _href="/sys/syslog" data-title="系统日志" href="javascript:void(0)">系统日志</a></li>
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