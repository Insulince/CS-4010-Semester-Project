<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Home.jsp</title>
    ${sharedHeaderTags}
</head>
<body>
<div id="nav">
    <h1>J<sup>3</sup> Home</h1>
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <form action="./session" method="get">
                    <input type="hidden" name="identifier" value="${identifier}"/>
                    <input type="hidden" name="userIdentifier" value="${user.identifier}"/>
                    <input type="hidden" name="action" value="go-to-home"/>

                    <input type="submit" value="Home"/>
                </form>
            </div>
            <div class="col-md-3">
                <form action="./session" method="get">
                    <input type="hidden" name="identifier" value="${identifier}"/>
                    <input type="hidden" name="userIdentifier" value="${user.identifier}"/>
                    <input type="hidden" name="action" value="go-to-store"/>

                    <input type="submit" value="Store"/>
                </form>
            </div>
            <div class="col-md-3">
                <form action="./session" method="get">
                    <input type="hidden" name="identifier" value="${identifier}"/>
                    <input type="hidden" name="userIdentifier" value="${user.identifier}"/>
                    <input type="hidden" name="action" value="random"/>

                    <input type="submit" value="Random"/>
                </form>
            </div>
            <div class="col-md-3">
                <form action="./session" method="get">
                    <input type="hidden" name="identifier" value="${identifier}"/>
                    <input type="hidden" name="userIdentifier" value="${user.identifier}"/>
                    <input type="hidden" name="action" value="go-to-my-account"/>

                    <input type="submit" value="My Account"/>
                </form>
            </div>
        </div>
    </div>
</div>
<h2>${message}</h2>
<br/>
</body>
</html>