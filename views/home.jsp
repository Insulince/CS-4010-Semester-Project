<!DOCTYPE html>
<html>
<meta charset="utf-8"/>
<title>Home.jsp</title>
<head>
</head>
<body>
<h1>${message}</h1>
<br/>
<p>Press the following button to intentionally go to the error page (not directly, due to an error).</p><br/>
<form>
    <input type="hidden" name="identifier" value="${identifier}"/>
    <input type="hidden" name="userIdentifier" value="${user.identifier}"/>
    <input type="hidden" name="action" value="someValue"/>

    <input type="submit" value="Error Intentionally"/>
</form>
</body>
</html>