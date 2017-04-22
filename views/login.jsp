<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    ${sharedHeaderTags}

    <style>
        .left-align {
            text-align: left;
        }

        .register-form {
            margin-top: 60px;
        }

        .content {
            margin-top: 15px;
        }
    </style>
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

<h1 id="page-title">Login</h1>

<c:if test="${loginFail}">
    <p style="color: red;">${message}</p>
</c:if>

<div class="content container-fluid">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <form class="left-align form-horizontal" action="./" method="get">
                <input type="hidden" name="identifier" value="${identifier}"/>
                <input type="hidden" name="action" value="login"/>


                <div class="form-group form-group-item">
                    <label class="control-label col-md-2" for="username">Username</label>
                    <div class="col-md-10">
                        <input type="text" class="form-control left-align" id="username" name="username" value="" placeholder="Username"/>
                    </div>
                </div>

                <div class="form-group form-group-item">
                    <label class="control-label col-md-2" for="password">Password</label>
                    <div class="col-md-10">
                        <input type="password" class="form-control left-align" id="password" name="password" value="" placeholder="Password"/>
                    </div>
                </div>

                <div class="form-group form-group-item">
                    <div class="left-align col-md-offset-2 col-md-10">
                        <input class="btn btn-primary" type="submit" value="Log In"/>
                    </div>
                </div>
            </form>

            <form class="register-form" action="./" method="get">
                <input type="hidden" name="identifier" value="${identifier}"/>
                <input type="hidden" name="action" value="go-to-register"/>

                <p>Don't have an account yet?</p>
                <input class="btn btn-success" type="submit" value="Register"/>
            </form>

        </div>
    </div>
</div>
</body>
</html>