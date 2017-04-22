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
            border: solid 3px #aaaaaa;
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

        .available {
            color: green;
        }

        .unavailable {
            color: red;
        }

        .checkout-button-wrapper-wrapper {
            position: relative;
        }

        .checkout-button-wrapper {
            width: auto;
            margin-top: 15px;
            position: fixed;
            border: 3px solid #aaaaaa;
            background-color: #e4e4e4;
            padding: 10px;
        }

        .checkout-button {
            width: 15vw;
            height: 15vh;
        }

        #checkout-button {
            margin-top: 10px;
        }

        #continue-shopping-button {
            margin-top: 25px;
        }

        .total-item {
            margin-top: 10px;
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

<h1 id="page-title">My Cart</h1>

<c:choose>
    <c:when test="${removedFromCart == 'yes'}">
        <p class="available">${requestedItem.name} removed from your cart!</p>
    </c:when>
    <c:when test="${removedFromCart == 'no'}">
        <p class="unavailable"> ${requestedItem.name} could not be removed from your cart!</p>
    </c:when>
</c:choose>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-8 col-md-offset-1 cart-table-wrapper">
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
                <c:if test="${i == 0}">
                    <tr>
                        <td colspan="5">No Items!</td>
                    </tr>
                </c:if>
                <tr>
                    <th colspan="2">${i} items</th>
                    <th colspan="3"><fmt:formatNumber value="${totalPrice}" type="currency"/> total price</th>
                </tr>
            </table>
        </div>
        <div class="col-md-2 checkout-button-wrapper-wrapper">
            <div class="checkout-button-wrapper">
                <div>
                    <h3 class="total-item">Total: <fmt:formatNumber value="${totalPrice}" type="currency"/></h3>
                    <h3 class="total-item">${i} items</h3>
                </div>
                <form action="./" method="get">
                    <input type="hidden" name="identifier" value="${identifier}"/>
                    <input type="hidden" name="userIdentifier" value="${user.identifier}"/>
                    <input type="hidden" name="action" value="go-to-checkout"/>

                    <input class="checkout-button btn btn-success" id="checkout-button" type="submit" value="Checkout" <c:if test="${i == 0}">disabled</c:if>>
                </form>
                <form accept-charset="./" method="get">
                    <input type="hidden" name="identifier" value="${identifier}"/>
                    <input type="hidden" name="userIdentifier" value="${user.identifier}"/>
                    <input type="hidden" name="action" value="go-to-store"/>

                    <input class="checkout-button btn btn-primary" id="continue-shopping-button" type="submit" value="Continue Shopping"/>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
