package com.mycompany.smartparking;

import com.mongodb.client.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import org.bson.Document;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        // ✅ Basic validation
        if (name == null || email == null || password == null ||
            name.isEmpty() || email.isEmpty() || password.isEmpty()) {

            response.sendRedirect("signup.jsp?error=empty");
            return;
        }

        try {
            MongoDatabase db = MongoDBConnection.getDatabase();
            MongoCollection<Document> users = db.getCollection("users");

            // ✅ Check if user already exists
            Document existing = users.find(new Document("email", email)).first();

            if (existing != null) {
                response.sendRedirect("signup.jsp?error=exists");
                return;
            }

            // 🔐 Hash password (correct way)
            String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

            // ✅ Create user
            Document user = new Document("name", name)
                    .append("email", email)
                    .append("password", hashedPassword)
                    .append("role", role);

            users.insertOne(user);

            // ✅ Redirect to login
            response.sendRedirect("login.jsp?success=registered");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("signup.jsp?error=server");
        }
    }
}