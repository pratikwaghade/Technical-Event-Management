<%@ page import="java.sql.*, com.eventmanagement.utils.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Event</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container mt-5">
        <div class="card shadow-lg p-4">
            <h2 class="text-center text-primary">Edit Event</h2>

            <% 
                int eventId = Integer.parseInt(request.getParameter("id"));
                Connection conn = DBConnection.getConnection();

                String sql = "SELECT event_name, event_date, location FROM events WHERE id = ?";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, eventId);
                ResultSet rs = pstmt.executeQuery();

                if (rs.next()) {
            %>

            <!-- Event Edit Form -->
            <form action="edit" method="POST" class="mt-3">
                <input type="hidden" name="eventId" value="<%= eventId %>">
                
                <div class="mb-3">
                    <label for="eventName" class="form-label">Event Name:</label>
                    <input type="text" id="eventName" name="eventName" class="form-control" value="<%= rs.getString("event_name") %>" required>
                </div>

                <div class="mb-3">
                    <label for="eventDate" class="form-label">Event Date:</label>
                    <input type="date" id="eventDate" name="eventDate" class="form-control" value="<%= rs.getString("event_date") %>" required>
                </div>

                <div class="mb-3">
                    <label for="location" class="form-label">Location:</label>
                    <input type="text" id="location" name="location" class="form-control" value="<%= rs.getString("location") %>" required>
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Update Event</button>
                    <a href="adminDashboard.jsp" class="btn btn-secondary ms-2">Back to Dashboard</a>
                </div>
            </form>

            <% 
                } else {
                    out.println("<p class='text-danger text-center'>Event not found.</p>");
                }
                rs.close();
                pstmt.close();
            %>
        </div>
    </div>

    <!-- Bootstrap JS (Optional for interactive features) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
