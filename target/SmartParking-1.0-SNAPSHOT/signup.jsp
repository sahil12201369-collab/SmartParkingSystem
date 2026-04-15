<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Register - Smart Parking</title>

<link rel="stylesheet" href="css/style.css">

<style>

/* MAIN BACKGROUND */
.main {
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    background: url('https://images.unsplash.com/photo-1506521781263-d8422e82f27a') no-repeat center center/cover;
    position: relative;
}

/* OVERLAY FIX */
.main::before {
    content: "";
    position: absolute;
    width: 100%;
    height: 100%;
    background: rgba(0,0,0,0.6);
    pointer-events: none;   /* 🔥 FIX CLICK ISSUE */
}

/* CARD */
.card {
    position: relative;
    z-index: 1;
    background: rgba(255,255,255,0.95);
    padding: 40px;
    border-radius: 20px;
    width: 350px;
    text-align: center;
    box-shadow: 0 10px 30px rgba(0,0,0,0.3);
}

/* INPUT */
input, select {
    width: 100%;
    padding: 12px;
    margin: 12px 0;
    border-radius: 10px;
    border: 1px solid #ccc;
}

/* BUTTON */
button {
    width: 100%;
    padding: 12px;
    background: #27ae60;
    color: white;
    border: none;
    border-radius: 10px;
    font-size: 16px;
    cursor: pointer;
}

button:hover {
    background: #219150;
}

</style>

</head>

<body>

<!-- HEADER -->
<jsp:include page="header.jsp"/>

<!-- MAIN -->
<div class="main">

    <div class="card">
        <h2>🚗 Create Account</h2>

        <form action="RegisterServlet" method="POST">

            <input type="text" name="name" placeholder="Full Name" required>

            <input type="email" name="email" placeholder="Email Address" required>

            <input type="password" name="password" placeholder="Password" required>

            <select name="role">
                <option value="USER">User</option>
                <option value="OWNER">Parking Owner</option>
            </select>

            <button type="submit">Register</button>

        </form>

        <p style="margin-top:15px;">
            Already have an account?
            <a href="login.jsp">Login</a>
        </p>
    </div>

</div>

<!-- FOOTER -->
<jsp:include page="footer.jsp"/>

</body>
</html>