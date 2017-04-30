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
        <h1>${title}</h1>
        <table>
            <tr>
                <td>${text}</td>
            </tr>
        </table>
    </body>
</html>
