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

@WebServlet("/edit")
public class EditServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int eventId = Integer.parseInt(req.getParameter("eventId"));
		
		String eventName = req.getParameter("eventName");
        String eventDate = req.getParameter("eventDate");
        String location = req.getParameter("location");
        
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "UPDATE events SET event_name = ?, event_date = ?, location = ? WHERE id = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, eventName);
            pstmt.setString(2, eventDate);
            pstmt.setString(3, location);
            pstmt.setInt(4, eventId);

            int rowsUpdated = pstmt.executeUpdate();
            if (rowsUpdated > 0) {
                resp.sendRedirect("adminDashboard.jsp?success=true");
            } else {
                resp.sendRedirect("adminDashboard.jsp?error=true");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("adminDashboard.jsp?error=true");
        }
	}
}
