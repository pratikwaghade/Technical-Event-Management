<%@ page import="java.sql.*, com.eventmanagement.utils.DBConnection" %>
<%
    HttpSession sessionAdmin = request.getSession(false);
    if (sessionAdmin == null || sessionAdmin.getAttribute("admin") == null) {
        response.sendRedirect("adminLogin.jsp"); // Redirect to login if session is null
        return;
    }
%>

<%
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  response.setHeader("Pragma", "no-cache");
  response.setHeader("Expires", "0");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Admin Dashboard</a>

            <div class="d-flex">
                <a href="eventRegistration.jsp" class="btn btn-success me-2">Register New Event</a>
                <a href="logout" class="btn btn-danger">Logout</a>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <h3 class="text-secondary">Manage Events</h3>

        <!-- Events Table -->
        <div class="table-responsive">
            <table class="table table-bordered table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>Event Name</th>
                        <th>Event Date</th>
                        <th>Location</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        try {
                            Connection conn = DBConnection.getConnection();
                            String sql = "SELECT id, event_name, event_date, location FROM events";
                            PreparedStatement pstmt = conn.prepareStatement(sql);
                            ResultSet rs = pstmt.executeQuery();
                            
                            while (rs.next()) {
                    %>
                                <tr>
                                    <td><%= rs.getString("event_name") %></td>
                                    <td><%= rs.getString("event_date") %></td>
                                    <td><%= rs.getString("location") %></td>
                                    <td>
                                        <a href="editEvent.jsp?id=<%= rs.getInt("id") %>" class="btn btn-warning btn-sm">Edit</a>
                                        <a href="deleteEvent?id=<%= rs.getInt("id") %>" class="btn btn-danger btn-sm">Delete</a>
                                        <a href="countStudents?id=<%= rs.getInt("id") %>" class="btn btn-info btn-sm">Count Students</a>
                                    </td>
                                </tr>
                    <% 
                            }
                            rs.close();
                            pstmt.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    %>
                </tbody>
            </table>
        </div>

        <!-- Additional Links -->
        <div class="text-center mt-4">
            <a href="viewAllStudents" class="btn btn-primary">View All Students</a>
            <a href="filter_students_by_name.jsp" class="btn btn-secondary">Filter Students by Name</a>
            <a href="filter_students_by_event.jsp" class="btn btn-secondary">Filter Students by Event</a>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
