package com.mycompany.smartparking;

import com.mongodb.client.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.bson.Document;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        MongoDatabase db = MongoDBConnection.getDatabase();

        try {
            if ("users".equals(action)) {

                ArrayList<Document> users = db.getCollection("users")
                        .find().into(new ArrayList<>());

                request.setAttribute("users", users);
                request.getRequestDispatcher("admin_users.jsp").forward(request, response);

            } else if ("parking".equals(action)) {

                ArrayList<Document> parking = db.getCollection("parking_lots")
                        .find().into(new ArrayList<>());

                request.setAttribute("parking", parking);
                request.getRequestDispatcher("admin_parking.jsp").forward(request, response);

            } else if ("analytics".equals(action)) {

                long bookings = db.getCollection("bookings").countDocuments();

                request.setAttribute("totalBookings", bookings);
                request.getRequestDispatcher("admin_analytics.jsp").forward(request, response);

            } else {
                response.sendRedirect("admin_dashboard.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin_dashboard.jsp?error=1");
        }
    }
}