package com.jfinal.base.module.sys.user.contraller;


import com.jfinal.base.common.model.SysUser;
import com.jfinal.core.Controller;

public class SysUserController extends Controller {

	public void index() {
		setAttr("userPage", SysUser.dao.paginate(getParaToInt(0, 1), 10));
		render("/sysuser/sysuser.jsp");
	}
}
