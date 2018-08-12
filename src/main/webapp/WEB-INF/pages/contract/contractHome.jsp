<%--
  Created by IntelliJ IDEA.
  User: xyy
  Date: 2018/8/10
  Time: 下午3:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>购销合同管理</title>
    <style>*{margin: 0; padding: 0;} #menuContent a{text-decoration: none; color: #FFFFFF}</style>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript">
        function addContract() {
            var url = "${pageContext.request.contextPath}/contract/toAddPage.action";
            window.open(url, "创建合同", "height=700, width=700, scrollbars=yes");
        }
        function init() {
            var countNumber = document.getElementById("countNumber").value;
            var sumPage = document.getElementById("sumPageNumber").value;
            var currentPage = document.getElementById("currentPage").value;
            var info = "一共<font color='blue'>" + countNumber + "</font>条数据，" +
                    "共<font color='blue'>" + sumPage + "<font>页，" +
                "现在是第<font color='blue'>" + currentPage + "<font>页";
            document.getElementById("pageInfo").innerHTML=info;
        }
        function toPrePage() {
            var currentPageObject = document.getElementById("currentPage");
            var currentPage = parseInt(currentPageObject.value);
            if (currentPage == 1) {
                alert("数据已经到顶了！");
            } else {
                currentPageObject.value = currentPage - 1;
                var pageSize = parseInt(document.getElementById("pageSize").value);
                var startPageObject = document.getElementById("startPage");
                startPageObject.value = parseInt(startPageObject.value) - pageSize;
                document.getElementById("listForm").submit();
            }
        }
        function toNextPage() {
            var currentPageObject = document.getElementById("currentPage");
            var currentPage = parseInt(currentPageObject.value);
            var sumPage = parseInt(document.getElementById("sumPageNumber").value);
            if (currentPage >= sumPage) {
                alert("数据已经到底了！");
            } else {
                currentPageObject.value = currentPage + 1;
                var pageSize = parseInt(document.getElementById("pageSize").value);
                var startPageObject = document.getElementById("startPage");
                startPageObject.value = parseInt(startPageObject.value) + pageSize;
                document.getElementById("listForm").submit();
            }
        }
        function toLocationPage() {
            var pageNumber = document.getElementById("pageNumber").value;
            var currentPageObject = document.getElementById("currentPage");
            var currentPage = parseInt(currentPageObject.value);
            if (pageNumber == null || pageNumber == "") {
                alert("请输入要跳转的页数! ");
            } else {
                pageNumber = parseInt(pageNumber);
                var sumPage = parseInt(document.getElementById("sumPageNumber").value);
                if (pageNumber < 1) {
                    alert("数据已经到顶了！");
                } else if (pageNumber > sumPage) {
                    alert("数据已经到底了！");
                } else {
                    currentPageObject.value = pageNumber;
                    var pageSize = parseInt(document.getElementById("pageSize").value);
                    var startPageObject = document.getElementById("startPage");
                    if (pageNumber > currentPage) {
                        startPageObject.value = parseInt(startPageObject.value) + pageSize;
                    } else if (pageNumber < currentPage) {
                        startPageObject.value = parseInt(startPageObject.value) - pageSize;
                    }
                    document.getElementById("listForm").submit();
                }
            }
        }
        function getContractDetail(contractId) {
            var url = "${pageContext.request.contextPath}/contract/getContractDetail.action?contractId=" + contractId;
            window.open(url, "合同详情", "height=700, width=700, scrollbar=yes");
        }
        function deleteContract(contractId, barCode) {
            if (window.confirm("您确定要删除编号为" + barCode + "的合同信息吗?")) {
                $("#dContractId").val(contractId);              // 向 form 引入 id
                // 引入分页信息至该 form 表单
                $("#dStartPage").val($("#startPage").val());
                $("#dCurrentPage").val($("#currentPage").val());
                $("#dStartPage").val($("#startPage").val());
                $("#dPageSize").val($("#pageSize").val());
                $("#deleteForm").submit();      // 提交表单
            }
        }
    </script>
</head>
<body onload="init()">
    <%@ include file="../menu.jsp"%><br/>
    <form action="/contract/list.action" id="listForm" method="post">
        合同号：<input type="text" name="barCode" style="width: 120px;"/>
        零售商：<input type="text" name="retailerName" style="width: 120px;"/>
        类型：<select id="indexType" onchange="">
                <option value="-1" selected="selected">全部</option>
                <option value="1">省外</option>
                <option value="0">省内</option>
             </select>
        <input type="hidden" name="type" id="type" value="-1"/> <br/><br/>
        创建日期：<input type="datetime-local" name="startTime" value="${startTime}"/>
        - <input type="datetime-local" name="endTime" value="${endTime}"/>
        <input type="submit" value="搜索" style="background-color: #1280f2; color: #FFFFFF; width: 70px;"/><br/>
        <!-- 显示错误信息 -->
        <c:if test="${errorMsg!=null}">
            <font color="red">${errorMsg}</font><br/>
        </c:if>
        <input type="hidden" name="startPage" id="startPage" value="${startPage}"/>
        <input type="hidden" name="currentPage" id="currentPage" value="${currentPage}"/>
        <input type="hidden" name="pageSize" id="pageSize" value="${pageSize}"/>
        <input type="hidden" name="sumPageNumber" id="sumPageNumber" value="${sumPageNumber}"/>
        <input type="hidden" name="countNumber" id="countNumber" value="${countNumber}"/>
    </form>
    <hr style="margin-top: 10px;"/>
    <button onclick="addContract()" style="background-color: #1280f2; color: #FFFFFF; width: 70px;">添加</button>
    <c:if test="${list!=null}">
        <table style="margin-top: 10px; width: 700px; text-align: center;" border="1">
            <tr>
                <td>序号</td><td>合同编号</td><td>零售商</td>
                <td>类型</td><td>创建日期</td><td>操作</td>
            </tr>
            <c:forEach items="${list}" var="item" varStatus="status">
                <tr>
                    <td>${status.index+1}</td>
                    <td><a href="#" onclick="getContractDetail('${item.contractId}')">${item.barCode}</a></td>
                    <td>${item.retailerName}</td>
                    <td>
                        <c:if test="${item.type == 1}"><font color="blue">省外</font></c:if>
                        <c:if test="${item.type == 0}"><font color="green">省内</font></c:if>
                    </td>
                    <td>${item.createTime}</td>
                    <td>
                        <a>编辑</a> | <a onclick="deleteContract('${item.contractId}', '${item.barCode}')">删除</a>
                        <form id="deleteForm" action="/contract/delete.action" method="post">
                            <input type="hidden" name="contractId" id="dContractId"/>
                            <input type="hidden" name="startPage" id="dStartPage"/>
                            <input type="hidden" name="currentPage" id="dCurrentPage"/>
                            <input type="hidden" name="pageSize" id="dPageSize"/>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
<c:if test="${list==null}"><br/><b>搜索结果为空！</b></c:if>
<div style="margin-top: 10px;">
    <a onclick="toPrePage()">上一页</a> | <a onclick="toNextPage()">下一页</a>
    <input type="text" id="pageNumber" style="width: 50px;">
    <button onclick="toLocationPage()">go</button>
    <div id="pageInfo"></div>
</div>
</body>
</html>
