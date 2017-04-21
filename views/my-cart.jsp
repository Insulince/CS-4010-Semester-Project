<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>My Cart</title>
    ${sharedHeaderTags}
    <style>
        .item-image {
            height: 100%;
            width: 100%;
            border: solid 2px #aaaaaa
        }

        .item-image-container {
            height: 50px;
            width: 50px;
            margin: auto;
        }

        .cart-table {
            margin-top: 15px;
        }

        .cart-table * {
            text-align: center;
        }

        .remove-img {
            height: 25px;
            width: 25px;
            position: absolute;
            top: calc(50% - 13px);
            left: calc(50% - 13px);
        }

        .remove-column {
            position: relative;
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

<h1 id="page-title">My Cart</h1>

<c:choose>
    <c:when test="${removedFromCart == 'yes'}">
        ${requestedItem.name} removed from your cart!
    </c:when>
    <c:when test="${removedFromCart == 'no'}">
        ${requestedItem.name} could not be removed from your cart!
    </c:when>
</c:choose>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <table class="cart-table table table-striped table-bordered table-hover">
                <tr>
                    <th>Number</th>
                    <th>Item Name</th>
                    <th>Price</th>
                    <th>Image</th>
                    <th>Remove</th>
                </tr>
                <c:set var="i" value="0"/>
                <c:set var="totalPrice" value="0"/>
                <c:forEach items="${user.cart}" var="item">
                    <c:set var="i" value="${i + 1}"/>
                    <c:set var="totalPrice" value="${totalPrice + item.price}"/>
                    <tr>
                        <td>${i}</td>
                        <td>${item.name}</td>
                        <td>$${item.price}</td>
                        <td>
                            <div class="item-image-container">
                                <img class="item-image" src="${pageContext.request.contextPath}/assets/images/${item.imageUrl}" alt="${item.name} image could not be loaded"/>
                            </div>
                        </td>
                        <td class="remove-column">
                            <a href="./?identifier=${identifier}&userIdentifier=${user.identifier}&action=remove-item-from-cart&itemIdentifier=${item.identifier}">
                                <img class="remove-img" src="${pageContext.request.contextPath}/assets/images/x.png" alt="x.png could not be loaded."/>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                <tr>
                    <th colspan="2">${i} items</th>
                    <th colspan="3"><fmt:formatNumber value="${totalPrice}" type="currency"/> total price</th>
                </tr>
            </table>
        </div>
    </div>
</div>
</body>
</html>
