/** 
  * Project Name:dev-base 
  * File Name:DataTablesModel.java 
  * Package Name:com.jfinal.base.common.page 
  * Date:2016年6月13日上午11:10:32 
  * Copyright (c) 2016, JuanPi.com All Rights Reserved
  */  
  
package com.jfinal.base.common.page;  
import java.io.Serializable;
import java.util.List;

import com.alibaba.fastjson.JSONObject;
/** 
  * @company:www.juanpi.com
  * @department:架构服务部/JAVA工程师
  * @author huixiong 
  * @date: 2016年6月13日 上午11:10:32 
  * @since:1.0.0
  */

public class DataTablesModel implements Serializable {

	private static final long serialVersionUID = 1L;
	/** * 当前页号 */
	private int page;
	/** * 每页显示记录数 */
	private int rp;
	/** * 总记录数 */
	private int total;
	/** * 返回记录的id数组 */
	private List<String> ids;
	/** * 返回的数据 */
	private List<List<String>> rows;

	public DataTablesModel(int page, int rp, int total, List<String> ids, List<List<String>> rows) {
		this.setPage(page);
		this.setRp(rp);
		this.setTotal(total);
		this.setIds(ids);
		this.setRows(rows);
	}

	/** * @return the page */
	public int getPage() {
		return page;
	}

	/** * @param page * the page to set */
	public void setPage(int page) {
		this.page = page;
	}

	/** * @return the rp */
	public int getRp() {
		return rp;
	}

	/** * @param rp * the rp to set */
	public void setRp(int rp) {
		this.rp = rp;
	}

	/** * @return the total */
	public int getTotal() {
		return total;
	}

	/** * @param total * the total to set */
	public void setTotal(int total) {
		this.total = total;
	}

	public List<String> getIds() {
		return ids;
	}

	public void setIds(List<String> ids) {
		this.ids = ids;
	}

	public List<List<String>> getRows() {
		return rows;
	}

	public void setRows(List<List<String>> rows) {
		this.rows = rows;
	}

	public String toJSONString() {
		return JSONObject.toJSONString(this);
	}
}
  