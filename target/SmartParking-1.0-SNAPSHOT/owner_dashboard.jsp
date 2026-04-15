<jsp:include page="header.jsp"/>
<% if(!"OWNER".equals(session.getAttribute("role"))) {
    response.sendRedirect("login.jsp");
} %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Owner Dashboard</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        body { font-family: Arial; background: #f4f4f4; margin: 0; }
        .header {
            background: #27ae60;
            color: white;
            padding: 15px;
            text-align: center;
        }
        .container { padding: 20px; }
        .card {
            background: white;
            padding: 20px;
            border-radius: 10px;
            margin: 10px 0;
        }
        input, button {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
        }
        button {
            background: #27ae60;
            color: white;
            border: none;
        }
        .logout { float: right; color: white; }
    </style>
</head>
<body>

<div class="header">
    Owner Panel: ${sessionScope.user}
    <a href="LogoutServlet" class="logout">Logout</a>
</div>

<div class="container">

    <div class="card">
        <h3>Add Parking</h3>

        <form action="OwnerServlet" method="POST">

            <input type="text" name="name" placeholder="Parking Name" required>
            <input type="text" name="address" placeholder="Address" required>
            <input type="number" name="slots" placeholder="Total Slots" required>
            <input type="number" name="price" placeholder="Price per hour" required>

            <input type="text" name="lat" placeholder="Latitude" required>
            <input type="text" name="lon" placeholder="Longitude" required>

            <button type="submit">Add Parking</button>

        </form>
    </div>

</div>

</body>
</html>
<jsp:include page="footer.jsp"/>