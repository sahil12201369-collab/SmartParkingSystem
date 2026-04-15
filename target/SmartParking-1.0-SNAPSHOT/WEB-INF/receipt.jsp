<%@page import="org.bson.Document"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Booking Confirmed</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light d-flex align-items-center justify-content-center" style="height: 100vh;">
    <% Document b = (Document) request.getAttribute("booking"); %>
    <div class="card shadow border-0 text-center p-5" style="max-width: 450px; border-radius: 20px;">
        <div class="mb-3 text-success">
            <svg width="80" height="80" fill="currentColor" viewBox="0 0 16 16"><path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/></svg>
        </div>
        <h2 class="fw-bold">Awesome!</h2>
        <p class="text-muted">Your parking spot at <strong><%= b.getString("parkingName") %></strong> is reserved.</p>
        <hr>
        <div class="text-start small mb-4">
            <p class="mb-1"><strong>Transaction ID:</strong> <%= b.get("_id") %></p>
            <p class="mb-1"><strong>User:</strong> <%= b.getString("userEmail") %></p>
        </div>
        <a href="ViewServlet" class="btn btn-primary w-100 py-2 rounded-pill">View My Dashboard</a>
    </div>
</body>
</html>