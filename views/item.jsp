<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p>${item.name}</p>
<p>${item.quantity}</p>
<p>${item.price}</p>
<form action="./session" method="get">
    <input type="hidden" name="identifier" value="${identifier}"/>
    <input type="hidden" name="userIdentifier" value="${user.identifier}"/>
    <input type="hidden" name="action" value="next-item"/>
    <input type="hidden" name="nextIdentifier" value="${item.nextIdentifier}"/>

    <input type="submit" value="Next Item"/>
</form>

<form action="./session" method="get">
    <input type="hidden" name="identifier" value="${identifier}"/>
    <input type="hidden" name="userIdentifier" value="${user.identifier}"/>
    <input type="hidden" name="action" value="previous-item"/>
    <input type="hidden" name="previousIdentifier" value="${item.previousIdentifier}"/>

    <input type="submit" value="Previous Item"/>
</form>
</body>
</html>
