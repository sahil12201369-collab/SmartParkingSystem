package com.mycompany.smartparking;

import com.mongodb.client.*;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Sorts;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import org.bson.Document;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/DashboardServlet")
public class DashboardServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String user = (String) session.getAttribute("user");

        try (MongoClient client = MongoClients.create("mongodb://localhost:27017")) {

            MongoDatabase db = client.getDatabase("SmartParkingDB");
            MongoCollection<Document> collection = db.getCollection("bookings");

            List<Document> bookings = collection
                    .find(Filters.eq("username", user))
                    .sort(Sorts.descending("bookingDate"))
                    .into(new ArrayList<>());

            request.setAttribute("userBookings", bookings);
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("dashboard.jsp?error=server");
        }
    }
}