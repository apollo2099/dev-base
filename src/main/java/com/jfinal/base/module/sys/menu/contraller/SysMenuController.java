package com.jfinal.base.module.sys.menu.contraller;
import com.jfinal.base.common.model.SysMenu;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;

public class SysMenuController extends Controller{
	public void index() {
		Page<SysMenu> menuPage=	SysMenu.dao.paginate(getParaToInt(0, 1), 10);
		setAttr("menuList", menuPage.getList());
		setAttr("menuPage", menuPage);
		render("/sys/sysmenu/sysmenu.jsp");
	}
}
