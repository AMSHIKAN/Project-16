<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.yourteam.grocerymanagement.model.Delivery" %>
<!DOCTYPE html>
<html>
<head>
  <title>Deliveries</title>
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
    .btn-cancel { background: #fdf0f0; color: #c33; }
    .btn-add { background: #2d5a27; color: white; text-decoration: none;
      padding: 9px 18px; border-radius: 4px; font-size: 14px; display: inline-block; margin-bottom: 20px; }
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
  <h1>Delivery Management</h1>
  <a class="btn-add" href="${pageContext.request.contextPath}/delivery/assign">+ Assign New Delivery</a>
  <table>
    <tr><th>Delivery ID</th><th>Order ID</th><th>Address</th><th>Status</th><th>Date</th><th>Actions</th></tr>
    <% List<Delivery> deliveries = (List<Delivery>) request.getAttribute("deliveries");
      if (deliveries != null) for (Delivery d : deliveries) { %>
    <tr>
      <td><%=d.getDeliveryId()%></td>
      <td><%=d.getOrderId()%></td>
      <td><%=d.getDeliveryAddress()%></td>
      <td><%=d.getStatus()%></td>
      <td><%=d.getAssignedDate()%></td>
      <td>
        <form method="post" action="${pageContext.request.contextPath}/delivery/updateStatus" style="display:inline;margin-right:8px">
          <input type="hidden" name="deliveryId" value="<%=d.getDeliveryId()%>">
          <select name="status">
            <option>Assigned</option>
            <option>Out for Delivery</option>
            <option>Delivered</option>
          </select>
          <button class="btn">Update</button>
        </form>
        <form method="post" action="${pageContext.request.contextPath}/delivery/cancel" style="display:inline">
          <input type="hidden" name="deliveryId" value="<%=d.getDeliveryId()%>">
          <button class="btn btn-cancel" onclick="return confirm('Cancel delivery?')">Cancel</button>
        </form>
      </td>
    </tr>
    <% } %>
  </table>
</div>
</body>
</html>