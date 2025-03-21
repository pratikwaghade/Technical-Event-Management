package com.eventmanagement.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

import com.eventmanagement.utils.DBConnection;

@WebServlet("/countStudents")
public class CountStudentsServlet extends HttpServlet
{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        int eventId = Integer.parseInt(req.getParameter("id"));
        int studentCount = 0;

        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT COUNT(*) AS student_count FROM students WHERE event_id = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, eventId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                studentCount = rs.getInt("student_count");
            }

            // Store the count in the request attribute
            req.setAttribute("studentCount", studentCount);
            req.setAttribute("eventId", eventId);

            // Forward to the JSP page to display the count
            RequestDispatcher dispatcher = req.getRequestDispatcher("count_students.jsp");
            dispatcher.forward(req, resp);

        } 
        catch (SQLException e)
        {
            e.printStackTrace();
            resp.getWriter().println("Error fetching student count: " + e.getMessage());
        }
    }
}
