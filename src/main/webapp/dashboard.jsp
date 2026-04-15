<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<jsp:include page="header.jsp"/>
<% 
    if(session == null || !"USER".equals(session.getAttribute("role"))) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>
    <link rel="stylesheet" href="css/style.css">

    <style>
        body {
            font-family: 'Segoe UI';
            background: #f4f7f6;
            margin: 0;
        }

        .header {
            background: #667eea;
            color: white;
            padding: 15px;
            text-align: center;
            position: relative;
        }

        .logout {
            position: absolute;
            right: 20px;
            top: 15px;
            color: white;
            text-decoration: none;
        }

        .container {
            padding: 20px;
            max-width: 900px;
            margin: auto;
        }

        .btn {
            padding: 10px 15px;
            background: #27ae60;
            color: white;
            border-radius: 5px;
            text-decoration: none;
            margin-right: 10px;
        }

        .card {
            background: white;
            padding: 20px;
            border-radius: 10px;
            margin-top: 20px;
            box-shadow: 0 2px 10px #ccc;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }

        th {
            background: #eee;
        }

        .cancel-btn {
            background: red;
            color: white;
            border: none;
            padding: 8px 12px;
            border-radius: 5px;
            cursor: pointer;
        }

        .status-confirmed {
            color: green;
            font-weight: bold;
        }

        .status-cancelled {
            color: red;
            font-weight: bold;
        }

        .message {
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 10px;
        }

        .success {
            background: #d4edda;
            color: #155724;
        }

        .error {
            background: #f8d7da;
            color: #721c24;
        }

    </style>
</head>

<body>

<div class="header">
    Welcome, ${sessionScope.user}
    <a href="LogoutServlet" class="logout">Logout</a>
</div>

<div class="container">

    <!-- 🔔 Messages -->
    <c:if test="${param.success == 'cancel'}">
        <div class="message success">Booking cancelled successfully!</div>
    </c:if>

    <c:if test="${param.error != null}">
        <div class="message error">Something went wrong!</div>
    </c:if>

    <!-- 🔍 Actions -->
    <div>
        <a href="SearchServlet" class="btn">🔍 Search Parking</a>
        <a href="DashboardServlet" class="btn">🔄 Refresh</a>
    </div>

    <!-- 📖 Bookings -->
    <div class="card">
        <h3>📖 My Bookings</h3>

        <table>
            <thead>
                <tr>
                    <th>Parking</th>
                    <th>Date</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>

            <tbody>

                <c:choose>

                    <c:when test="${not empty userBookings}">
                        <c:forEach var="b" items="${userBookings}">

                            <tr>
                                <td>${b.parkingName}</td>
                                <td>${b.bookingDate}</td>

                                <td>
                                    <c:choose>
                                        <c:when test="${b.status == 'CONFIRMED'}">
                                            <span class="status-confirmed">CONFIRMED</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="status-cancelled">CANCELLED</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>

                                <td>
                                    <c:if test="${b.status == 'CONFIRMED'}">
                                        <form action="DeleteServlet" method="POST">
                                            <input type="hidden" name="id" value="${b._id}">
                                            <button class="cancel-btn">Cancel</button>
                                        </form>
                                    </c:if>
                                </td>
                            </tr>

                        </c:forEach>
                    </c:when>

                    <c:otherwise>
                        <tr>
                            <td colspan="4" style="text-align:center;">
                                No bookings found
                            </td>
                        </tr>
                    </c:otherwise>

                </c:choose>

            </tbody>
        </table>
    </div>

</div>

</body>
</html>
<jsp:include page="footer.jsp"/>