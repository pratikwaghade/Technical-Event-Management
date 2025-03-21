<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Filter Students by Name</title>

    <!-- Bootstrap CSS (CDN) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container mt-5">
        <div class="card shadow-lg p-4">
            <h2 class="text-center text-primary">Search Student by Name</h2>

            <form action="filterStudentsByName" method="post" class="mt-3">
                <div class="mb-3">
                    <label for="studentName" class="form-label">Enter Name:</label>
                    <input type="text" id="studentName" name="studentName" class="form-control" placeholder="Enter student name..." required>
                </div>
                <div class="text-center">
                    <input type="submit" value="Search" class="btn btn-primary">
                    <a href="adminDashboard.jsp" class="btn btn-secondary ms-2">Back to Dashboard</a>
                </div>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS (Optional for interactive features) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
