package com.mycompany.smartparking;

import com.mongodb.client.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import org.bson.Document;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String latStr = request.getParameter("lat");
        String lonStr = request.getParameter("lon");

        try {
            MongoDatabase db = MongoDBConnection.getDatabase();
            MongoCollection<Document> collection = db.getCollection("parking_lots");

            List<Document> parkingSpots;

            // 📍 If location provided → find nearby
            if (latStr != null && lonStr != null) {

                double lat = Double.parseDouble(latStr);
                double lon = Double.parseDouble(lonStr);

                parkingSpots = collection.find(
                        new Document("location",
                                new Document("$near",
                                        new Document("$geometry",
                                                new Document("type", "Point")
                                                        .append("coordinates", Arrays.asList(lon, lat))
                                        ).append("$maxDistance", 5000)
                                )
                        )
                ).into(new ArrayList<>());

            } else {
                // fallback → show all
                parkingSpots = collection.find().into(new ArrayList<>());
            }

            request.setAttribute("parkingSpots", parkingSpots);
            request.getRequestDispatcher("map.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("dashboard.jsp?error=map");
        }
    }
}