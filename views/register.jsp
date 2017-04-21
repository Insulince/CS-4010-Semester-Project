<html>
<head>
    <title>Register</title>
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

                    <input class="nav-button btn btn-default" type="submit" value="Store"/>
                </form>
            </div>
            <div class="col-md-3">
                <form action="./" method="get">
                    <input type="hidden" name="identifier" value="${identifier}"/>
                    <input type="hidden" name="userIdentifier" value="${user.identifier}"/>
                    <input type="hidden" name="action" value="random"/>

                    <input class="nav-button btn btn-default" type="submit" value="Random Item"/>
                </form>
            </div>
            <div class="col-md-3">
                <form action="./" method="get">
                    <input type="hidden" name="identifier" value="${identifier}"/>
                    <input type="hidden" name="userIdentifier" value="${user.identifier}"/>
                    <input type="hidden" name="action" value="go-to-my-cart"/>

                    <input class="nav-button btn btn-default" type="submit" value="My Cart"/>
                </form>
            </div>
            <div class="col-md-3">
                <form action="./" method="get">
                    <input type="hidden" name="identifier" value="${identifier}"/>
                    <input type="hidden" name="userIdentifier" value="${user.identifier}"/>
                    <input type="hidden" name="action" value="go-to-my-account"/>

                    <input class="nav-button btn btn-default" type="submit" value="My Account"/>
                </form>
            </div>
        </div>
    </div>
</div>

<h1 id="page-title">Register</h1>
<h2>Register for a new Account!</h2>
<form action="./" method="get">
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