<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    ${sharedHeaderTags}

    <style>
        #next-wrapper {
            position: absolute;
            height: 150px;
            width: 150px;
            top: calc(50vh - 75px);
            left: calc(100vw - 150px);
        }

        #next-button {
            height: 100%;
            width: 100%;
            border: none;
            background: url(assets/images/right-chevron.png) no-repeat;
            background-size: 150px 150px;
        }

        #previous-wrapper {
            position: absolute;
            height: 150px;
            width: 150px;
            top: calc(50vh - 75px);
            left: 0;
        }

        #previous-button {
            height: 100%;
            width: 100%;
            border: none;
            background: url(assets/images/left-chevron.png) no-repeat;
            background-size: 150px 150px;
        }

        #item-image {
            height: 100%;
            width: 100%;
            border: solid 2px #aaaaaa
        }

        #item-image-container {
            height: 500px;
            width: 500px;
        }

        #item-wrapper {
            border: 3px solid #888888;
            margin-top: 15px;
            padding: 10px;
            margin-bottom: 30px;
            background-color: #dddddd;
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

<div id="next-wrapper">
    <form action="./" method="get">
        <input type="hidden" name="identifier" value="${identifier}"/>
        <input type="hidden" name="userIdentifier" value="${user.identifier}"/>
        <input type="hidden" name="action" value="next-item"/>
        <input type="hidden" name="nextIdentifier" value="${item.nextIdentifier}"/>

        <input id="next-button" class="btn btn-default" type="submit" value="" <c:if test="${item.nextIdentifier == null}">disabled</c:if>/>
    </form>
</div>

<div id="previous-wrapper">
    <form action="./" method="get">
        <input type="hidden" name="identifier" value="${identifier}"/>
        <input type="hidden" name="userIdentifier" value="${user.identifier}"/>
        <input type="hidden" name="action" value="previous-item"/>
        <input type="hidden" name="previousIdentifier" value="${item.previousIdentifier}"/>

        <input id="previous-button" class="btn btn-default" type="submit" value="" <c:if test="${item.previousIdentifier == null}">disabled</c:if>/>
    </form>
</div>

<h1 id="page-title">${item.name}</h1>

<c:choose>
    <c:when test="${addedToCart == 'yes'}">
        ${requestedItem.name} added to cart!
    </c:when>
    <c:when test="${addedToCart == 'no'}">
        ${requestedItem.name} could not be added to cart!
    </c:when>
</c:choose>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div id="item-wrapper">
                <div id="item-image-container">
                    <img id="item-image" src="${pageContext.request.contextPath}/assets/images/${item.imageUrl}" alt="${item.name} image could not be loaded"/>
                </div>
                <p>${item.quantity}</p>
                <p>${item.price}</p>
            </div>
        </div>
    </div>
</div>
</body>
</html>
