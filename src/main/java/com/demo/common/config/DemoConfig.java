package com.demo.common.config;

import com.demo.blog.BlogController;
import com.demo.index.IndexController;
import com.jfinal.base.common.model._MappingKit;
import com.jfinal.base.module.sys.menu.contraller.SysMenuController;
import com.jfinal.base.module.sys.role.contraller.SysRoleController;
import com.jfinal.base.module.sys.user.contraller.SysUserController;
import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.core.JFinal;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.render.ViewType;

/**
 * API引导式配置
 */
public class DemoConfig extends JFinalConfig {
	
	/**
	 * 配置常量
	 */
	public void configConstant(Constants me) {
		// 加载少量必要配置，随后可用PropKit.get(...)获取值
		PropKit.use("a_little_config.txt");
		me.setDevMode(PropKit.getBoolean("devMode", false));
		me.setViewType(ViewType.JSP);
	}
	
	/**
	 * 配置路由
	 */
	public void configRoute(Routes me) {
		me.add("/", IndexController.class);	// 第三个参数为该Controller的视图存放路径
		me.add("/blog", BlogController.class);			
		me.add("/sys/sysuser", SysUserController.class,"/sys/sysuser");
		me.add("/sys/sysmenu", SysMenuController.class,"/sys/sysmenu");
		me.add("/sys/sysrole", SysRoleController.class,"/sys/sysrole");
		//me.add(controllerKey, controllerClass, viewPath)
	}
	
	public static C3p0Plugin createC3p0Plugin() {
		return new C3p0Plugin(PropKit.get("jdbcUrl"), PropKit.get("user"), PropKit.get("password").trim());
	}
	
	/**
	 * 配置插件
	 */
	public void configPlugin(Plugins me) {
		// 配置C3p0数据库连接池插件
		C3p0Plugin C3p0Plugin = createC3p0Plugin();
		me.add(C3p0Plugin);
		
		// 配置ActiveRecord插件
		ActiveRecordPlugin arp = new ActiveRecordPlugin(C3p0Plugin);
		me.add(arp);
		
		// 所有配置在 MappingKit 中搞定
		_MappingKit.mapping(arp);
	}
	
	/**
	 * 配置全局拦截器
	 */
	public void configInterceptor(Interceptors me) {
		
	}
	
	/**
	 * 配置处理器
	 */
	public void configHandler(Handlers me) {
		
	}
	
	/**
	 * 建议使用 JFinal 手册推荐的方式启动项目
	 * 运行此 main 方法可以启动项目，此main方法可以放置在任意的Class类定义中，不一定要放于此
	 */
	public static void main(String[] args) {
//		JFinal.start("WebRoot", 80, "/", 5);//传统项目集成方式启动
		JFinal.start("src/main/webapp", 8080, "/", 5);//maven集成方式启动
	}
}
