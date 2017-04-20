<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Error!</title>
    ${sharedHeaderTags}
</head>
<body>
<h1>Error!</h1>

<form action="" method="get">
    <input type="hidden" name="identifier" value="${identifier}"/>
    <input type="hidden" name="userIdentifier" value="${user.identifier}"/>
    <input type="hidden" name="action" value="go-to-home"/>
    <input type="hidden" name="note" value="leaving-error"/>

    <input type="submit" value="Return"/>
</form>
</body>
</html>