<%--
  Created by IntelliJ IDEA.
  User: xyy
  Date: 2018/8/9
  Time: 下午8:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>附属品管理</title>
    <style>*{margin: 0; padding: 0;} a{text-decoration: none; color: #FFFFFF}
           .c{
               border-style: solid; border-color: #1280f2; width: 200px; height: 140px;
               display: block; border-radius: 5px;
               margin-top: 4px; margin-right: 23px; margin-bottom: 0px; margin-left: 23px;
               background: #FFFFFF; margin: 10% auto;
           }
        .addAccessoryMask{
            width: 100%;
            height: 100%;
            position: absolute;
            background:rgba(0, 0, 0, .3);
            display: none;
        }
    </style>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript">
        function showAddAccessory(flag) {
            if (flag == "true") {
                $(".addAccessoryMask").css("display", "block");
            } else {
                $(".addAccessoryMask").css("display", "none");
            }
        }
        function deleteAccessory() {
            var myArray = new Array();
            var len = 0;
            var fruitId = document.getElementById("aFruitId").value;
            var arrays = document.getElementsByName("arrays");           // 获取所有 check 选项
            for (var i = 0; i < arrays.length; i++) {
                if (arrays[i].checked) {
                    myArray[len++] = arrays[i].value;
                }
            }
            $.ajax({
                type:'post',
                url:'${pageContext.request.contextPath}/accessory/deleteList.action',
                data:{"arrays":myArray, "fruitId":fruitId},     // 数据为 id 数组
                traditional:true,
                success:function (data) {   // 成功后刷新页面
                    alert("删除成功！");
                    location.reload();
                }
            });
        }
        function checkAll(obj) {
            var isCheck = obj.checked;
            var checkList = document.getElementsByName("arrays");        // 获取所有 check 选项
            for (var i = 0; i < checkList.length; i++) {
                checkList[i].checked = isCheck;
            }
        }
        function checkAddAccessory() {
            if ($("#addAccessoryName").val() == null || $("#addAccessoryName").val() == "") {
                alert("附属品名称不能为空！");
                return false;
            }
            if ($("#addAccessoryPrice").val() == null || $("#addAccessoryPrice").val() == "") {
                alert("附属品价格不能为空！");
                return false;
            }
            if ($("#addAccessoryPrice").val() <= 0) {
                alert("附属品价格输入有误！");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <div class="addAccessoryMask">
        <div class="c">
            <div style="background-color: #1280f2; height: 20px; color: #FFFFFF; font-size: 12px; padding-left: 7px;">
                添加附属品信息
                <font style="float: right; padding-right: 10px;" onclick="showAddAccessory('false')">x</font>
            </div>
            <form action="/accessory/add.action" id="addAccessoryForm" method="post" onsubmit="return checkAddAccessory()">
                名称：<input type="text" id="addAccessoryName" name="name" style="width: 120px"/><br/>
                价格：<input type="text" name="price" id="addAccessoryPrice" style="width: 120px"/><br/>
                <input type="hidden" id="aFruitId" name="fruitId" value="${fruitId}"/>
                <input type="submit" value="添加" style="background-color: #1280f2; color: #FFFFFF; width: 70px;"/>
            </form>
        </div>
    </div>
    <button onclick="showAddAccessory('true')" style="background-color: #1280f2; color: #FFFFFF; width: 70px;"/>添加</button>
    <button onclick="deleteAccessory()" style="background-color: #1280f2; color:#FFFFFF; width: 70px;">删除</button>
<c:if test="${list!=null}">
    <table style="margin-top: 10px; width: 400px; text-align: center;" border="1">
        <tr>
            <td><input type="checkbox" onclick="checkAll(this)"/></td>
            <td>名称</td><td>价格</td>
            <td>创建日期</td>
        </tr>
        <c:forEach items="${list}" var="item" varStatus="status">
            <tr>
                <td><input type="checkbox" name="arrays" value="${item.accessoryId}"></td>
                <td>${item.name}</td><td>${item.price}</td>
                <td>${item.createTime}</td>
            </tr>
        </c:forEach>
    </table>
</c:if>
<c:if test="${list==null}">
    <br/><b>结果为空！</b>
</c:if>
</body>
</html>
