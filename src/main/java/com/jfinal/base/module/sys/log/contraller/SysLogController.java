/** 
  * Project Name:dev-base 
  * File Name:SysLogController.java 
  * Package Name:com.jfinal.base.module.sys.log.contraller 
  * Date:2016年6月14日上午10:54:10 
  * Copyright (c) 2016, JuanPi.com All Rights Reserved
  */  
  
package com.jfinal.base.module.sys.log.contraller;

import java.util.HashMap;
import java.util.Map;

import com.jfinal.base.common.model.SysLog;
import com.jfinal.base.utils.ObjectUtils;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;

/** 
  * @company:www.juanpi.com
  * @department:架构服务部/JAVA工程师
  * @author huixiong 
  * @date: 2016年6月14日 上午10:54:10 
  * @since:1.0.0
  */
public class SysLogController extends Controller{
	public void index() {
		Page<SysLog> logPage=	SysLog.dao.paginate(getParaToInt(0, 1), 10);
		setAttr("logPage", logPage);
		render("/sys/syslog/syslog.jsp");
	}
	/**
	 * 
	 * @author huixiong
	 */
	public void query(){
		String sSearch = "";// 搜索的关键字
		int count = 0 ;  //查询出来的数量
//		JSONArray ja = (JSONArray) JSONArray.parse(aoData);
//		//分别为关键的参数赋值
//		for (int i = 0; i < ja.size(); i++) {
//			JSONObject obj = (JSONObject) ja.get(i);
//			if (obj.get("name").equals("sEcho"))
//				sEcho = obj.get("value").toString();
//			if (obj.get("name").equals("iDisplayStart"))
//				iDisplayStart = obj.get("value").toString();
//			if (obj.get("name").equals("iDisplayLength"))
//				iDisplayLength = obj.get("value").toString();
//			if (obj.get("name").equals("sSearch"))
//				sSearch = obj.get("value").toString();
//		}
		
		System.out.println(getParaMap());
		
		int sEcho =getParaToInt("sEcho");
	    int start = getParaToInt("iDisplayStart");   // 起始
	    int length = getParaToInt("iDisplayLength"); // 分页大小size 
	    int pageNum =start/length+1;//页码
		Page<SysLog> logPage=SysLog.dao.paginate(pageNum, length);
		setAttr("logPage", logPage);
		
		Map<String, Object> dataMap =new HashMap<String, Object>();
		dataMap.put("iTotalRecords", logPage.getTotalRow());
		dataMap.put("sEcho",sEcho);
		dataMap.put("iTotalDisplayRecords", logPage.getTotalRow());
		dataMap.put("aaData", logPage.getList());
		
		renderJson(dataMap);
	}

	public void view(){
		
	}
	
	public void delete(){
		
	}
}
  