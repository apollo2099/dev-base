package com.jfinal.base.module.sys.role.contraller;

import com.jfinal.base.common.model.SysRole;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;

public class SysRoleController extends Controller{

	public void index() {
		Page<SysRole> rolePage=	SysRole.dao.paginate(getParaToInt(0, 1), 10);
		setAttr("rolePage", rolePage);
		render("/sys/sysrole/sysrole.jsp");
	}
	
	public void add(){
		render("/sys/sysrole/sysrole_add.jsp");
	}
	
	public void save(){
		super.getModel(SysRole.class).save();
		renderJson();
	}
	
	public void edit(){
		Integer roleId = getParaToInt("roleId");
		SysRole sysRole = SysRole.dao.findById(roleId);
		setAttr("sysRole", sysRole);
		render("/sys/sysrole/sysrole_edit.jsp");
	}
	
	public void update(){
		super.getModel(SysRole.class).update();
		renderJson();
	}
	
	public void delete(){
		Integer roleId =getParaToInt("roleId");
		Boolean isFlag =SysRole.dao.deleteById(roleId);
		renderJson();
	}
}
