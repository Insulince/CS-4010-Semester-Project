<!DOCTYPE html>
<html>
<meta charset="utf-8"/>
<title>Home.jsp</title>
<head>
</head>
<body>
<h1>Welcome!</h1>
<p>
    <b>Type your first and last name below.</b>
</p>
<form action="testServlet" method="post">
    <input type="hidden" name="action" value="add"/>

    <label for="firstName">First Name:</label>
    <input type="text" name="firstName" id="firstName"/>
    <br/>

    <label for="lastName">Last Name:</label>
    <input type="text" name="lastName" id="lastName"/>
    <br/>

    <input type="submit" value="Add me!"/>
</form>

<br/>
<p>Press the following button to intentionally go to the error page (not directly, due to an error).</p><br/>
<form>
    <input type="hidden" name="action" value="someUnknownValue"/>

    <input type="submit" value="Error Intentionally"/>
</form>
</body>
</html>