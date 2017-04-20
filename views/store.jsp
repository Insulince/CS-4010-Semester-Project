<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>
    <title>Store</title>
    <style>
        .item-image {
            height: 100%;
            width: 100%;
            border: solid 2px #aaaaaa
        }

        .item-image-container {
            height: 250px;
        }

        .item-link, .item-link * {
            text-decoration: none !important;
            color: initial;
        }

        .available {
            color: green;
        }

        .unavailable {
            color: red;
        }

        #store-wrapper {
            padding-top: 50px;
        }

        .item-wrapper {
            border: 3px solid #888888;
            padding: 10px;
            margin-bottom: 30px;
            background-color: #dddddd;
        }

        .item-description {
            height: 100px;
        }

        .add-to-cart-button {
            margin-top: 10px;
            width: 100%
        }
    </style>
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
<div id="store-wrapper">
    <div class="container">
        <c:set var="i" value="${0}"/>
        <c:forEach items="${inventory.items}" var="item">
            <c:if test="${i % 4 == 0}">
                <div class="row">
            </c:if>
            <div class="col-md-3">
                <div class="item-wrapper">
                    <a class="item-link" href="./?identifier=${identifier}&userIdentifier=${user.identifier}&action=view-item&itemIdentifier=${item.identifier}">
                        <div class="item-image-container">
                            <img class="item-image" src="${pageContext.request.contextPath}/assets/images/${item.imageUrl}" alt="${item.name} image could not be loaded"/>
                        </div>
                        <p>${item.name}</p>
                        <p>$${item.price}</p>
                        <p class="<c:if test="${item.available}">available</c:if><c:if test="${!item.available}">unavailable</c:if>">${item.quantity} in stock</p>
                        <p class="item-description">
                            <c:choose>
                                <c:when test="${fn:length(item.description) < 140}">
                                    ${item.description} (click for more)
                                </c:when>
                                <c:otherwise>
                                    ${fn:substring(item.description, 0, 140)}... (click for more)
                                </c:otherwise>
                            </c:choose>
                        </p>
                    </a>
                    <form "./" method="get">
                        <input type="hidden" name="identifier" value="${identifier}"/>
                        <input type="hidden" name="userIdentifier" value="${user.identifier}"/>
                        <input type="hidden" name="action" value="add-to-cart"/>

                        <input class="add-to-cart-button btn btn-default" type="submit" value="Add to Cart"/>
                    </form>
                </div>
            </div>
            <c:if test="${i % 4 == 3}">
                </div>
            </c:if>
            <c:set var="i" value="${i + 1}"/>
        </c:forEach>
    </div>
</div>
</body>
</html>
