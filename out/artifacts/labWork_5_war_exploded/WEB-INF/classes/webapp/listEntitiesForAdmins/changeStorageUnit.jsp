<!--
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
-->
<html>
    <head>
    </head>
    <body>
        <div style="position: fixed; top: 0%; right: 0;">
            <form action="${pageContext.request.contextPath}/logout" method="post">
                <input type="submit" value="Logout" />
            </form>
        </div>
        <h1>Изменение единицы хранения</h1>
        <form method="post">
            <p>Автор текста:</p>
            <p style="color: red;">${changeAuthor}</p>
            <input type="text" name="author" value="${author}"/>
            <p>Название текста:</p>
            <p style="color: red;">${changeTitle}</p>
            <input type="text" name="title"  value="${title}"/>
            <p>Издательство:</p>
            <p style="color: red;">${changePublishingHouse}</p>
            <input type="text" name="publishingHouse" value="${publishingHouse}"/>
            <p>Город:</p>
            <p style="color: red;">${changeCity}</p>
            <input type="text" name="city" value="${city}"/>
            <p>Год:</p>
            <p style="color: red;">${changeYear}</p>
            <input type="text" name="year" value="${year}"/>
            <p>Количество страниц:</p>
            <p style="color: red;">${changePagesCount}</p>
            <input type="text" name="pagesCount" value="${pagesCount}"/>
            <p>ISN:</p>
            <p style="color: red;">${changeIsn}</p>
            <input type="text" name="isnNew" value="${isn}"/>
            <p>Текст:</p>
            <p style="color: red;">${changeText}</p>
            <input type="text" name="text" value="${text}"/>
            <input type="hidden" name="isnOld" value="${isn}"/>
            <p></p>
            <input type="submit" value="ok"/>
            <input type="button" value="back to list" onclick="location.href = '${pageContext.request.contextPath}/listEntitiesForAdmins'">
        </form>
    </body>
</html>