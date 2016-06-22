package com.jfinal.base.module.sys.menu.contraller;
import java.util.HashMap;
import java.util.Map;
import com.jfinal.base.common.model.SysMenu;
import com.jfinal.base.common.model.SysUser;
import com.jfinal.base.utils.ObjectUtils;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;

/**
 * 
 * @company:www.juanpi.com
 * @department:架构服务部/JAVA工程师
 * @author huixiong 
 * @date: 2016年6月22日 下午4:22:48 
 * @since:1.0.0
 */
public class SysMenuController extends Controller{
	public void index() {
		String parentId = getPara("parentId");
		if(ObjectUtils.isNotEmpty(parentId)){
			setAttr("parentId", parentId);
			render("/sys/sysmenu/sysmenu_sub.jsp");
		}else{
			setAttr("parentId", 0);
			render("/sys/sysmenu/sysmenu.jsp");
		}
	
	}
	
	public void query(){
		int sEcho =getParaToInt("sEcho");
	    int start = getParaToInt("iDisplayStart");   // 起始
	    int length = getParaToInt("iDisplayLength"); // 分页大小size 
	    int pageNum =start/length+1;//页码
	    
	    // 请求参数
	    String menuName = getPara("menuName");
	    String parentId = getPara("parentId");
	    Map<String,Object> param = new HashMap<String, Object>();
        if(ObjectUtils.isNotEmpty(menuName)){
        	param.put("menuName", menuName);
	    }
        if(ObjectUtils.isNotEmpty(parentId)){
        	param.put("parentId", parentId);
	    }
		Page<SysMenu> menuPage=	SysMenu.dao.paginate(pageNum, length, param);
		
		Map<String, Object> dataMap =new HashMap<String, Object>();
		dataMap.put("iTotalRecords", menuPage.getTotalRow());
		dataMap.put("sEcho",sEcho);
		dataMap.put("iTotalDisplayRecords", menuPage.getTotalRow());
		dataMap.put("aaData", menuPage.getList());
		
		renderJson(dataMap);
	}
	
	
	
	public void add(){
		String parentId = getPara("parentId");
		setAttr("parentId", parentId);
		render("/sys/sysmenu/sysmenu_add.jsp");
	}
	
	public void save(){
		super.getModel(SysMenu.class).save();
		renderJson();
	}
	
	public void edit(){
		Integer menuId =getParaToInt("menuId");
		SysMenu sysMenu = SysMenu.dao.findById(menuId);
		setAttr("sysMenu", sysMenu);
		render("/sys/sysmenu/sysmenu_edit.jsp");
	}
	
	public void update(){
		super.getModel(SysMenu.class).update();
		renderJson();
	}
	
	public void delete(){
		Integer menuId =getParaToInt("menuId");
		Boolean isFlag =SysMenu.dao.deleteById(menuId);
		renderJson();
	}
	
	public void updateStatus(){
        Integer menuId = getParaToInt("menuId");
        Integer status = getParaToInt("status");
        SysMenu.dao.updateStatus(menuId, status);
		renderJson();
	}
	
}
