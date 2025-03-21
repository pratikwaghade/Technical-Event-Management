<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, com.eventmanagement.utils.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Registration</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow p-4">
                    <h2 class="text-center text-primary">Student Registration</h2>

                    <!-- Success Message -->
                    <% if (request.getParameter("success") != null) { %>
                        <div class="alert alert-success text-center">Student registered successfully!</div>
                    <% } %>

                    <!-- Error Message -->
                    <% if (request.getParameter("error") != null) { %>
                        <div class="alert alert-danger text-center">Failed to register student.</div>
                    <% } %>

                    <!-- Registration Form -->
                    <form action="registerStudent" method="post">
                        <div class="mb-3">
                            <label class="form-label">Student Name</label>
                            <input type="text" name="studentName" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="email" name="email" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Event</label>
                            <select name="eventId" class="form-select" required>
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
                            <button type="submit" class="btn btn-success">Register</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS (Optional) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
