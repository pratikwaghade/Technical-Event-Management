<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List of Students</title>

    <!-- Bootstrap CSS (CDN) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container mt-4">
        <h2 class="text-center text-primary">List of All Students</h2>

        <div class="card shadow-lg p-4">
            <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Event</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<List<String>> students = (List<List<String>>) request.getAttribute("students");
                            if (students != null && !students.isEmpty()) {
                                for (List<String> student : students) {
                        %>
                                    <tr>
                                        <td><%= student.get(0) %></td>  <!-- Name -->
                                        <td><%= student.get(1) %></td>  <!-- Email -->
                                        <td><%= student.get(2) %></td>  <!-- Event Name -->
                                    </tr>
                        <%
                                }
                            } else {
                        %>
                                <tr>
                                    <td colspan="3" class="text-center text-muted">No students found.</td>
                                </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
            
            <div class="text-center mt-3">
                <a href="adminDashboard.jsp" class="btn btn-secondary">Back to Admin Dashboard</a>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS (Optional for interactive features) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
