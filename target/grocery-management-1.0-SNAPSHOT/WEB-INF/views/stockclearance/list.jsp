<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.yourteam.grocerymanagement.model.StockClearance" %>
<!DOCTYPE html>
<html>
<head>
  <title>Stock Clearance</title>
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
    .btn { padding: 6px 14px; border: none; border-radius: 4px; cursor: pointer;
      font-size: 13px; text-decoration: none; display: inline-block; margin-right: 4px; }
    .btn-add { background: #2d5a27; color: white; margin-bottom: 20px; display: inline-block;
      padding: 9px 18px; border-radius: 4px; text-decoration: none; font-size: 14px; }
    .btn-edit { background: #e8f4e8; color: #2d5a27; }
    .btn-delete { background: #fdf0f0; color: #c33; }
  </style>
</head>
<body>
<nav>
  <h2>🛒 GroceryHub Admin</h2>
  <div>
    <a href="${pageContext.request.contextPath}/products/list">Products</a>
    <a href="${pageContext.request.contextPath}/stockclearance/list">Stock Clearance</a>
    <a href="${pageContext.request.contextPath}/orders/manage">Orders</a>
    <a href="${pageContext.request.contextPath}/users/logout">Logout</a>
  </div>
</nav>
<div class="container">
  <h1>Stock Clearance Management</h1>
  <a class="btn-add" href="${pageContext.request.contextPath}/stockclearance/add">+ Add Clearance Record</a>
  <table>
    <tr><th>ID</th><th>Product ID</th><th>Expiry Date</th><th>Discount %</th><th>Price</th><th>Condition</th><th>Discount?</th><th>Actions</th></tr>
    <% List<StockClearance> records = (List<StockClearance>) request.getAttribute("records");
      if (records != null) for (StockClearance sc : records) { %>
    <tr>
      <td><%=sc.getClearanceId()%></td>
      <td><%=sc.getProductId()%></td>
      <td><%=sc.getExpiryDate()%></td>
      <td><%=sc.getDiscountPercentage()%>%</td>
      <td>LKR <%=String.format("%.2f", sc.getClearancePrice())%></td>
      <td><%=sc.getStockCondition()%></td>
      <td><%=sc.isDiscountApplied()?"Yes":"No"%></td>
      <td>
        <a class="btn btn-edit" href="${pageContext.request.contextPath}/stockclearance/edit?id=<%=sc.getClearanceId()%>">Edit</a>
        <form style="display:inline" method="post" action="${pageContext.request.contextPath}/stockclearance/delete">
          <input type="hidden" name="clearanceId" value="<%=sc.getClearanceId()%>">
          <button class="btn btn-delete" onclick="return confirm('Remove record?')">Delete</button>
        </form>
      </td>
    </tr>
    <% } %>
  </table>
</div>
</body>
</html>