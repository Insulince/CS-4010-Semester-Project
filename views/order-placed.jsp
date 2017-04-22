<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order Placed</title>
    ${sharedHeaderTags}
    <style>
        .content {
            margin-top: 15px;
        }

        .go-home-button {
            width: 10vw;
            height: 10vh;
            margin-top: 25px;
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

                    <input class="nav-button btn btn-primary" type="submit" value="Store"/>
                </form>
            </div>
            <div class="col-md-3">
                <form action="./" method="get">
                    <input type="hidden" name="identifier" value="${identifier}"/>
                    <input type="hidden" name="userIdentifier" value="${user.identifier}"/>
                    <input type="hidden" name="action" value="random"/>

                    <input class="nav-button btn btn-primary" type="submit" value="Random Item"/>
                </form>
            </div>
            <div class="col-md-3">
                <form action="./" method="get">
                    <input type="hidden" name="identifier" value="${identifier}"/>
                    <input type="hidden" name="userIdentifier" value="${user.identifier}"/>
                    <input type="hidden" name="action" value="go-to-my-cart"/>

                    <input class="nav-button btn btn-primary" type="submit" value="My Cart"/>
                </form>
            </div>
            <div class="col-md-3">
                <form action="./" method="get">
                    <input type="hidden" name="identifier" value="${identifier}"/>
                    <input type="hidden" name="userIdentifier" value="${user.identifier}"/>
                    <input type="hidden" name="action" value="go-to-my-account"/>

                    <input class="nav-button btn btn-primary" type="submit" value="My Account"/>
                </form>
            </div>
        </div>
    </div>
</div>

<h1 id="page-title">Order Placed</h1>

<div class="content container-fluid">
    <div class="row">
        <div class="col-md-4 col-md-offset-2">
            <p><b>Your order has been placed and is on its way! Give us 1-2 business days for processing and packaging, then 3-10 business days for shipping (depending on your location).</b></p>
        </div>
        <div class="col-md-4">
            <p>You ordered:</p>
            <ul class="list-group">
                <c:forEach items="${orderedItems}" var="orderedItem">
                    <li class="list-group-item">${orderedItem.name}</li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <h2>Thank you for shopping with J<sup>3</sup>!</h2>
        </div>
    </div>
    <div class="row">
        <form action="./" method="get">
            <input type="hidden" name="identifier" value="${identifier}"/>
            <input type="hidden" name="userIdentifier" value="${user.identifier}"/>
            <input type="hidden" name="action" value="go-to-home"/>

            <input class="go-home-button btn btn-primary" type="submit" value="Return"/>
        </form>
    </div>
</div>
</body>
</html>
