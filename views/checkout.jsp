<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Checkout</title>
    ${sharedHeaderTags}

    <style>
        .form-group-item {
            margin-top: 15px;
        }

        .left-align {
            text-align: left;
        }

        .total {
            font-size: 1.3em;
        }
    </style>

    <script>
        function validateForm() {
            var form = document.forms["order-form"];

            var valid = true;
            var errors = "Errors:";

            if (form["name"].value == "") {
                errors += "\n• Name cannot be blank.";
                valid = false;
            }

            if (form["address"].value == "") {
                errors += "\n• Address cannot be blank.";
                valid = false;
            }

            if (form["city"].value == "") {
                errors += "\n• City cannot be blank.";
                valid = false;
            }

            if (form["state"].value == "") {
                errors += "\n• State cannot be blank.";
                valid = false;
            }

            if (form["zip-code"].value == "") {
                errors += "\n• Zip Code cannot be blank.";
                valid = false;
            }

            if (form["credit-card-number"].value == "") {
                errors += "\n• Credit Card Number cannot be blank.";
                valid = false;
            } else {
                if (form["credit-card-number"].value.length != 16) {
                    errors += "\n• Credit Card Number must be 16 characters long.";
                    valid = false;
                }
            }

            if (!valid) {
                alert(errors);
            }

            return valid;
        }
    </script>
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

<h1 id="page-title">Checkout</h1>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <h3>Order Summary</h3>
            <ul class="list-group" id="order-summary">
                <c:set var="i" value="0"/>
                <c:set var="totalPrice" value="0"/>
                <c:forEach items="${user.cart}" var="item">
                    <c:set var="i" value="${i + 1}"/>
                    <c:set var="totalPrice" value="${totalPrice + item.price}"/>
                    <li class="list-group-item">${item.name} at $${item.price}</li>
                </c:forEach>
                <li class="list-group-item total"><b>Total: <fmt:formatNumber value="${totalPrice}" type="currency"/></b></li>
            </ul>
        </div>
    </div>

    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <h3>Shipping & Payment Information</h3>
            <form name="order-form" class="form-horizontal" action="./" method="get" onsubmit="return validateForm();">
                <input type="hidden" name="identifier" value="${identifier}"/>
                <input type="hidden" name="userIdentifier" value="${user.identifier}"/>
                <input type="hidden" name="action" value="checkout"/>

                <div class="form-group form-group-item">
                    <label class="control-label col-md-2" for="name">Name</label>
                    <div class="col-md-10">
                        <input type="text" class="form-control left-align" id="name" name="name" value="${user.firstName != "" ? user.firstName : ""}${user.middleName != "" ? " ".concat(user.middleName) : ""}${user.lastName != "" ? " ".concat(user.lastName) : ""}" placeholder="Name"/>
                    </div>
                </div>

                <div class="form-group form-group-item">
                    <label class="control-label col-md-2" for="address">Address</label>
                    <div class="col-md-10">
                        <input type="text" class="form-control left-align" id="address" name="address" value="${user.address != "" ? user.address : ""}" placeholder="Address"/>
                    </div>
                </div>

                <div class="form-group form-group-item">
                    <label class="control-label col-md-2" for="city">City</label>
                    <div class="col-md-10">
                        <input type="text" class="form-control left-align" id="city" name="city" value="${user.city != "" ? user.city : ""}" placeholder="City"/>
                    </div>
                </div>

                <div class="form-group form-group-item">
                    <label class="control-label col-md-2" for="state">State</label>
                    <div class="col-md-10">
                        <input type="text" class="form-control left-align" id="state" name="state" value="${user.state != "" ? user.state : ""}" placeholder="State"/>
                    </div>
                </div>

                <div class="form-group form-group-item">
                    <label class="control-label col-md-2" for="zip-code">Zip Code</label>
                    <div class="col-md-10">
                        <input type="text" class="form-control left-align" id="zip-code" name="zip-code" value="${user.zipCode != "" ? user.zipCode : ""}" placeholder="Zip Code"/>
                    </div>
                </div>

                <div class="form-group form-group-item">
                    <label class="control-label col-md-2" for="credit-card-number">Credit Card Number</label>
                    <c:set var="last4" value=""/>
                    <c:if test='${user.creditCardNumber != ""}'>
                        <c:set var="last4" value="${fn:substring(user.creditCardNumber, 12, 16)}"/>
                    </c:if>
                    <div class="col-md-10">
                        <input type="text" class="form-control left-align" id="credit-card-number" name="credit-card-number" value="${last4 != "" ? "&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;".concat(last4) : ""}"
                               placeholder="Credit Card Number"/>
                    </div>
                </div>

                <div class="col-md-offset-2 form-group-item" style="padding-left: 5px;">
                    <div class="left-align checkbox">
                        <label><input type="checkbox" name="updateInformation" checked> Update my information (Name and Credit Card changes can only be saved in the "My Account" page)</label>
                    </div>
                </div>

                <div class="form-group form-group-item">
                    <div class="left-align col-md-offset-2 col-md-10">
                        <input type="submit" class="btn btn-primary" value="Place Order">
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
