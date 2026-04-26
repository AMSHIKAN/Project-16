<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.yourteam.grocerymanagement.model.User" %>
<!DOCTYPE html>
<html>
<head>
    <title>Users - Grocery Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .header {
            background-color: #4CAF50;
            color: white;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        th {
            background-color: #4CAF50;
            color: white;
            padding: 12px;
            text-align: left;
        }
        td { padding: 12px; border-bottom: 1px solid #ddd; }
        tr:hover { background-color: #f5f5f5; }
        .btn {
            padding: 6px 12px;
            border-radius: 5px;
            text-decoration: none;
            color: white;
            margin: 2px;
        }
        .btn-edit { background-color: #2196F3; }
        .btn-delete { background-color: #f44336; }
        .btn-back {
            background-color: #4CAF50;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            color: white;
            display: inline-block;
            margin-bottom: 20px;
        }
        .message { color: green; text-align: center; }
    </style>
</head>
<body>

<div class="header">
    <h1>👥 User Management</h1>
</div>

<a href="/users/register" class="btn-back">➕ Add New User</a>
<a href="/" class="btn-back" style="background-color:#666; margin-left:10px;">
    🏠 Dashboard</a>

<% if(request.getAttribute("message") != null) { %>
    <p class="message">${message}</p>
<% } %>

<table>
    <tr>
        <th>User ID</th>
        <th>Email</th>
        <th>Role</th>
        <th>Actions</th>
    </tr>
    <%
        List<User> users = (List<User>) request.getAttribute("users");
        if(users != null) {
            for(User user : users) {
    %>
    <tr>
        <td><%= user.getUserId() %></td>
        <td><%= user.getEmail() %></td>
        <td><%= user.getRole() %></td>
        <td>
            <a href="/users/update/<%= user.getUserId() %>"
               class="btn btn-edit">✏️ Edit</a>
            <a href="/users/delete/<%= user.getUserId() %>"
               class="btn btn-delete"
               onclick="return confirm('Are you sure?')">🗑️ Delete</a>
        </td>
    </tr>
    <%
            }
        }
    %>
</table>

</body>
</html>