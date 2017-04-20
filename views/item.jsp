<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
<p>${item.name}</p>
<p>${item.quantity}</p>
<p>${item.price}</p>
<form "./" method="get">
    <input type="hidden" name="identifier" value="${identifier}"/>
    <input type="hidden" name="userIdentifier" value="${user.identifier}"/>
    <input type="hidden" name="action" value="next-item"/>
    <input type="hidden" name="nextIdentifier" value="${item.nextIdentifier}"/>

    <input type="submit" value="Next Item"/>
</form>

<form "./" method="get">
    <input type="hidden" name="identifier" value="${identifier}"/>
    <input type="hidden" name="userIdentifier" value="${user.identifier}"/>
    <input type="hidden" name="action" value="previous-item"/>
    <input type="hidden" name="previousIdentifier" value="${item.previousIdentifier}"/>

    <input type="submit" value="Previous Item"/>
</form>
</body>
</html>
