<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Admin Analytics</title>

<link rel="stylesheet" href="css/style.css">

<style>

/* PAGE */
body {
    background: #f5f7fa;
}

/* CONTAINER */
.container {
    padding: 40px;
}

/* TITLE */
h2 {
    text-align: center;
    margin-bottom: 30px;
}

/* CARD GRID */
.grid {
    display: flex;
    justify-content: center;
    gap: 30px;
}

/* CARD */
.card {
    background: white;
    padding: 30px;
    border-radius: 15px;
    width: 250px;
    text-align: center;
    box-shadow: 0 8px 20px rgba(0,0,0,0.1);
    transition: 0.3s;
}

/* HOVER */
.card:hover {
    transform: translateY(-10px);
}

/* NUMBER */
.number {
    font-size: 30px;
    font-weight: bold;
    color: #27ae60;
}

</style>

</head>

<body>

<!-- HEADER -->
<jsp:include page="header.jsp"/>

<div class="container">

    <h2>📊 Admin Analytics Dashboard</h2>

    <div class="grid">

        <!-- TOTAL BOOKINGS -->
        <div class="card">
            <h3>Total Bookings</h3>
            <div class="number">
                <%= request.getAttribute("totalBookings") != null 
                    ? request.getAttribute("totalBookings") 
                    : "0" %>
            </div>
        </div>

        <!-- TOTAL USERS -->
        <div class="card">
            <h3>Total Users</h3>
            <div class="number">
                <%= request.getAttribute("totalUsers") != null 
                    ? request.getAttribute("totalUsers") 
                    : "0" %>
            </div>
        </div>

        <!-- TOTAL PARKING -->
        <div class="card">
            <h3>Total Parking</h3>
            <div class="number">
                <%= request.getAttribute("totalParking") != null 
                    ? request.getAttribute("totalParking") 
                    : "0" %>
            </div>
        </div>

    </div>

    <br><br>

    <div style="text-align:center;">
        <a href="admin_dashboard.jsp" class="btn">⬅ Back to Dashboard</a>
    </div>

</div>

<!-- FOOTER -->
<jsp:include page="footer.jsp"/>

</body>
</html>