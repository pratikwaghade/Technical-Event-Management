<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event Registration</title>

    <!-- Bootstrap CSS (CDN) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container mt-4">
        <h2 class="text-center text-primary">Event Registration</h2>

        <!-- Success Message -->
        <% if (request.getParameter("success") != null) { %>
            <div class="alert alert-success text-center">Event added successfully!</div>
        <% } %>

        <!-- Error Message -->
        <% if (request.getParameter("error") != null) { %>
            <div class="alert alert-danger text-center">Failed to add event. Please try again.</div>
        <% } %>

        <div class="card shadow-lg p-4">
            <form action="event" method="post">
                <div class="mb-3">
                    <label class="form-label">Event Name:</label>
                    <input type="text" name="eventName" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Event Date:</label>
                    <input type="date" name="eventDate" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Location:</label>
                    <input type="text" name="location" class="form-control" required>
                </div>

                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-success">Add Event</button>
                    <a href="adminDashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
                </div>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS (Optional for interactive features) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
