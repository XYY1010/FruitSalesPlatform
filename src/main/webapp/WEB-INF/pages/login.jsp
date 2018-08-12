<%--
  Created by IntelliJ IDEA.
  User: xyy
  Date: 2018/8/8
  Time: 上午9:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>登录</title>
    <link href="${pageContext.request.contextPath}/css/regcss.css" type="text/css" rel="stylesheet">
    <script type="text/javascript">
        function validate() {
            if (document.getElementById("username").value == "") {
                alert("用户名不能为空");
                document.getElementById("username").focus();
                return false
            } else if (document.getElementById("password").value == "") {
                alert("密码不能为空");
                document.getElementById("password").focus();
                return false
            }
            return true;
        }
    </script>
</head>
<body>
    <div id="content">
        <div id = "form">
            <h1>用户登录</h1> <br/>
            <form action="login.action" method="post" id="myform" onsubmit="return validate()">
                用户名<input type="text" id="username" name="userName" style="width: 190px; height: 26px; margin-left: 39px;"/><br/>
                密码<input type="password" id="password" name="password" style="width: 190px; height: 26px; margin-top: 8px; margin-left: 54px;"/><br/>
                <input type="submit" value="登录" style="width: 50px; height: 30px; margin-top: 8px;"/>
                <a href="registerPage.action" style="margin-left: 150px; margin-top: 10px;">注册</a>
            </form>
            <!-- 显示错误信息 -->
            <c:if test="${errorMsg!=null}"><font color="red">${errorMsg}</font> </c:if>
            <!-- 显示提示 -->
            <c:if test="${noticeMsg!=null}"><font color="green">${noticeMsg}</font> </c:if>
        </div>
    </div>
</body>
</html>
