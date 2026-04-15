<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<jsp:include page="header.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <title>Nearby Parking</title>
<link rel="stylesheet" href="css/style.css">
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAfnNwq9YgrmLPeXNmx27CicEAMEUxl3m0&callback=initMap" async defer></script>

    <style>
        body { margin:0; font-family: 'Segoe UI'; }

        .container {
            display: flex;
        }

        #map {
            height: 100vh;
            width: 70%;
        }

        .list {
            width: 30%;
            height: 100vh;
            overflow-y: auto;
            background: #f4f7f6;
            padding: 10px;
        }

        .card {
            background: white;
            padding: 15px;
            margin-bottom: 10px;
            border-radius: 10px;
            box-shadow: 0 2px 8px #ccc;
            cursor: pointer;
        }

        .btn {
            background: #27ae60;
            color: white;
            padding: 8px;
            border: none;
            border-radius: 5px;
        }
    </style>
</head>

<body>

<h2 style="padding:10px;">📍 Nearby Parking</h2>

<div class="container">

    <!-- 🗺️ MAP -->
    <div id="map"></div>

    <!-- 📋 LIST -->
    <div class="list">

        <c:forEach var="spot" items="${parkingSpots}">
            <div class="card" onclick="focusLocation(${spot.location.coordinates[1]}, ${spot.location.coordinates[0]})">

                <h3>${spot.name}</h3>
                <p>Slots: ${spot.availableSlots}</p>
                <p>Price: ₹${spot.pricePerHour}</p>

                <form action="BookServlet" method="POST">
                    <input type="hidden" name="parkingId" value="${spot._id}">
                    <button class="btn">Book Now</button>
                </form>

            </div>
        </c:forEach>

    </div>

</div>

<script>
let map;

function initMap() {

    let center = { lat: 30.7333, lng: 76.7794 };

    map = new google.maps.Map(document.getElementById("map"), {
        zoom: 12,
        center: center
    });

    // User location
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(pos) {
            center = {
                lat: pos.coords.latitude,
                lng: pos.coords.longitude
            };
            map.setCenter(center);

            new google.maps.Marker({
                position: center,
                map: map,
                icon: "http://maps.google.com/mapfiles/ms/icons/blue-dot.png"
            });
        });
    }

    // Markers
    <c:forEach var="spot" items="${parkingSpots}">
        new google.maps.Marker({
            position: {
                lat: ${spot.location.coordinates[1]},
                lng: ${spot.location.coordinates[0]}
            },
            map: map,
            title: "${spot.name}"
        });
    </c:forEach>
}

// 📍 Click list → focus map
function focusLocation(lat, lon) {
    map.setZoom(15);
    map.setCenter({lat: lat, lng: lon});
}
</script>

</body>
</html>
<jsp:include page="footer.jsp"/>