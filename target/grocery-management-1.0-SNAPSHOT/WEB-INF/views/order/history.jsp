<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.yourteam.grocerymanagement.model.Order" %>
<!DOCTYPE html>
<html>
<head>
  <title>Order History</title>
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
    .badge { padding: 4px 10px; border-radius: 12px; font-size: 12px; font-weight: 600; }
    .badge-pending { background: #fff3e0; color: #e65100; }
    .badge-processed { background: #e8f4e8; color: #2d5a27; }
    .badge-shipped { background: #e3f2fd; color: #1565c0; }
    .badge-cancelled { background: #fdf0f0; color: #c33; }
    .btn { padding: 6px 14px; border: none; border-radius: 4px; cursor: pointer; font-size: 13px; }
    .btn-cancel { background: #fdf0f0; color: #c33; }
  </style>
</head>
<body>
<nav>
  <h2>🛒 GroceryHub</h2>
  <div>
    <a href="${pageContext.request.contextPath}/products/list">Products</a>
    <a href="${pageContext.request.contextPath}/cart">My Cart</a>
    <a href="${pageContext.request.contextPath}/orders/history">My Orders</a>
    <a href="${pageContext.request.contextPath}/users/logout">Logout</a>
  </div>
</nav>
<div class="container">
  <h1>Order History</h1>
  <table>
    <tr><th>Order ID</th><th>Date</th><th>Items</th><th>Total</th><th>Status</th><th>Action</th></tr>
    <% List<Order> orders = (List<Order>) request.getAttribute("orders");
      if (orders != null) for (Order o : orders) { %>
    <tr>
      <td><%=o.getOrderId()%></td>
      <td><%=o.getOrderDate()%></td>
      <td><%=o.getItems().size()%> item(s)</td>
      <td>LKR <%=String.format("%.2f", o.getTotalAmount())%></td>
      <td><span class="badge badge-<%=o.getStatus().toLowerCase()%>"><%=o.getStatus()%></span></td>
      <td>
        <% if ("Pending".equals(o.getStatus())) { %>
        <form method="post" action="${pageContext.request.contextPath}/orders/cancel" style="display:inline">
          <input type="hidden" name="orderId" value="<%=o.getOrderId()%>">
          <button class="btn btn-cancel" onclick="return confirm('Cancel order?')">Cancel</button>
        </form>
        <% } %>
      </td>
    </tr>
    <% } %>
  </table>
</div>
</body>
</html>