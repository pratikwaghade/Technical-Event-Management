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

@WebServlet("/event")
public class EventServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String eventName = req.getParameter("eventName");
        String eventDate = req.getParameter("eventDate");
        String location = req.getParameter("location");

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO events (event_name, event_date, location) VALUES (?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, eventName);
            pstmt.setString(2, eventDate);
            pstmt.setString(3, location);

            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
                resp.sendRedirect("eventRegistration.jsp?success=true");
            } else {
                resp.sendRedirect("eventRegistration.jsp?error=true");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("eventRegistration.jsp?error=true");
        }
    }
}
