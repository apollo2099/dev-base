package com.jfinal.base.module.sys.user.contraller;

import java.util.HashMap;
import java.util.Map;

import com.jfinal.base.common.model.SysLog;
import com.jfinal.base.common.model.SysUser;
import com.jfinal.base.utils.ObjectUtils;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;

public class SysUserController extends Controller {

	public void index() {
		render("/sys/sysuser/sysuser.jsp");
	}
	
	public void query(){
		int sEcho =getParaToInt("sEcho");
	    int start = getParaToInt("iDisplayStart");   // 起始
	    int length = getParaToInt("iDisplayLength"); // 分页大小size 
	    int pageNum =start/length+1;//页码
	    
	    // 请求参数
	    String startTime =getPara("startTime");
	    String endTime =getPara("endTime");
	    String loginName = getPara("loginName");
	    Map<String,Object> param = new HashMap<String, Object>();
	    if(ObjectUtils.isNotEmpty(startTime)){
	    	param.put("startTime", startTime);
	    }
	    if(ObjectUtils.isNotEmpty(endTime)){
	    	param.put("endTime", endTime);
	    }
        if(ObjectUtils.isNotEmpty(loginName)){
        	param.put("loginName", loginName);
	    }
		Page<SysUser> userPage=	SysUser.dao.paginate(pageNum, length, param);
		
		Map<String, Object> dataMap =new HashMap<String, Object>();
		dataMap.put("iTotalRecords", userPage.getTotalRow());
		dataMap.put("sEcho",sEcho);
		dataMap.put("iTotalDisplayRecords", userPage.getTotalRow());
		dataMap.put("aaData", userPage.getList());
		
		renderJson(dataMap);
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
	
	
	public void add(){
		render("/sys/sysuser/sysuser_add.jsp");
	}
	
	public void saveUser(){
		super.getModel(SysUser.class).save();
		System.out.println("test");
		renderJson();
		//render("/sys/sysuser/sysuser.jsp");
	}
	
	public void edit(){
		String userId = getPara("userId");
		SysUser sysUser = SysUser.dao.findById(userId);
		setAttr("sysUser", sysUser);
		render("/sys/sysuser/sysuser_edit.jsp");
	}
	
	public void updateUser(){
		super.getModel(SysUser.class).update();
		//render("/sys/sysuser/sysuser.jsp");
		renderJson();
	}
	
	public void updateStatus(){
        String userId = getPara("userId");
        String status = getPara("status");
		SysUser.dao.updateStatus(userId, status);
		renderJson();
	}
	
	public void delete(){
		Integer idValue =getParaToInt("userId");
		Boolean isFlag =SysUser.dao.deleteById(idValue);
		
		Map<String, Object> dataMap =new HashMap<String, Object>();
		dataMap.put("isFlag", isFlag);
		renderJson(dataMap);
	}
	
	
}
