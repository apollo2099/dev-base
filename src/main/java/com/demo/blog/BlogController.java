package com.demo.blog;
import java.util.ArrayList;
import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.demo.common.model.Blog;
import com.jfinal.aop.Before;
import com.jfinal.base.common.page.DataTablesModel;
import com.jfinal.base.utils.ObjectUtils;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;

/**
 * BlogController
 * 所有 sql 与业务逻辑写在 Model 或 Service 中，不要写在 Controller 中，养成好习惯，有利于大型项目的开发与维护
 */
@Before(BlogInterceptor.class)
public class BlogController extends Controller {
	public void index() {
		Integer pageNum = getParaToInt("pageNum");
		if (pageNum == null || pageNum == 0) {
			pageNum = 1;
		}
		Page<Blog> blogPage = Blog.me.paginate(pageNum, 10);
		setAttr("blogPage", blogPage);
		render("blog.jsp");
	}
	
	
	public void query(){
        StringBuilder where = new StringBuilder("from blog where 1=1 ");
        List<String> params = new ArrayList<String>();
        if (ObjectUtils.isNotEmpty(getPara("blogTitle"))) {
            where.append("and title like ? ");
            params.add("" + getPara("blogTitle") + "%");
        }
        Integer pageNum = getParaToInt("page");
        if(ObjectUtils.isEmpty(pageNum)){
        	pageNum =1 ;
        }
        Integer pageSize = getParaToInt("rp");
        if (ObjectUtils.isEmpty(pageSize)) {
        	pageSize =20;
		}
        String sqlCommon ="select id,title,content ";
        DataTablesModel dtm = Blog.me.paginateDataTables(pageNum,pageSize,sqlCommon, where.toString(),params.toArray());
		this.renderJson(dtm);
	}
	
	public void add() {
	}
	
	

	
	@Before(BlogValidator.class)
	public void save() {
		getModel(Blog.class).save();
		redirect("/blog");
	}
	
	public void edit() {
		setAttr("blog", Blog.me.findById(getParaToInt()));
	}
	
	@Before(BlogValidator.class)
	public void update() {
		getModel(Blog.class).update();
		redirect("/blog");
	}
	
	public void delete() {
		Blog.me.deleteById(getParaToInt());
		redirect("/blog");
	}
}


