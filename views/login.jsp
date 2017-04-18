<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Login</h1>

<form action="./" method="get">
    <input type="hidden" name="identifier" value="${identifier}"/>
    <input type="hidden" name="action" value="login"/>

    <label for="username">Username</label>
    <input id="username" type="text" name="username" value="" placeholder="Username"/>

    <label for="password">Password</label>
    <input id="password" type="password" name="password" value="" placeholder="Password"/>

    <input type="submit" value="Log In"/>
</form>

<form action="./" method="get">
    <input type="hidden" name="identifier" value="${identifier}"/>
    <input type="hidden" name="action" value="go-to-register"/>

    <p>Don't have an account yet?</p>
    <input type="submit" value="Register"/>
</form>

</body>
</html>