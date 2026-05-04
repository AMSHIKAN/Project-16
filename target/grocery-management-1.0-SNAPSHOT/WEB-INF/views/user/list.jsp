<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.yourteam.grocerymanagement.model.User" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Management</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Georgia', serif; background: #f4f1ea; }
        nav { background: #2d5a27; color: white; padding: 16px 32px;
            display: flex; justify-content: space-between; align-items: center; }
        nav h2 { font-size: 20px; }
        nav a { color: #a8d5a2; text-decoration: none; margin-left: 20px; font-size: 14px; }
        .container { padding: 32px; max-width: 1100px; margin: 0 auto; }
        h1 { font-size: 24px; color: #2d5a27; margin-bottom: 24px; }
        table { width: 100%; background: white; border-radius: 4px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.06); border-collapse: collapse; }
        th { background: #2d5a27; color: white; padding: 14px 16px; text-align: left; font-size: 13px; }
        td { padding: 12px 16px; border-bottom: 1px solid #f0ebe0; font-size: 14px; }
        tr:last-child td { border-bottom: none; }
        tr:hover td { background: #faf8f3; }
        .btn { padding: 6px 14px; border: none; border-radius: 4px; cursor: pointer;
            font-size: 13px; text-decoration: none; display: inline-block; }
        .btn-edit { background: #e8f4e8; color: #2d5a27; }
        .btn-delete { background: #fdf0f0; color: #c33; }
        .btn-delete:hover { background: #fddcdc; }
    </style>
</head>
<body>
<nav>
    <h2>🛒 GroceryHub Admin</h2>
    <div>
        <a href="${pageContext.request.contextPath}/products/list">Products</a>
        <a href="${pageContext.request.contextPath}/orders/manage">Orders</a>
        <a href="${pageContext.request.contextPath}/delivery/list">Delivery</a>
        <a href="${pageContext.request.contextPath}/users/list">Users</a>
        <a href="${pageContext.request.contextPath}/users/logout">Logout</a>
    </div>
</nav>
<div class="container">
    <h1>User Management</h1>
    <table>
        <tr>
            <th>User ID</th><th>Username</th><th>Email</th><th>Role</th><th>Actions</th>
        </tr>
        <% List<User> users = (List<User>) request.getAttribute("users");
            if (users != null) for (User u : users) { %>
        <tr>
            <td><%=u.getUserId()%></td>
            <td><%=u.getUsername()%></td>
            <td><%=u.getEmail()%></td>
            <td><%=u.getRole()%></td>
            <td>
                <a class="btn btn-edit" href="${pageContext.request.contextPath}/users/edit?id=<%=u.getUserId()%>">Edit</a>
                <form style="display:inline" method="post" action="${pageContext.request.contextPath}/users/delete">
                    <input type="hidden" name="userId" value="<%=u.getUserId()%>">
                    <button class="btn btn-delete" onclick="return confirm('Delete this user?')">Delete</button>
                </form>
            </td>
        </tr>
        <% } %>
    </table>
</div>
</body>
</html>
