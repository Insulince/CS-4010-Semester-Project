<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Home.jsp</title>
    ${sharedHeaderTags}

    <style>
        #item-image {
            height: 100%;
            width: 100%;
            border: solid 2px #aaaaaa
        }

        #item-image-container {
            height: 30vh;
            width: 100%;
        }

        #item-wrapper {
            border: 3px solid #888888;
            margin-top: 15px;
            padding: 15px;
            margin-bottom: 30px;
            background-color: #dddddd;
        }

        #details-container {
            padding-right: 0;
            padding-left: 8px;
        }

        #image-container {
            padding-left: 0;
            padding-right: 7px;
        }

        #details-wrapper {
            width: 100%;
            height: 30vh;
            border: 2px solid #aaaaaa;
            background-color: #eeeeee;
        }

        #price, #quantity {
            font-size: 1.7em;
        }

        .description {
            font-size: 1.1em;
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

        .daily-item-intro {
            padding-top: calc((30vh + 30px) / 2 - 2em);
        }

        .left-align * {
            text-align: left;
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

<h1 id="page-title">Home</h1>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <c:choose>
                <c:when test="${addedToCart == 'yes'}">
                    <p class="available">${requestedItem.name} added to your cart!</p>
                </c:when>
                <c:when test="${addedToCart == 'no'}">
                    <p class="unavailable">${requestedItem.name} could not be added to your cart!</p>
                </c:when>
            </c:choose>

            <h3>Welcome to J<sup>3</sup>, the one stop shop for all things Rubik's Cube!</h3>

            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-10 col-md-offset-1">
                        <ul class="left-align">
                            <li class="description">Click the "Store" button to view our selection, we have over 30 different liuzzles currently.</li>
                            <li class="description">If you aren't sure what item to look at, you can select "Random Item" to be taken to a randomly selected liuzzle in our inventory.</li>
                            <li class="description">To view items you've reserved, head over to "My Cart" and see what you have so far.</li>
                            <li class="description">You can view/edit your liersonal and liayment information under "My Account".</li>
                            <li class="description">Once you have finished browsing and wish to place your order head back to "My Cart" and select "Checkout" on the right side of the page. Follow the instructions there and your order will soon be on its way.</li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="container-fluid">
                <div class="row">
                    <div class="daily-item-intro col-md-4">
                        <p class="intro-item" style="font-size: 2em;">Today's featured item:</p>
                        <p class="intro-item" style="font-size: 1.5em;">${dailyItem.name}</p>
                    </div>
                    <div class="col-md-8">
                        <div id="item-wrapper">
                            <div class="container-fluid">
                                <div class="row">
                                    <div id="image-container" class="col-md-5">
                                        <div id="item-image-container">
                                            <img id="item-image" src="http://hoare.cs.umsl.edu/servlet/j-reusnow/assets/images/${dailyItem.imageUrl}" alt="${dailyItem.name} image could not be loaded"/>
                                        </div>
                                    </div>
                                    <div id="details-container" class="col-md-7">
                                        <div id="details-wrapper" class="container-fluid">
                                            <div class="row" id="price-quantity-container">
                                                <div class="col-md-6">
                                                    <p id="price">$${dailyItem.price}</p>
                                                </div>
                                                <div class="col-md-6">
                                                    <p id="quantity"><b class="<c:if test="${dailyItem.available}">available</c:if><c:if test="${!dailyItem.available}">unavailable</c:if>">${dailyItem.quantity}</b> in stock</p>
                                                </div>
                                            </div>
                                            <div class="row" id="description-container">
                                                <div class="col-md-12">
                                                    <p class="description">Description: ${dailyItem.description}</p>
                                                </div>
                                            </div>
                                            <div class="row" id="cart-container">
                                                <div class="col-md-8">
                                                    <form action="./" method="get">
                                                        <input type="hidden" name="identifier" value="${identifier}"/>
                                                        <input type="hidden" name="userIdentifier" value="${user.identifier}"/>
                                                        <input type="hidden" name="itemIdentifier" value="${dailyItem.identifier}"/>
                                                        <input type="hidden" name="action" value="add-to-cart-from-home"/>

                                                        <input class="cart-button nav-button btn btn-<c:if test="${dailyItem.available}">success</c:if><c:if test="${!dailyItem.available}">danger</c:if>" type="submit" value="Add to Cart" <c:if test="${dailyItem.quantity == 0}">disabled</c:if>/>
                                                    </form>
                                                </div>
                                                <div class="col-md-4">
                                                    <form action="./" method="get">
                                                        <input type="hidden" name="identifier" value="${identifier}"/>
                                                        <input type="hidden" name="userIdentifier" value="${user.identifier}"/>
                                                        <input type="hidden" name="action" value="go-to-my-cart"/>

                                                        <input class="cart-button nav-button btn btn-primary" type="submit" value="View Cart"/>
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
        </div>
    </div>
</div>
</body>
</html>