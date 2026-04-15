package com.mycompany.smartparking;

import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import org.bson.Document;

import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String selectedRole = request.getParameter("role"); // 👈 from UI

        try {
            MongoDatabase db = MongoDBConnection.getDatabase();
            MongoCollection<Document> users = db.getCollection("users");

            // 🔍 Find user by email
            Document user = users.find(new Document("email", email)).first();

            if (user == null) {
                response.sendRedirect("login.jsp?error=invalid");
                return;
            }

            String storedPassword = user.getString("password");
            String actualRole = user.getString("role");

            // 🔐 Password check
            if (!password.equals(storedPassword)) {
                response.sendRedirect("login.jsp?error=invalid");
                return;
            }

            // 🚨 Role validation (IMPORTANT)
            if (!actualRole.equalsIgnoreCase(selectedRole)) {
                response.sendRedirect("login.jsp?error=wrongrole");
                return;
            }

            // ✅ Session
            HttpSession session = request.getSession();
            session.setAttribute("user", email);
            session.setAttribute("role", actualRole);

            // 🔥 Role-based redirect
            switch (actualRole) {

                case "USER":
                    response.sendRedirect("dashboard.jsp");
                    break;

                case "OWNER":
                    response.sendRedirect("owner_dashboard.jsp");
                    break;

                case "ADMIN":
                    response.sendRedirect("admin_dashboard.jsp");
                    break;

                default:
                    response.sendRedirect("login.jsp?error=role");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=server");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect("login.jsp");
    }
}