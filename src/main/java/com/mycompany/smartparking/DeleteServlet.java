package com.mycompany.smartparking;

import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Updates;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import org.bson.Document;
import org.bson.types.ObjectId;

import java.io.IOException;

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String user = (String) session.getAttribute("user");
        String bookingId = request.getParameter("id");

        try {
            MongoDatabase db = MongoDBConnection.getDatabase();

            MongoCollection<Document> bookings = db.getCollection("bookings");
            MongoCollection<Document> parking = db.getCollection("parking_lots");

            ObjectId bId = new ObjectId(bookingId);

            // 🔍 Find booking
            Document booking = bookings.find(
                    Filters.and(
                            Filters.eq("_id", bId),
                            Filters.eq("username", user),
                            Filters.eq("status", "CONFIRMED")
                    )
            ).first();

            if (booking == null) {
                response.sendRedirect("DashboardServlet?error=notfound");
                return;
            }

            ObjectId parkingId = booking.getObjectId("parkingId");

            // ❌ Cancel booking
            bookings.updateOne(
                    Filters.eq("_id", bId),
                    Updates.set("status", "CANCELLED")
            );

            // 🔄 Restore slot
            parking.updateOne(
                    Filters.eq("_id", parkingId),
                    Updates.inc("availableSlots", 1)
            );

            response.sendRedirect("DashboardServlet?success=cancel");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("DashboardServlet?error=server");
        }
    }
}