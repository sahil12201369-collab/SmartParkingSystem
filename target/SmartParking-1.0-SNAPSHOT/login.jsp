<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Login - Smart Parking</title>

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
input {
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
    background: #667eea;
    color: white;
    border: none;
    border-radius: 10px;
    font-size: 16px;
    cursor: pointer;
}

button:hover {
    background: #5a67d8;
}

/* ROLE BUTTONS */
.role-btns {
    display: flex;
    justify-content: space-between;
    margin-bottom: 10px;
}

.role-btns button {
    width: 30%;
    background: #eee;
    color: black;
}

.role-btns button.active {
    background: #667eea;
    color: white;
}

</style>

</head>

<body>

<!-- HEADER -->
<jsp:include page="header.jsp"/>

<!-- MAIN -->
<div class="main">

    <div class="card">
        <h2>🚗 Login</h2>

        <!-- ERROR MESSAGE -->
        <% if(request.getParameter("error") != null) { %>
            <p style="color:red;">Invalid Email or Password</p>
        <% } %>

        <!-- SUCCESS MESSAGE -->
        <% if(request.getParameter("success") != null) { %>
            <p style="color:green;">Registered Successfully! Please login.</p>
        <% } %>

        <form action="LoginServlet" method="POST">

            <div class="role-btns">
                <button type="button" onclick="setRole('USER', this)" class="active">User</button>
                <button type="button" onclick="setRole('OWNER', this)">Owner</button>
                <button type="button" onclick="setRole('ADMIN', this)">Admin</button>
            </div>

            <input type="hidden" name="role" id="role" value="USER">

            <input type="email" name="email" placeholder="Enter Email" required>

            <input type="password" name="password" placeholder="Enter Password" required>

            <button type="submit">Login</button>

        </form>

        <p style="margin-top:15px;">
            New user?
            <a href="signup.jsp">Register</a>
        </p>
    </div>

</div>

<!-- FOOTER -->
<jsp:include page="footer.jsp"/>

<script>
function setRole(role, btn) {
    document.getElementById("role").value = role;

    let buttons = document.querySelectorAll(".role-btns button");
    buttons.forEach(b => b.classList.remove("active"));

    btn.classList.add("active");
}
</script>

</body>
</html>