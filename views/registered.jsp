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
    <form action="./" method="get">
        <input type="hidden" name="identifier" value="${identifier}"/>
        <input type="hidden" name="userIdentifier" value="${user.identifier}"/>
        <input type="hidden" name="action" value="go-to-home"/>
        <a href='#' onclick='this.parentNode.submit(); return false;'>
            <h1 id="title">J<sup>3</sup></h1>
        </a>
    </form>
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <form action="./" method="get">
                    <input type="hidden" name="identifier" value="${identifier}"/>
                    <input type="hidden" name="userIdentifier" value="${user.identifier}"/>
                    <input type="hidden" name="action" value="go-to-store"/>

                    <input class="nav-button btn btn-primary" type="submit" value="Store" disabled/>
                </form>
            </div>
            <div class="col-md-3">
                <form action="./" method="get">
                    <input type="hidden" name="identifier" value="${identifier}"/>
                    <input type="hidden" name="userIdentifier" value="${user.identifier}"/>
                    <input type="hidden" name="action" value="random"/>

                    <input class="nav-button btn btn-primary" type="submit" value="Random Item" disabled/>
                </form>
            </div>
            <div class="col-md-3">
                <form action="./" method="get">
                    <input type="hidden" name="identifier" value="${identifier}"/>
                    <input type="hidden" name="userIdentifier" value="${user.identifier}"/>
                    <input type="hidden" name="action" value="go-to-my-cart"/>

                    <input class="nav-button btn btn-primary" type="submit" value="My Cart" disabled/>
                </form>
            </div>
            <div class="col-md-3">
                <form action="./" method="get">
                    <input type="hidden" name="identifier" value="${identifier}"/>
                    <input type="hidden" name="userIdentifier" value="${user.identifier}"/>
                    <input type="hidden" name="action" value="go-to-my-account"/>

                    <input class="nav-button btn btn-primary" type="submit" value="My Account" disabled/>
                </form>
            </div>
        </div>
    </div>
</div>

<c:choose>
    <c:when test="${registered}">
        <h1 id="page-title">Registration Successful!</h1>
        <p>${message}</p>
        <form action="./" method="get">
            <input type="hidden" name="identifier" value="${identifier}"/>
            <input type="hidden" name="action" value="go-to-login"/>

            <input type="submit" value="Go to Login"/>
        </form>
    </c:when>
    <c:otherwise>
        <h1 id="page-title">Registration Failed!</h1>
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