package com.example.web;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Pattern EMAIL = Pattern.compile("^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$");

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String name = value(request, "userName");
        String email = value(request, "userEmail");
        String password = request.getParameter("password");
        String confirmation = request.getParameter("confirmPassword");
        String error = validate(name, email, password, confirmation, request.getParameter("terms"));

        if (error != null) {
            response.sendRedirect("register.jsp?error=" + URLEncoder.encode(error, StandardCharsets.UTF_8));
            return;
        }

        HttpSession session = request.getSession(true);
        session.setAttribute("loggedIn", Boolean.TRUE);
        session.setAttribute("userName", name);
        session.setAttribute("userEmail", email);
        response.sendRedirect("index.jsp?message=Registration successful");
    }

    private String value(HttpServletRequest request, String name) {
        String value = request.getParameter(name);
        return value == null ? "" : value.trim();
    }

    private String validate(String name, String email, String password, String confirmation, String terms) {
        if (name.isEmpty() || name.length() > 80) return "Name is required and must be at most 80 characters.";
        if (email.length() > 120 || !EMAIL.matcher(email).matches()) return "Enter a valid email address.";
        if (password == null || password.length() < 8) return "Password must contain at least 8 characters.";
        if (!password.equals(confirmation)) return "Passwords do not match.";
        if (!"yes".equals(terms)) return "Accept the terms to continue.";
        return null;
    }
}
