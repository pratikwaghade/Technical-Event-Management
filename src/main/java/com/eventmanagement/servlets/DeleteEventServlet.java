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

@WebServlet("/deleteEvent")
public class DeleteEventServlet extends HttpServlet
{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		
		 int eventId = Integer.parseInt(req.getParameter("id"));
	        
	        try {
	            Connection conn = DBConnection.getConnection();
	            String sql = "DELETE FROM events WHERE id = ?";
	            PreparedStatement pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, eventId);
	            int rowsDeleted = pstmt.executeUpdate();
	            
	            	if (rowsDeleted > 0) 
	            	{
	            		resp.sendRedirect("adminDashboard.jsp?success=true");
	            	} 
	            	else 
	            	{
	            		resp.sendRedirect("adminDashboard.jsp?error=true");
	            	}
	            
	            pstmt.close();
	            
	        } 
	        catch (SQLException e)
	        {
	            e.printStackTrace();
	            resp.sendRedirect("adminDashboard.jsp?error=true");
	        }
	  }
}
