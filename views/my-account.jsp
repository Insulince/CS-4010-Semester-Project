<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    ${sharedHeaderTags}
    <style>
        #personal-info-wrapper {
        }

        #payment-info-wrapper {
        }

        .suppressed {
            color: lightgrey;
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

<h1 id="page-title">My Account</h1>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-5 col-md-offset-1">
            <div id="personal-info-wrapper">
                <table class="table table-striped table-bordered table-hover">
                    <tr>
                        <th colspan="2">Personal Information</th>
                    </tr>
                    <tr>
                        <td>Username</td>
                        <td>${user.username}</td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td>&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;</td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td>${user.email}</td>
                    </tr>
                    <tr>
                        <td>First name</td>
                        <td>${user.firstName != "" ? user.firstName : "<p class='suppressed'>[not set]</p>"}</td>
                    </tr>
                    <tr>
                        <td>Middle name</td>
                        <td>${user.middleName != "" ? user.middleName : "<p class='suppressed'>[not set]</p>"}</td>
                    </tr>
                    <tr>
                        <td>Last name</td>
                        <td>${user.lastName != "" ? user.lastName : "<p class='suppressed'>[not set]</p>"}</td>
                    </tr>
                    <tr>
                        <td>Date of Birth</td>
                        <td>${user.dateOfBirth != "" ? user.dateOfBirth : "<p class='suppressed'>[not set]</p>"}</td>
                    </tr>
                    <tr>
                        <td>Gender</td>
                        <td>${user.gender != "" ? user.gender : "<p class='suppressed'>[not set]</p>"}</td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="col-md-5">
            <div id="payment-info-wrapper">
                <table class="table table-striped table-bordered table-hover">
                    <tr>
                        <th colspan="2">Payment & Shipping Information</th>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td>${user.address != "" ? user.address : "<p class='suppressed'>[not set]</p>"}</td>
                    </tr>
                    <tr>
                        <td>City</td>
                        <td>${user.city != "" ? user.city : "<p class='suppressed'>[not set]</p>"}</td>
                    </tr>
                    <tr>
                        <td>State</td>
                        <td>${user.state != "" ? user.state : "<p class='suppressed'>[not set]</p>"}</td>
                    </tr>
                    <tr>
                        <td>Zip Code</td>
                        <td>${user.zipCode != "" ? user.zipCode : "<p class='suppressed'>[not set]</p>"}</td>
                    </tr>
                    <tr>
                        <td>Credit Card Number</td>
                        <c:set var="last4" value=""/>
                        <c:if test='${user.creditCardNumber != ""}'>
                            <c:set var="last4" value="${fn:substring(user.creditCardNumber, 12, 16)}"/>
                        </c:if>
                        <td>${last4 != "" ? "&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;".concat(last4) : "<p class='suppressed'>[not set]</p>"}</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>