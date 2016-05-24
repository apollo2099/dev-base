package com.jfinal.base.module.sys.user.contraller;


import com.jfinal.base.common.model.SysUser;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;

public class SysUserController extends Controller {

	public void index() {
		Page<SysUser> userPage=	SysUser.dao.paginate(getParaToInt(0, 1), 10);
		setAttr("userList", userPage.getList());
		setAttr("userPage", userPage);
		setAttr("test", "test");
		render("/sysuser/sysuser.jsp");
	}
	
	public void login(){
        String password = getPara("password");
        String username = getPara("username");
        Boolean isFlag = SysUser.dao.userLogin(username, password);
        if (isFlag) {
        	System.out.println("登录成功");
        	redirect("/index.jsp");
        }else{
        	System.out.println("登录失败");
        	//error("登录失败");
        }
	}
}
