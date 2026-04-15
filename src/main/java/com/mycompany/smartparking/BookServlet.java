package com.mycompany.smartparking;

import com.mongodb.client.*;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Updates;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import org.bson.Document;
import org.bson.types.ObjectId;

import java.io.IOException;
import java.util.Date;

@WebServlet("/BookServlet")
public class BookServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String username = (String) session.getAttribute("user");
        String parkingId = request.getParameter("parkingId");

        try (MongoClient mongoClient = MongoClients.create("mongodb://localhost:27017")) {

            MongoDatabase db = mongoClient.getDatabase("SmartParkingDB");

            MongoCollection<Document> parkColl = db.getCollection("parking_lots");
            MongoCollection<Document> bookColl = db.getCollection("bookings");

            ObjectId objId = new ObjectId(parkingId);

            // ✅ Atomic booking (no overbooking)
            Document parking = parkColl.findOneAndUpdate(
                    Filters.and(
                            Filters.eq("_id", objId),
                            Filters.gt("availableSlots", 0)
                    ),
                    Updates.inc("availableSlots", -1)
            );

            if (parking == null) {
                response.sendRedirect("SearchServlet?error=no_slots");
                return;
            }

            // ✅ Save booking
            Document booking = new Document("username", username)
                    .append("parkingId", objId)
                    .append("parkingName", parking.getString("name"))
                    .append("bookingDate", new Date().toString())
                    .append("status", "CONFIRMED");

            bookColl.insertOne(booking);

            response.sendRedirect("DashboardServlet");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("dashboard.jsp?error=db");
        }
    }
}