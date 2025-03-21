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

import com.eventmanagement.model.Student;
import com.eventmanagement.utils.DBConnection;

@WebServlet("/filterStudentsByEvent")
public class FilterStudentByEventServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		 int eventId = Integer.parseInt(req.getParameter("eventId"));
	        List<Student> students = new ArrayList<>();
	        String errorMessage = null;

	        try {
	            Connection conn = DBConnection.getConnection();
	            String sql = "SELECT name, email FROM students WHERE event_id=?";
	            PreparedStatement pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, eventId);
	            ResultSet rs = pstmt.executeQuery();

	            while (rs.next()) {
	                Student student = new Student();
	                student.setName(rs.getString("name"));
	                student.setEmail(rs.getString("email"));
	                students.add(student);
	            }

	            if (students.isEmpty()) {
	                errorMessage = "No students registered for this event.";
	            }

	        } catch (SQLException e) {
	            e.printStackTrace();
	            errorMessage = "Database error: " + e.getMessage();
	        }

	        req.setAttribute("students", students);
	        req.setAttribute("error", errorMessage);
	        RequestDispatcher dispatcher = req.getRequestDispatcher("successbyEvent.jsp");
	        dispatcher.forward(req, resp);
	    }
    
}
