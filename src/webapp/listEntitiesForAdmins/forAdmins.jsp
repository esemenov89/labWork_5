<!--
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
-->
<html>
    <head>
        <title>List of books</title>
    </head>
    <body>
        <div style="position: fixed; top: 0%; right: 0;">
            <form action="${pageContext.request.contextPath}/logout" method="post">
                <input type="submit" value="Logout" />
            </form>
        </div>
        <h1>Список произведений:</h1>
        <table>
            <td><input type="button" value="add" onclick="location.href = '${pageContext.request.contextPath}${currentURL}/addStorageUnit'"></td>
            <c:forEach items="${requestScope.books}" var="book">
                <tr>
                    <td><c:out value="${book.author}"></c:out></td>
                    <td><c:out value="${book.title}"></c:out></td>
                    <td><c:out value="${book.publishingHouse}"></c:out></td>
                    <td><c:out value="${book.city}"></c:out></td>
                    <td><c:out value="${book.year}"></c:out></td>
                    <td><c:out value="${book.pagesCount}"></c:out></td>
                    <td><c:out value="${book.isn}"></c:out></td>
                    <td>
                        <input type="button" value="read" onclick="location.href = '${pageContext.request.contextPath}${currentURL}/readStorageUnit?isn=<c:out value="${book.isn}" />'">
                        <input type="button" value="change" onclick="location.href = '${pageContext.request.contextPath}${currentURL}/changeStorageUnit?isn=<c:out value="${book.isn}" />'">
                        <input type="button" value="del" onclick="location.href = '${pageContext.request.contextPath}${currentURL}/deleteStorageUnit?isn=<c:out value="${book.isn}" />'">
                    </td>
                </tr>
            </c:forEach>
        </table>
        <p></p>
        <h1>Список пользователей:</h1>
        <table>
            <c:forEach items="${requestScope.users}" var="user">
                <tr>
                    <td><c:out value="${user.login}"></c:out></td>
                    <td><c:out value="${user.accountType=='0' ? 'User' : 'Admin'}"></c:out></td>
                    <c:choose>
                        <c:when test="${user.locked=='0'}">
                            <td><p>Not locked</p></td>
                            <c:if test="${user.accountType=='0'}">
                                <td>
                                    <input type="button" value="lock" onclick="location.href = '${pageContext.request.contextPath}${currentURL}/lockOrUnlock?nick=<c:out value="${user.login}"/>&lock=<c:out value="${user.locked}"/>'">
                                </td>
                            </c:if>
                        </c:when>
                        <c:otherwise>
                            <td><p>Locked</p></td>
                            <c:if test="${user.accountType=='0'}">
                                <td>
                                    <input type="button" value="unlock" onclick="location.href = '${pageContext.request.contextPath}${currentURL}/lockOrUnlock?nick=<c:out value="${user.login}"/>&lock=<c:out value="${user.locked}"/>'">
                                </td>
                            </c:if>
                        </c:otherwise>
                    </c:choose>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>