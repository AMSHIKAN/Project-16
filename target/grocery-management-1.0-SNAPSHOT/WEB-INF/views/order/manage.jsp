<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.yourteam.grocerymanagement.model.Order" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Orders</title>
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
        select { padding: 6px 10px; border: 1.5px solid #ddd; border-radius: 4px; font-size: 13px; }
        .btn { padding: 6px 14px; border: none; border-radius: 4px; cursor: pointer; font-size: 13px; background: #2d5a27; color: white; }
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
    <h1>Order Management</h1>
    <table>
        <tr><th>Order ID</th><th>User ID</th><th>Date</th><th>Total</th><th>Status</th><th>Update Status</th></tr>
        <% List<Order> orders = (List<Order>) request.getAttribute("orders");
            if (orders != null) for (Order o : orders) { %>
        <tr>
            <td><%=o.getOrderId()%></td>
            <td><%=o.getUserId()%></td>
            <td><%=o.getOrderDate()%></td>
            <td>LKR <%=String.format("%.2f", o.getTotalAmount())%></td>
            <td><%=o.getStatus()%></td>
            <td>
                <form method="post" action="${pageContext.request.contextPath}/orders/updateStatus" style="display:flex;gap:8px">
                    <input type="hidden" name="orderId" value="<%=o.getOrderId()%>">
                    <select name="status">
                        <option>Pending</option>
                        <option>Processed</option>
                        <option>Shipped</option>
                        <option>Cancelled</option>
                    </select>
                    <button class="btn">Update</button>
                </form>
            </td>
        </tr>
        <% } %>
    </table>
</div>
</body>
</html>