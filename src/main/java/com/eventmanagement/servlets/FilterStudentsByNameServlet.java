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

@WebServlet("/filterStudentsByName")
public class FilterStudentsByNameServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String studentName = req.getParameter("studentName");
        List<Student> students = new ArrayList<>();

        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT name, email FROM students WHERE name LIKE ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "%" + studentName + "%"); // Partial match
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Student student = new Student();
                student.setName(rs.getString("name"));
                student.setEmail(rs.getString("email"));
                students.add(student);
            }

            req.setAttribute("students", students); // Store data in request scope
            RequestDispatcher dispatcher = req.getRequestDispatcher("successbyName.jsp");
            dispatcher.forward(req, resp); // Forward request to JSP
            
        } catch (SQLException e) {
            e.printStackTrace();
            req.setAttribute("error", "Database error: " + e.getMessage());
            req.getRequestDispatcher("successbyName.jsp").forward(req, resp);
        }
    
	}
	
}
