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
            height: 50vh;
            width: 100%;
        }

        #item-wrapper {
            border: 3px solid #888888;
            margin-top: 15px;
            padding: 10px;
            margin-bottom: 30px;
            background-color: #dddddd;
        }

        #details-wrapper {
            width: 100%;
            height: 50vh;
            border: 1px solid black;
        }

        #price, #quantity {
            font-size: 2.2em;
        }

        #description {
            font-size: 1.5em;
        }

        #price-quantity-container {
            padding-top: 8%;
            height: 30%;
        }

        #description-container {
            height: 45%;
        }

        #cart-container {
            height: 25%;
            padding: 10px;
        }

        .cart-button {
            height: 80%;
        }

        .available {
            color: green;
        }

        .unavailable {
            color: red;
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
        <p class="available">${requestedItem.name} added to your cart!</p>
    </c:when>
    <c:when test="${addedToCart == 'no'}">
        <p class="unavailable">${requestedItem.name} could not be added to your cart!</p>
    </c:when>
</c:choose>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div id="item-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-5">
                            <div id="item-image-container">
                                <img id="item-image" src="${pageContext.request.contextPath}/assets/images/${item.imageUrl}" alt="${item.name} image could not be loaded"/>
                            </div>
                        </div>
                        <div class="col-md-7">
                            <div id="details-wrapper" class="container-fluid">
                                <div class="row" id="price-quantity-container">
                                    <div class="col-md-6">
                                        <p id="price">$${item.price}</p>
                                    </div>
                                    <div class="col-md-6">
                                        <p id="quantity"><b class="<c:if test="${item.available}">available</c:if><c:if test="${!item.available}">unavailable</c:if>">${item.quantity}</b> in stock</p>
                                    </div>
                                </div>
                                <div class="row" id="description-container">
                                    <div class="col-md-12">
                                        <p id="description">Description: ${item.description}</p>
                                    </div>
                                </div>
                                <div class="row" id="cart-container">
                                    <div class="col-md-8">
                                        <form action="./" method="get">
                                            <input type="hidden" name="identifier" value="${identifier}"/>
                                            <input type="hidden" name="userIdentifier" value="${user.identifier}"/>
                                            <input type="hidden" name="itemIdentifier" value="${item.identifier}"/>
                                            <input type="hidden" name="action" value="add-to-cart-from-item"/>

                                            <input class="cart-button nav-button btn btn-default" type="submit" value="Add to Cart" <c:if test="${item.quantity == 0}">disabled</c:if>/>
                                        </form>
                                    </div>
                                    <div class="col-md-4">
                                        <form action="./" method="get">
                                            <input type="hidden" name="identifier" value="${identifier}"/>
                                            <input type="hidden" name="userIdentifier" value="${user.identifier}"/>
                                            <input type="hidden" name="action" value="go-to-my-cart"/>

                                            <input class="cart-button nav-button btn btn-default" type="submit" value="View Cart"/>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
