package com.eventmanagement.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eventmanagement.utils.DBConnection;

@WebServlet("/viewAllStudents")
public class StudentListServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<List<String>> students = new ArrayList<>();

        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT s.name, s.email, e.event_name " +
                         "FROM students s " +
                         "JOIN events e ON s.event_id = e.id";  // Join students with events
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                List<String> studentData = new ArrayList<>();
                studentData.add(rs.getString("name"));
                studentData.add(rs.getString("email"));
                studentData.add(rs.getString("event_name"));
                students.add(studentData);
            }

            req.setAttribute("students", students);  // Forward list to JSP
            RequestDispatcher dispatcher = req.getRequestDispatcher("/studentsList.jsp");
            dispatcher.forward(req, resp);

        } catch (SQLException e) {
            e.printStackTrace();
            resp.getWriter().println("<p style='color:red;'>Database error: " + e.getMessage() + "</p>");
        }
	}
}
