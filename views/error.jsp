<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Error!</title>
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
<h1>Error!</h1>

<form action="" method="get">
    <input type="hidden" name="identifier" value="${identifier}"/>
    <input type="hidden" name="userIdentifier" value="${user.identifier}"/>
    <input type="hidden" name="action" value="go-to-home"/>
    <input type="hidden" name="note" value="leaving-error"/>

    <input type="submit" value="Return"/>
</form>
</body>
</html>