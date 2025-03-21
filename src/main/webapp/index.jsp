<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event Management System</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light d-flex align-items-center justify-content-center vh-100">

    <div class="container text-center bg-white p-4 rounded shadow-lg">
        <h1 class="text-primary mb-4">Welcome to the Event Management System</h1>
        
        <!-- Admin Section -->
        <div class="mb-4">
            <h3 class="text-secondary">Admin Section</h3>
            <a href="adminLogin.jsp" class="btn btn-dark">Login as Admin</a>
        </div>

        <hr>

        <!-- Student Section -->
        <div>
            <h3 class="text-secondary">Student Section</h3>
            <a href="studentRegistration.jsp" class="btn btn-success">Register for an Event</a>
        </div>
    </div>

    <!-- Bootstrap JS (Optional for interactive components) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
