<html>
<head>
    <title>Register</title>
    ${sharedHeaderTags}
</head>
<body>
<h1>Register for a new Account!</h1>
<form action="./session" method="get">
    <input type="hidden" name="identifier" value="${identifier}"/>
    <input type="hidden" name="action" value="register"/>

    <label for="username">Username</label>
    <input id="username" type="text" name="username" value="" placeholder="Username"/>

    <label for="password">Password</label>
    <input id="password" type="password" name="password" value="" placeholder="Password"/>

    <label for="email">Email</label>
    <input id="email" type="email" name="email" value="" placeholder="johndoe@email.com"/>

    <input type="submit" value="Register"/>
</form>
</body>
</html>