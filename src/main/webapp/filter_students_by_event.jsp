<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*, com.eventmanagement.utils.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Filter Students by Event</title>

    <!-- Bootstrap CSS (CDN) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container mt-5">
        <div class="card shadow-lg p-4">
            <h2 class="text-center text-primary">Filter Students by Event</h2>

            <form action="filterStudentsByEvent" method="post" class="mt-3">
                <div class="mb-3">
                    <label for="eventId" class="form-label">Select Event:</label>
                    <select name="eventId" id="eventId" class="form-select" required>
                        <option value="">Select Event</option>
                        <% 
                            try {
                                Connection conn = DBConnection.getConnection();
                                String sql = "SELECT id, event_name FROM events";
                                PreparedStatement pstmt = conn.prepareStatement(sql);
                                ResultSet rs = pstmt.executeQuery();
                                while (rs.next()) {
                        %>
                                <option value="<%= rs.getInt("id") %>"><%= rs.getString("event_name") %></option>
                        <% 
                                }
                                rs.close();
                                pstmt.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        %>
                    </select>
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Filter Students</button>
                    <a href="adminDashboard.jsp" class="btn btn-secondary ms-2">Back to Dashboard</a>
                </div>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS (Optional for interactive features) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
