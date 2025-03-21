package com.eventmanagement.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eventmanagement.utils.DBConnection;

@WebServlet("/registerStudent")
public class StudentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String studentName = req.getParameter("studentName");
        String email = req.getParameter("email");
        int eventId = Integer.parseInt(req.getParameter("eventId"));

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO students (name, email, event_id) VALUES (?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, studentName);
            pstmt.setString(2, email);
            pstmt.setInt(3, eventId);

            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
            	resp.sendRedirect("index.jsp?message=Registration Successful");
            } else {
            	resp.sendRedirect("studentRegistration.jsp?error=Failed to register student. Please try again.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("studentRegistration.jsp?error=true");
        }
    }
}
