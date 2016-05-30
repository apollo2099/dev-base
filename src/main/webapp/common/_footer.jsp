<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%
String path = request.getContextPath();
// 获得本项目的地址(例如: http://localhost:8080/MyApp/)赋值给basePath变量
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
// 将 "项目路径basePath" 放入pageContext中，待以后用EL表达式读出。
pageContext.setAttribute("basePath",basePath);
%>

<script type="text/javascript" src="${basePath }lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${basePath }lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="${basePath }lib/icheck/jquery.icheck.min.js"></script> 
<script type="text/javascript" src="${basePath }lib/jquery.validation/1.14.0/jquery.validate.min.js"></script>
<script type="text/javascript" src="${basePath }lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="${basePath }lib/jquery.validation/1.14.0/messages_zh.min.js"></script>
<script type="text/javascript" src="${basePath }lib/jquery.form.min.js"></script>
<script type="text/javascript" src="${basePath }static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="${basePath }static/h-ui/js/H-ui.admin.js"></script>  

<script type="text/javascript" src="${basePath }lib/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="${basePath }lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 