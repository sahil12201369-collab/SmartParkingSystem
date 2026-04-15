<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Smart Parking</title>
<link rel="stylesheet" href="css/style.css">

<style>
body {
    margin: 0;
    font-family: 'Segoe UI';
    display: flex;
    flex-direction: column;
    min-height: 100vh;
}

/* HEADER FIX */
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
}

/* MAIN CENTER */
.main {
    flex: 1;
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
    background: linear-gradient(135deg, #667eea, #764ba2);
    color: white;
}

/* CONTENT */
.hero {
    max-width: 600px;
}

.hero h1 {
    font-size: 40px;
    margin-bottom: 10px;
}

.hero p {
    margin-bottom: 30px;
    font-size: 18px;
}

/* BUTTONS */
.btn {
    padding: 12px 25px;
    background: #27ae60;
    color: white;
    border-radius: 10px;
    text-decoration: none;
    margin: 10px;
    display: inline-block;
    transition: 0.3s;
}

.btn:hover {
    background: #219150;
    transform: scale(1.05);
}

/* FOOTER FIX */
.footer {
    background: #111;
    color: #ccc;
    text-align: center;
    padding: 15px;
}
</style>
</head>

<body>

<!-- HEADER -->
<div class="navbar">
    <div class="logo">🚗 SmartParking</div>
    <div class="nav-links">
        <a href="#">Home</a>
        <a href="SearchServlet">Find Parking</a>
        <a href="LogoutServlet">Logout</a>
    </div>
</div>

<!-- MAIN -->
<div class="main">
    <div class="hero">
        <h1>🚗 Smart Parking System</h1>
        <p>Find & Book Parking Easily</p>

        <a href="login.jsp" class="btn">Login</a>
        <a href="signup.jsp" class="btn">Register</a>
    </div>
</div>

<!-- FOOTER -->
<div class="footer">
    © 2026 SmartParking | All Rights Reserved <br>
    Developed by Sahil 🚀
</div>

</body>
</html>