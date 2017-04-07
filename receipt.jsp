<jsp:useBean id="user" scope="page" type="semester.project.bean.User"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Receipt.jsp</title>
</head>
<body>
<p>Here is the information that you entered:</p>

<label>First Name:</label>
<span>${user.firstName}</span>
<br/>

<label>Last Name:</label>
<span>${user.lastName}</span>
<br/>

<p>To repeat this process, click on the Back button in your browser or the Return button shown below.</p>
<form action="" method="get">
    <input type="hidden" name="action" value="join"/>
    <input type="submit" value="Return"/>
</form>
</body>
</html>
