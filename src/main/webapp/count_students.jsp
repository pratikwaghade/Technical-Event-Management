<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.eventmanagement.utils.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Count by Event</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container mt-5">
        <div class="card shadow-lg p-4">
            <h2 class="text-center text-primary">Student Count by Event</h2>

            <%
                // Retrieve student count and event ID from request attributes
                Integer studentCount = (Integer) request.getAttribute("studentCount");
                Integer eventId = (Integer) request.getAttribute("eventId");
            %>

            <div class="text-center mt-3">
                <% if (studentCount != null) { %>
                    <p class="fs-5"><strong>Event ID:</strong> <%= eventId %></p>
                    <p class="fs-4 text-success">Number of students registered: <strong><%= studentCount %></strong></p>
                <% } else { %>
                    <p class="fs-5 text-danger">Error fetching student count.</p>
                <% } %>
            </div>

            <div class="text-center mt-3">
                <a href="adminDashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS (Optional for interactive features) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
