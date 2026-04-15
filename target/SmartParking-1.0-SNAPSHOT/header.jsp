<%@ page contentType="text/html;charset=UTF-8" %>

<style>
.navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px 30px;
    background: linear-gradient(135deg, #667eea, #764ba2);
    color: white;
}

.logo {
    font-size: 22px;
    font-weight: bold;
}

.nav-links a {
    color: white;
    text-decoration: none;
    margin-left: 20px;
    font-weight: 500;
}

.nav-links a:hover {
    text-decoration: underline;
}
</style>

<div class="navbar">
    <div class="logo">🚗 SmartParking</div>

    <div class="nav-links">
        <a href="dashboard.jsp">Home</a>
        <a href="SearchServlet">Find Parking</a>
        <a href="LogoutServlet">Logout</a>
    </div>
</div>
