<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>

<link rel="stylesheet" href="css/style.css">

<style>

/* PAGE */
body {
    background: #f5f7fa;
}

/* TOP BAR */
.admin-bar {
    background: #e74c3c;
    color: white;
    padding: 10px;
    text-align: center;
    font-weight: bold;
}

/* CONTAINER */
.container {
    display: flex;
    gap: 30px;
    padding: 40px;
}

/* CARD */
.card {
    background: white;
    padding: 30px;
    border-radius: 15px;
    width: 250px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.1);
    text-align: center;
    transition: 0.3s;
}

/* HOVER EFFECT */
.card:hover {
    transform: translateY(-10px);
    box-shadow: 0 12px 30px rgba(0,0,0,0.2);
}

/* ICON */
.card h3 {
    margin-bottom: 10px;
}

/* BUTTON */
.card a {
    display: inline-block;
    margin-top: 15px;
    padding: 10px 20px;
    background: #27ae60;
    color: white;
    border-radius: 10px;
    text-decoration: none;
    transition: 0.3s;
}

.card a:hover {
    background: #219150;
}

</style>

</head>

<body>

<!-- HEADER -->
<jsp:include page="header.jsp"/>

<!-- ADMIN BAR -->
<div class="admin-bar">
    Admin Panel: <%= session.getAttribute("user") %>
</div>

<!-- DASHBOARD -->
<div class="container">

    <!-- USERS -->
    <div class="card">
        <h3>👥 Manage Users</h3>
        <p>View all registered users</p>
        <a href="AdminServlet?action=users">View Users</a>
    </div>

    <!-- PARKING -->
    <div class="card">
        <h3>🅿️ Manage Parking</h3>
        <p>View and manage parking lots</p>
        <a href="AdminServlet?action=parking">View Parking</a>
    </div>

    <!-- ANALYTICS -->
    <div class="card">
        <h3>📊 Analytics</h3>
        <p>View booking statistics</p>
        <a href="AdminServlet?action=analytics">View Stats</a>
    </div>

</div>

<!-- FOOTER -->
<jsp:include page="footer.jsp"/>

</body>
</html>