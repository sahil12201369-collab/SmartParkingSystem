<jsp:include page="header.jsp"/><!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<h2>Register</h2>

<form action="RegisterServlet" method="POST">

    <input type="text" name="name" placeholder="Full Name" required><br><br>

    <input type="email" name="email" placeholder="Email" required><br><br>

    <input type="password" name="password" placeholder="Password" required><br><br>

    <select name="role">
        <option value="USER">User</option>
        <option value="OWNER">Parking Owner</option>
    </select><br><br>

    <button type="submit">Register</button>

</form>

<a href="login.jsp">Login</a>

</body>
</html>
<jsp:include page="footer.jsp"/>