package com.jfinal.base.module.sys.menu.contraller;
import java.util.HashMap;
import java.util.Map;
import com.jfinal.base.common.model.SysMenu;
import com.jfinal.base.utils.ObjectUtils;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;

public class SysMenuController extends Controller{
	public void index() {
		render("/sys/sysmenu/sysmenu.jsp");
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
		Page<SysMenu> menuPage=	SysMenu.dao.paginate(pageNum, length, param);
		
		Map<String, Object> dataMap =new HashMap<String, Object>();
		dataMap.put("iTotalRecords", menuPage.getTotalRow());
		dataMap.put("sEcho",sEcho);
		dataMap.put("iTotalDisplayRecords", menuPage.getTotalRow());
		dataMap.put("aaData", menuPage.getList());
		
		renderJson(dataMap);
	}
	
}
