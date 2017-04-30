<%@ page import="com.sun.org.apache.xpath.internal.operations.Bool" %>
<!--
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
-->
<html>
    <head>
        <title>Internet Library</title>
        <h1>WELCOME!</h1>
    </head>
    <body>
    <p style="color: red;">${errorLogin}</p>
    <c:choose>
        <c:when test="${userLogin==null}">
            <form method="post">
                <input type="text" name="login"/>
                <input type="text" name="password"/>
                <input type="submit" value="login"/>
            </form>
            <a href="/register">Регистрация</a>
        </c:when>
        <c:otherwise>
            <div style="position: fixed; top: 0%; right: 0;">
                <form action="${pageContext.request.contextPath}/logout" method="post">
                    <input type="submit" value="Logout" />
                </form>
            </div>
            <c:choose>
                <c:when test="${accountType==1}">
                    <a href="/listEntitiesForAdmins">Список произведений и пользователей сайта</a>
                </c:when>
                <c:otherwise>
                    <a href="/listEntitiesForUsers">Список произведений</a>
                </c:otherwise>
            </c:choose>
        </c:otherwise>
    </c:choose>
</html>