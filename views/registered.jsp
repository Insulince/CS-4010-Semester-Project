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
    ${sharedHeaderTags}
</head>
<body>
<div id="nav">
    <h1 id="title">J<sup>3</sup></h1>
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <form "./" method="get">
                    <input type="hidden" name="identifier" value="${identifier}"/>
                    <input type="hidden" name="userIdentifier" value="${user.identifier}"/>
                    <input type="hidden" name="action" value="go-to-home"/>

                    <input class="nav-button btn btn-default" type="submit" value="Home"/>
                </form>
            </div>
            <div class="col-md-3">
                <form "./" method="get">
                    <input type="hidden" name="identifier" value="${identifier}"/>
                    <input type="hidden" name="userIdentifier" value="${user.identifier}"/>
                    <input type="hidden" name="action" value="go-to-store"/>

                    <input class="nav-button btn btn-default" type="submit" value="Store"/>
                </form>
            </div>
            <div class="col-md-3">
                <form "./" method="get">
                    <input type="hidden" name="identifier" value="${identifier}"/>
                    <input type="hidden" name="userIdentifier" value="${user.identifier}"/>
                    <input type="hidden" name="action" value="random"/>

                    <input class="nav-button btn btn-default" type="submit" value="Random"/>
                </form>
            </div>
            <div class="col-md-3">
                <form "./" method="get">
                    <input type="hidden" name="identifier" value="${identifier}"/>
                    <input type="hidden" name="userIdentifier" value="${user.identifier}"/>
                    <input type="hidden" name="action" value="go-to-my-account"/>

                    <input class="nav-button btn btn-default" type="submit" value="My Account"/>
                </form>
            </div>
        </div>
    </div>
</div>
<c:choose>
    <c:when test="${registered}">
        <h1>Registration Successful!</h1>
        <p>${message}</p>
        <form "./" method="get">
            <input type="hidden" name="identifier" value="${identifier}"/>
            <input type="hidden" name="action" value="go-to-login"/>

            <input type="submit" value="Go to Login"/>
        </form>
    </c:when>
    <c:otherwise>
        <h1>Registration Failed!</h1>
        <p>${message}</p>
        <form "./" method="get">
            <input type="hidden" name="identifier" value="${identifier}"/>
            <input type="hidden" name="action" value="go-to-register"/>

            <input type="submit" value="Try Again"/>
        </form>
        <form "./" method="get">
            <input type="hidden" name="identifier" value="${identifier}"/>
            <input type="hidden" name="action" value="go-to-login"/>

            <input type="submit" value="Go to Login">
        </form>
    </c:otherwise>
</c:choose>
</body>
</html>