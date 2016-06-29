package com.jfinal.base.module.sys.role.contraller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.base.common.model.SysMenu;
import com.jfinal.base.common.model.SysRoleResource;
import com.jfinal.base.utils.ObjectUtils;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;

public class SysRoleResourceContraller extends Controller{
	public void index() {
		Integer roleId =getParaToInt("roleId");
		setAttr("roleId", roleId);
		render("/sys/sysrole/sysrole_resource.jsp");
	}
	
	public void query(){
		int sEcho =getParaToInt("sEcho");
	    int start = getParaToInt("iDisplayStart");   // 起始
	    int length = getParaToInt("iDisplayLength"); // 分页大小size 
	    int pageNum =start/length+1;//页码
	    
	    // 请求参数
	    Integer roleId =getParaToInt("roleId");
	    Map<String,Object> param = new HashMap<String, Object>();
        if(ObjectUtils.isNotEmpty(roleId)){
        	param.put("roleId", roleId);
	    }
		Page<SysMenu> menuPage=	SysMenu.dao.paginateRes(pageNum, length, param);
		
		Map<String, Object> dataMap =new HashMap<String, Object>();
		dataMap.put("iTotalRecords", menuPage.getTotalRow());
		dataMap.put("sEcho",sEcho);
		dataMap.put("iTotalDisplayRecords", menuPage.getTotalRow());
		dataMap.put("aaData", menuPage.getList());
		
		renderJson(dataMap);
	}
	
	public void add(){
		//查询一级菜单
		Integer roleId =getParaToInt("roleId");
		setAttr("roleId", roleId);
		List<SysMenu> menuList = SysMenu.dao.findAll();
		setAttr("menuList", menuList);
		render("/sys/sysrole/sysrole_resource_add.jsp");
	}
	
	public void save(){
		super.getModel(SysRoleResource.class).save();
		renderJson();
	}
	
	public void delete(){
		Integer id =getParaToInt("id");
		Boolean isFlag =SysRoleResource.dao.deleteById(id);
		renderJson();
	}
	
}
