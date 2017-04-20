<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    ${sharedHeaderTags}
</head>
<body>
<h1>Login</h1>

<c:if test="${loginFail}">
    <p>Failure!</p>
    <p>${message}</p>
</c:if>

<form action="./session" method="get">
    <input type="hidden" name="identifier" value="${identifier}"/>
    <input type="hidden" name="action" value="login"/>

    <label for="username">Username</label>
    <input id="username" type="text" name="username" value="" placeholder="Username"/>

    <label for="password">Password</label>
    <input id="password" type="password" name="password" value="" placeholder="Password"/>

    <input type="submit" value="Log In"/>
</form>

<form action="./session" method="get">
    <input type="hidden" name="identifier" value="${identifier}"/>
    <input type="hidden" name="action" value="go-to-register"/>

    <p>Don't have an account yet?</p>
    <input type="submit" value="Register"/>
</form>

</body>
</html>