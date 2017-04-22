<html>
<head>
    <title>Register</title>
    ${sharedHeaderTags}

    <style>
        .left-align {
            text-align: left;
        }

        .content {
            margin-top: 15px;
        }
    </style>

    <script>
        function validateForm() {
            var form = document.forms["register-form"];

            var valid = true;
            var errors = "Errors:";

            if (form["username"].value == "") {
                errors += "\n\u2022 Username can't be blank.";
                valid = false;
            }

            if (form["password"].value == "") {
                errors += "\n\u2022 Password can't be blank.";
                valid = false;
            }

            if (form["confirm-password"].value != form["password"].value) {
                errors += "\n\u2022 Confirm password doesn't match password.";
                valid = false;
            }

            if (form["email"].value == "") {
                errors += "\n\u2022 Email can't be blank.";
                valid = false;
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

                    <input class="nav-button btn btn-primary" type="submit" value="Store" disabled/>
                </form>
            </div>
            <div class="col-md-3">
                <form action="./" method="get">
                    <input type="hidden" name="identifier" value="${identifier}"/>
                    <input type="hidden" name="userIdentifier" value="${user.identifier}"/>
                    <input type="hidden" name="action" value="random"/>

                    <input class="nav-button btn btn-primary" type="submit" value="Random Item" disabled/>
                </form>
            </div>
            <div class="col-md-3">
                <form action="./" method="get">
                    <input type="hidden" name="identifier" value="${identifier}"/>
                    <input type="hidden" name="userIdentifier" value="${user.identifier}"/>
                    <input type="hidden" name="action" value="go-to-my-cart"/>

                    <input class="nav-button btn btn-primary" type="submit" value="My Cart" disabled/>
                </form>
            </div>
            <div class="col-md-3">
                <form action="./" method="get">
                    <input type="hidden" name="identifier" value="${identifier}"/>
                    <input type="hidden" name="userIdentifier" value="${user.identifier}"/>
                    <input type="hidden" name="action" value="go-to-my-account"/>

                    <input class="nav-button btn btn-primary" type="submit" value="My Account" disabled/>
                </form>
            </div>
        </div>
    </div>
</div>

<h1 id="page-title">Register</h1>

<div class="content container-fluid">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <form name="register-form" class="form-horizontal" action="./" method="get" onsubmit="return validateForm();">
                <input type="hidden" name="identifier" value="${identifier}"/>
                <input type="hidden" name="action" value="register"/>

                <div class="form-group form-group-item">
                    <label class="control-label col-md-2" for="username">Username</label>
                    <div class="col-md-10">
                        <input type="text" class="form-control left-align" id="username" name="username" value="" placeholder="Username"/>
                    </div>
                </div>

                <div class="form-group form-group-item">
                    <label class="control-label col-md-2" for="password">Password</label>
                    <div class="col-md-10">
                        <input type="password" class="form-control left-align" id="password" name="password" value="" placeholder="Password"/>
                    </div>
                </div>

                <div class="form-group form-group-item">
                    <label class="control-label col-md-2" for="confirm-password">Confirm Password</label>
                    <div class="col-md-10">
                        <input type="password" class="form-control left-align" id="confirm-password" name="confirm-password" value="" placeholder="Confirm Password"/>
                    </div>
                </div>

                <div class="form-group form-group-item">
                    <label class="control-label col-md-2" for="email">Email</label>
                    <div class="col-md-10">
                        <input type="email" class="form-control left-align" id="email" name="email" value="" placeholder="Email"/>
                    </div>
                </div>

                <div class="form-group form-group-item">
                    <div class="left-align col-md-offset-2 col-md-10">
                        <input class="btn btn-primary" type="submit" value="Register"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>