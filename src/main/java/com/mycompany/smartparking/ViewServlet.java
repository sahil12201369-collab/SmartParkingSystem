package com.mycompany.smartparking;

import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;

import org.bson.Document;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/ViewServlet")
public class ViewServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 🔐 Get existing session (safe)
        HttpSession session = request.getSession(false);

        // 🔐 Check login
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String user = (String) session.getAttribute("user");

        try {
            MongoDatabase db = MongoDBConnection.getDatabase();

            // ✅ Fetch bookings using correct field
            ArrayList<Document> list = db.getCollection("bookings")
                    .find(Filters.eq("username", user))
                    .into(new ArrayList<>());

            // ✅ Send to JSP
            request.setAttribute("userBookings", list);

            // If JSP inside WEB-INF
            request.getRequestDispatcher("WEB-INF/dashboard.jsp")
                   .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("dashboard.jsp?error=server");
        }
    }
}