<%--
  Created by IntelliJ IDEA.
  User: xyy
  Date: 2018/8/8
  Time: 下午8:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>零售商管理</title>
    <style>*{margin: 0;padding: 0;} #menuContent a{text-decoration: none; color: #FFFFFF}
           .c{
               border-style: solid; border-color: #1280f2; width: 200px; height: 140px;
               display: block; border-radius: 5px;
               margin-top: 4px; margin-right: 23px; margin-bottom: 0px; margin-left: 23px;
               background: #FFFFFF; margin: 10% auto;
           }
        .mask, .addMask{
            width: 100%; height: 100%;
            position: absolute; background: rgba(0, 0, 0, .3);
            display: none;
        }
    </style>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript">
        function changeStatus() {
            var status = document.getElementById("indexStatus").value;
            document.getElementById("status").value=status;
        }
        function init() {
            var countNumber = document.getElementById("countNumber").value;
            var sumPage = document.getElementById("sumPageNumber").value;
            var currentPage = document.getElementById("currentPage").value;
            var Info = "一共<font color='blue'>"+countNumber+"</font>条数据，" +
                    "共<font color='blue'>"+sumPage+"</font>页，" +
                    "现在是第<font color='blue'>"+currentPage+"</font>页";
            document.getElementById("pageInfo").innerHTML=Info;
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
                alert("数据已到底！");
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
            if (pageNumber==null||pageNumber=="") {
                alert("请输入要跳转的页数！");
            } else {
                pageNumber = parseInt(pageNumber);
                var sumPage = parseInt(document.getElementById("sumPageNumber").value);
                if (pageNumber < 1) {
                    alert("数据已经到顶！");
                } else if (pageNumber > sumPage) {
                    alert("数据已经到底！");
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
        function editRetailer(id) {
            var message = "{'id':'" + id + "'}";
            $.ajax({
                type:'post',
                url:'${pageContext.request.contextPath}/retailer/editRetailer.action',
                contentType:'application/json;charset=utf-8',
                data:message,   // 数据格式是 Json 串
                success:function (data) {   // 返回 Json 结果
                    $("#editName").val(data["name"]);
                    $("#editTelephone").val(data["telephone"]);
                    $("#editAddress").val(data["address"]);
                    $("#retailerId").val(data["retailerId"]);
                    $("#editStatus").val(data["status"]);
                    $("#eStatus").val(data["status"]);
                    // 显示弹窗
                    $(".mask").css("display", "block");
                    // 引入分页信息至 form 表单
                    $("#eStartPage").val($("#startPage").val());
                    $("#eCurrentPage").val($("#currentPage").val());
                    $("#ePageSize").val($("#pageSize").val());
                }
            });
        }
        function cancelEdit() {
            $(".mask").css("display", "none");
        }
        function changeEditStatus() {
            var status = document.getElementById("eStatus").value;
            document.getElementById("editStatus").value = status;
        }
        function deleteRetailer(id) {
            if (window.confirm("您确定要删除零售商"+ name +"吗？")) {
                $("#dRetailerId").val(id);          // 向 form 中引入 id
                // 引入分页信息至该 form 表单
                $("#dStartPage").val($("#startPage").val());
                $("#dCurrentPage").val($("#currentPage").val());
                $("#dPageSize").val($("#pageSize").val());
                $("#deleteForm").submit();      // 提交表单
            }
        }
        function showAddMask(flag) {
            if (flag == 'true') {
                $(".addMask").css("display", "block");
            } else {
                $(".addMask").css("display", "none");
            }
        }
        function checkAddRetailer() {
            if ($("#addName").val() == null || $("#addName").val() == "") {
                alert("用户名不能为空！");
                return false;
            }
            if ($("#addTelephone").val() == null || $("#addTelephone") == "") {
                alert("手机号不能为空！");
                return false;
            }
            var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
            if (!myreg.test($("#addTelephone").val())) {
                alert("请输入有效的手机号码！");
                return false;
            }
            if ($("#addAddress").val() == null || $("#addAddress").val() == "") {
                alert("地址不能为空！");
                return false;
            }
            return true;
        }
    </script>
</head>
<body onload="init()">
    <%@include file="../menu.jsp"%><br/>
    <div class="addMask">
        <div class="c">
            <div style="background-color: #1280f2; height: 20px; color: #FFFFFF; font-size: 12px; padding-left: 7px">
                添加信息
                <font style="float: right; padding-right: 10px;" onclick="showAddMask('false')">x</font>
            </div>
            <form action="/retailer/add.action" id="addForm" method="post" onsubmit="return checkAddRetailer()">
                姓名：<input type="text" id="addName" name="name" style="width: 120px;"/><br/>
                手机：<input type="text" id="addTelephone" name="telephone" style="width: 120px;"/><br/>
                地址：<input type="text" id="addAddress" name="address" style="width: 120px;"/><br/>
                <input type="hidden" name="status" value="1"/>
                <input type="submit" value="添加" style="background-color: #1280f2; color: #FFFFFF; width: 70px"/>
            </form>
        </div>
    </div>
    <div class="mask">
        <div class="c">
            <div style="background-color: #1280f2; height: 20px; color: #FFFFFF; font-size: 12px; padding-left: 7px;">
                修改信息<font style="float: right; padding-right: 10px;" onclick="cancelEdit()">x</font>
            </div>
            <form action="/retailer/edit.action" method="post" id="editForm">
                姓名：<input type="text" id="editName" name="name" style="width: 120px"/><br/>
                手机：<input type="text" id="editTelephone" name="telephone" style="width: 120px"/><br/>
                地址：<input type="text" id="editAddress" name="address" style="width: 120px"/><br/>
                状态：<select id="eStatus" onchange="changeEditStatus()">
                <option value="1">启用</option>
                <option value="0">停用</option>
            </select><br/>
                <input type="hidden" name="retailerId" id="retailerId"/>
                <input type="hidden" name="status" id="editStatus"/>
                <input type="hidden" name="startPage" id="eStartPage"/>
                <input type="hidden" name="currentPage" id="eCurrentPage"/>
                <input type="hidden" name="pageSize" id="ePageSize"/>
                <input type="submit" value="提交" style="background-color: #1280f2; color: #FFFFFF; width: 70px"/>
            </form>
        </div>
    </div>
    <form id="listForm" action="/retailer/list.action" method="post">
        姓名：<input type="text" name="name" style="width: 120px"/>
        手机：<input type="text" name="telephone" style="width: 120px"/>
        地址：<input type="text" name="address" style="width: 120px"/><br/><br/>
        状态：<select id="indexStatus" onchange="changeStatus()">
        <option value="-1" selected="selected">全部</option>
        <option value="1">启用</option>
        <option value="0">停用</option>
    </select>
        <input type="hidden" name="status" id="status" value="-1">
        创建日期：<input type="text" name="createTime"/>
        <input type="submit" value="搜索" style="background-color: #1280f2; color: #FFFFFF; width: 70px;"/><br/>
        <!-- 显示错误信息 -->
        <c:if test="${errorMsg!=null}">
            <font color="red">${errorMsg}</font><br/>
        </c:if>
        <input type="hidden" name="startPage" id="startPage" value="${startPage}"/>
        <input type="hidden" name="currentPage" id="currentPage" value="${currentPage}">
        <input type="hidden" name="pageSize" id="pageSize" value="${pageSize}"/>
        <input type="hidden" name="sumPageNumber" id="sumPageNumber" value="${sumPageNumber}">
        <input type="hidden" name="countNumber" id="countNumber" value="${countNumber}">
    </form>
    <hr style="margin-top: 10px;"/>
    <button onclick="showAddMask('true')" style="background-color: #1280f2; color: #FFFFFF; width: 70px;">添加</button>
    <c:if test="${list!=null}">
        <table style="margin-top: 10px; width: 700px; text-align:center;" border="1">
            <tr>
                <td>序号</td><td>姓名</td><td>手机号</td><td>地址</td>
                <td>状态</td><td>创建日期</td><td>操作</td>
            </tr>
            <c:forEach items="${list}" var="item" varStatus="status">
                <tr>
                    <td>${status.index+1}</td><td>${item.name}</td>
                    <td>${item.telephone}</td><td>${item.address}</td>
                    <td>
                        <c:if test="${item.status==1}">
                            <font color="blue">启用</font>
                        </c:if>
                        <c:if test="${item.status==0}">
                            <font color="red">停用</font>
                        </c:if>
                    </td>
                    <td>${item.createTime}</td>
                    <td><a onclick="editRetailer('${item.retailerId}')">编辑</a> | <a onclick="deleteRetailer('${item.retailerId}', '${item.name}')">删除</a>
                        <form action="/retailer/delete.action" id="deleteForm" method="post">
                            <input type="hidden" name="retailerId" id="dRetailerId"/>
                            <input type="hidden" name="startPage" id="dStartPage"/>
                            <input type="hidden" name="currentPage" id="dCurrentPage"/>
                            <input type="hidden" name="pageSize" id="dPageSize"/>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
<c:if test="${list==null}">
    <b>搜索结果为空！</b>
</c:if>
<div style="margin-top: 10px;">
    <a onclick="toPrePage()">上一页</a> | <a onclick="toNextPage()">下一页</a>
    <input type="text" id="pageNumber" style="width: 50px"><button onclick="toLocationPage()">go</button>
    <div id="pageInfo"></div>
</div>
</body>
</html>
