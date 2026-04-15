<jsp:include page="header.jsp"/>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Search Parking</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        body { font-family: Arial; background: #f4f4f4; padding: 20px; }
        .card {
            background: white;
            padding: 15px;
            margin: 10px 0;
            border-radius: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .btn {
            background: #27ae60;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
        }
    </style>
</head>
<body>

<h2>Available Parking Spots</h2>

<c:forEach var="spot" items="${parkingSpots}">
    <div class="card">
        <div>
            <h3>${spot.name}</h3>
            <p>Address: ${spot.address}</p>
            <p>Slots: ${spot.availableSlots}</p>
            <p>Price: ₹${spot.pricePerHour}</p>
        </div>

        <form action="BookServlet" method="POST">
            <input type="hidden" name="parkingId" value="${spot._id}">
            <button class="btn">BOOK NOW</button>
        </form>
    </div>
</c:forEach>

</body>
</html>
<jsp:include page="footer.jsp"/>