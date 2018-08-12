<%--
  Created by IntelliJ IDEA.
  User: xyy
  Date: 2018/8/8
  Time: 下午5:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.*" contentType="text/html;charset=UTF-8" language="java" %>
<div id="menuContent" style="background-color: #1280f2; color: #FFFFFF; height: 100px;">
    <h1 style="margin-left: 10px; margin-top: 10px;">水果网络销售平台</h1><br/>
    <div style="margin-left: 10px;">
    <a href="${pageContext.request.contextPath}/commodities/list.action">货物管理</a> |
    <a href="${pageContext.request.contextPath}/retailer/list.action?status=-1">零售商管理</a> |
    <a href="${pageContext.request.contextPath}/contract/list.action?type=-1">购销合同</a> |
    <a>用户设置</a>
    </div>
    <div style="background-color: #75D737; height: 25px; width: 100%">
        <span><font color="#FFFFFF" style="float:right; padding-right: 10px;">欢迎您，${sessionScope.user.name}</font></span>
    </div>
</div>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
