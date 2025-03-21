<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.List, com.eventmanagement.model.Student" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Students Registered for Event</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container mt-5">
        <div class="card shadow p-4">
            <h2 class="text-center text-primary">Students Registered for the Event</h2>

            <%-- Error Message --%>
            <% if (request.getAttribute("error") != null) { %>
                <div class="alert alert-danger text-center"><%= request.getAttribute("error") %></div>
            <% } %>

            <table class="table table-bordered mt-3">
                <thead class="table-dark">
                    <tr>
                        <th>Name</th>
                        <th>Email</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Student> students = (List<Student>) request.getAttribute("students");
                        if (students == null || students.isEmpty()) {
                    %>
                        <tr>
                            <td colspan="2" class="text-center text-danger">No students registered for this event</td>
                        </tr>
                    <% 
                        } else {
                            for (Student student : students) {
                    %>
                        <tr>
                            <td><%= student.getName() %></td>
                            <td><%= student.getEmail() %></td>
                        </tr>
                    <% 
                            }
                        }
                    %>
                </tbody>
            </table>

            <div class="text-center">
                <a href="adminDashboard.jsp" class="btn btn-primary">Back to Admin Dashboard</a>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
