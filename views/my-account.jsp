<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    ${sharedHeaderTags}
    <style>
        .suppressed {
            color: lightgrey;
        }

        .info-table {
            border: solid 3px #aaaaaa;
        }

        .action-button {
            height: 50px;
            width: 10vw;
        }

        .left-align {
            text-align: left;
        }

        .right-align {
            text-align: right;
        }

        .content {
            padding-top: 15px;
        }

        .buttons {
            margin-bottom: 150px;
        }
    </style>
    <script>
        function validateForm() {
            var form = document.forms["changes-form"];

            var valid = true;
            var errors = "Errors:";

            if (form["email"] == "") {
                valid = false;
                errors += "\n\u2022 Email can't be blank."
            }

            if (form["zipCode"].value != "") {
                var zipCode = form["zipCode"].value;

                if (zipCode.length != 5) {
                    errors += "\n\u2022 Zip Code must be 5 characters long.";
                    valid = false;
                } else {
                    for (var i = 0; i < zipCode.length; i++) {
                        if (isNaN(zipCode[i])) {
                            errors += "\n\u2022 Zip Code can't contain letters.";
                            valid = false;
                            break;
                        }
                    }
                }
            }

            if (form["creditCardNumber"].value != "") {
                var creditCardNumber = form["creditCardNumber"].value;
                var defaultNumber = false;

                for (var i = 0; i < creditCardNumber.length; i++) {
                    if (creditCardNumber[i] == "\u2022") {
                        defaultNumber = true;
                        break;
                    }
                }
                if (!defaultNumber) {
                    if (creditCardNumber.length != 16) {
                        errors += "\n\u2022 Credit Card Number must be 16 characters long.";
                        valid = false;
                    } else {
                        for (var i = 0; i < creditCardNumber.length; i++) {
                            if (isNaN(creditCardNumber[i])) {
                                errors += "\n\u2022 Credit Card Numbers can't contain letters.";
                                valid = false;
                                break;
                            }
                        }
                    }
                } else {
                    if (valid) {
                        form["creditCardNumber"].value = "0000000000000000";
                    }
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

<h1 id="page-title">My Account</h1>

<div class="content container-fluid">
    <div class="row">
        <c:choose>
            <c:when test='${mode == "view"}'>
                <div class="col-md-5 col-md-offset-1">
                    <div class="personal-info-wrapper">
                        <table class="info-table table table-striped table-bordered table-hover">
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
                    <div class="payment-info-wrapper">
                        <table class="info-table table table-striped table-bordered table-hover">
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
            </c:when>
            <c:otherwise>
                <form id="changes-form" action="./" method="get">
                    <input type="hidden" name="identifier" value="${identifier}"/>
                    <input type="hidden" name="userIdentifier" value="${user.identifier}"/>
                    <input type="hidden" name="action" value="save-my-account"/>

                    <div class="col-md-5 col-md-offset-1">
                        <div class="personal-info-wrapper">
                            <table class="info-table table table-striped table-bordered table-hover">
                                <tr>
                                    <th colspan="2">Personal Information</th>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <div class="form-group form-group-item"><label class="right-align control-label col-md-3" for="username">Username</label>
                                            <div class="col-md-9"><input type="text" class="form-control left-align" id="username" name="username" value="${user.username != "" ? user.username : ""}" placeholder="Username" disabled/></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <div class="form-group form-group-item"><label class="right-align control-label col-md-3" for="password">Password</label>
                                            <div class="col-md-9"><input type="text" class="form-control left-align" id="password" name="password" value="&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;" placeholder="Password" disabled/></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <div class="form-group form-group-item"><label class="right-align control-label col-md-3" for="email">Email</label>
                                            <div class="col-md-9"><input type="email" class="form-control left-align" id="email" name="email" value="${user.email != "" ? user.email : ""}" placeholder="Email"/></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <div class="form-group form-group-item"><label class="right-align control-label col-md-3" for="firstName">First Name</label>
                                            <div class="col-md-9"><input type="text" class="form-control left-align" id="firstName" name="firstName" value="${user.firstName != "" ? user.firstName : ""}" placeholder="First Name"/></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <div class="form-group form-group-item"><label class="right-align control-label col-md-3" for="middleName">Middle Name</label>
                                            <div class="col-md-9"><input type="text" class="form-control left-align" id="middleName" name="middleName" value="${user.middleName != "" ? user.middleName : ""}" placeholder="Middle Name"/></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <div class="form-group form-group-item"><label class="right-align control-label col-md-3" for="lastName">Last Name</label>
                                            <div class="col-md-9"><input type="text" class="form-control left-align" id="lastName" name="lastName" value="${user.lastName != "" ? user.lastName : ""}" placeholder="Last Name"/></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <div class="form-group form-group-item"><label class="right-align control-label col-md-3" for="dateOfBirth">Date Of Birth</label>
                                            <div class="col-md-9"><input type="date" class="form-control left-align" id="dateOfBirth" name="dateOfBirth" value="${user.dateOfBirth != "" ? user.dateOfBirth : ""}" placeholder="Date Of Birth"/></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <div class="form-group form-group-item"><label class="right-align control-label col-md-3" for="gender">Gender</label>
                                            <div class="col-md-9"><input type="text" class="form-control left-align" id="gender" name="gender" value="${user.gender != "" ? user.gender : ""}" placeholder="Gender"/></div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="payment-info-wrapper">
                            <table class="info-table table table-striped table-bordered table-hover">
                                <tr>
                                    <th colspan="2">Payment & Shipping Information</th>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <div class="form-group form-group-item"><label class="right-align control-label col-md-4" for="address">Address</label>
                                            <div class="col-md-8"><input type="text" class="form-control left-align" id="address" name="address" value="${user.address != "" ? user.address : ""}" placeholder="Address"/></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <div class="form-group form-group-item"><label class="right-align control-label col-md-4" for="city">City</label>
                                            <div class="col-md-8"><input type="text" class="form-control left-align" id="city" name="city" value="${user.city != "" ? user.city : ""}" placeholder="city"/></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <div class="form-group form-group-item"><label class="right-align control-label col-md-4" for="state">State</label>
                                            <div class="col-md-8"><input type="text" class="form-control left-align" id="state" name="state" value="${user.state != "" ? user.state : ""}" placeholder="State"/></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <div class="form-group form-group-item"><label class="right-align control-label col-md-4" for="zipCode">Zip Code</label>
                                            <div class="col-md-8"><input type="text" class="form-control left-align" id="zipCode" name="zipCode" value="${user.zipCode != "" ? user.zipCode : ""}" placeholder="Zip Code"/></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <div class="form-group form-group-item"><label class="right-align control-label col-md-4" for="creditCardNumber">Credit Card Number</label>
                                            <c:set var="last4" value=""/>
                                            <c:if test='${user.creditCardNumber != ""}'>
                                                <c:set var="last4" value="${fn:substring(user.creditCardNumber, 12, 16)}"/>
                                            </c:if>
                                            <div class="col-md-8"><input type="text" class="form-control left-align" id="creditCardNumber" name="creditCardNumber"
                                                                         value="${last4 != "" ? "&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;&bullet;".concat(last4) : ""}" placeholder="Credit Card Number"/></div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </form>
            </c:otherwise>
        </c:choose>
    </div>
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="container-fluid">
                <div class="row buttons">
                    <div class="col-md-6">
                        <c:choose>
                            <c:when test='${mode == "view"}'>
                                <form action="./" method="get">
                                    <input type="hidden" name="identifier" value="${identifier}"/>
                                    <input type="hidden" name="userIdentifier" value="${user.identifier}"/>
                                    <input type="hidden" name="action" value="edit-my-account"/>

                                    <input class="action-button btn btn-primary" type="submit" value="Edit Information">
                                </form>
                            </c:when>
                            <c:otherwise>
                                <button class="action-button btn btn-success" onclick="if (validateForm()) {document.getElementById('changes-form').submit();}">Save Changes</button>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="col-md-6">
                        <form action="./" method="get">
                            <input type="hidden" name="identifier" value="${identifier}"/>
                            <input type="hidden" name="userIdentifier" value="${user.identifier}"/>
                            <input type="hidden" name="action" value="logout"/>

                            <input class="action-button btn btn-danger" type="submit" value="Logout"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>