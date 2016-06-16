<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
<jsp:include page="/common/_meta.jsp"></jsp:include>
<title>用户查看</title>
</head>
<body>
<div class="pd-20">
  <table class="table">
    <tbody>
      <tr>
        <th class="text-r" width="80">编号：</th>
        <td>${sysLog.id}</td>
      </tr>
      <tr>
        <th class="text-r">日志类型：</th>
        <td>${sysLog.type}</td>
      </tr>
      <tr>
        <th class="text-r">日志标题：</th>
        <td>${sysLog.title}</td>
      </tr>
      <tr>
        <th class="text-r">创建者：</th>
        <td>${sysLog.createBy}</td>
      </tr>
      <tr>
        <th class="text-r">创建时间：</th>
        <td>${sysLog.createDate}</td>
      </tr>
      <tr>
        <th class="text-r">操作IP地址：</th>
        <td>${sysLog.remoteAddr}</td>
      </tr>
      <tr>
        <th class="text-r">用户代理：</th>
        <td>${sysLog.userAgent}</td>
      </tr>
      <tr>
        <th class="text-r">请求URI：</th>
        <td>${sysLog.requestUri}</td>
      </tr>
      <tr>
        <th class="text-r">操作方式：</th>
        <td>${sysLog.method}</td>
      </tr>
      <tr>
        <th class="text-r">操作提交的数据：</th>
        <td>${sysLog.params}</td>
      </tr>
      <tr>
        <th class="text-r">异常信息：</th>
        <td>${sysLog.exception}</td>
      </tr>
    </tbody>
  </table>
</div>
<!-- 底部文件 -->
<jsp:include page="/common/_footer.jsp"></jsp:include>
</body>
</html>