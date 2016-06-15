package com.jfinal.base.module.sys.role.contraller;

import com.jfinal.base.common.model.SysRole;
import com.jfinal.base.common.model.SysUser;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;

public class SysRoleController extends Controller{

	public void index() {
		Page<SysRole> rolePage=	SysRole.dao.paginate(getParaToInt(0, 1), 10);
		setAttr("rolePage", rolePage);
		render("/sys/sysrole/sysrole.jsp");
	}
}
