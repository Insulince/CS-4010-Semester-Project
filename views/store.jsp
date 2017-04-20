<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Store</title>
    <style>
        .available {
            color: green;
        }

        .unavailable {
            color: red;
        }

        .item-image {
            height: 100%;
            width: 100%;
        }

        .item-image-container {
            height: 250px;
        }

        a {
            text-decoration: none;
        }
    </style>
    ${sharedHeaderTags}
</head>
<body>
<div id="nav">
    <h1>J<sup>3</sup> Store</h1>
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
<div>
    <div class="container">
        <c:set var="i" value="${0}"/>
        <c:forEach items="${inventory.items}" var="item">
            <c:if test="${i % 4 == 0}">
                <div class="row">
            </c:if>
            <div class="col-md-3">
                <a href="./session?identifier=${identifier}&userIdentifier=${user.identifier}&action=view-item&itemIdentifier=${item.identifier}">
                    <div class="item-image-container">
                        <img class="item-image" src="${pageContext.request.contextPath}/assets/images/${item.imageUrl}" alt="${item.name} image could not be loaded"/>
                    </div>
                    <p>${item.name}</p>
                    <p>$${item.price}</p>
                    <p class="<c:if test="${item.available}">available</c:if><c:if test="${!item.available}">unavailable</c:if>">${item.quantity} in stock</p>
                    <p>${item.description}</p>
                </a>
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
