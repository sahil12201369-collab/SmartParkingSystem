package com.mycompany.smartparking;

import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import org.bson.Document;

import java.io.IOException;
import java.util.Arrays;

@WebServlet("/OwnerServlet")
public class OwnerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 🔐 Session check
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String ownerEmail = (String) session.getAttribute("user");

        // 🔹 Get form data
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        int slots = Integer.parseInt(request.getParameter("slots"));
        double price = Double.parseDouble(request.getParameter("price"));
        double lat = Double.parseDouble(request.getParameter("lat"));
        double lon = Double.parseDouble(request.getParameter("lon"));

        try {
            MongoDatabase db = MongoDBConnection.getDatabase();
            MongoCollection<Document> parking = db.getCollection("parking_lots");

            // ✅ Create parking document
            Document park = new Document("ownerEmail", ownerEmail)
                    .append("name", name)
                    .append("address", address)
                    .append("totalSlots", slots)
                    .append("availableSlots", slots)
                    .append("pricePerHour", price)
                    .append("location", new Document("type", "Point")
                            .append("coordinates", Arrays.asList(lon, lat)));

            parking.insertOne(park);

            response.sendRedirect("owner_dashboard.jsp?success=1");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("owner/owner_dashboard.jsp");
        }
    }
}