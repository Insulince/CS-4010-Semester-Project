<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <c:choose>
        <c:when test="${registered}">
            <title>Registration Successful</title>
        </c:when>
        <c:otherwise>
            <title>Registration Failed</title>
        </c:otherwise>
    </c:choose>
</head>
<body>
<c:choose>
    <c:when test="${registered}">
        <h1>Registration Successful!</h1>
        <p>${message}</p>
        <form action="./" method="get">
            <input type="hidden" name="identifier" value="${identifier}"/>
            <input type="hidden" name="action" value="go-to-login"/>

            <input type="submit" value="Go to Login"/>
        </form>
    </c:when>
    <c:otherwise>
        <h1>Registration Failed!</h1>
        <p>${message}</p>
        <form action="./" method="get">
            <input type="hidden" name="identifier" value="${identifier}"/>
            <input type="hidden" name="action" value="go-to-register"/>

            <input type="submit" value="Try Again"/>
        </form>
        <form action="./" method="get">
            <input type="hidden" name="identifier" value="${identifier}"/>
            <input type="hidden" name="action" value="go-to-login"/>

            <input type="submit" value="Go to Login">
        </form>
    </c:otherwise>
</c:choose>
</body>
</html>