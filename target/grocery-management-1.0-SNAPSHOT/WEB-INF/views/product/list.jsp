<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.yourteam.grocerymanagement.model.Product" %>
<!DOCTYPE html>
<html>
<head>
  <title>Products - GroceryHub</title>
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body { font-family: 'Georgia', serif; background: #f4f1ea; }
    nav { background: #2d5a27; color: white; padding: 16px 32px;
      display: flex; justify-content: space-between; align-items: center; }
    nav h2 { font-size: 20px; }
    nav a { color: #a8d5a2; text-decoration: none; margin-left: 20px; font-size: 14px; }
    .container { padding: 32px; max-width: 1100px; margin: 0 auto; }
    .top-bar { display: flex; justify-content: space-between; align-items: center; margin-bottom: 24px; }
    h1 { font-size: 24px; color: #2d5a27; }
    .search-bar { display: flex; gap: 8px; }
    .search-bar input { padding: 9px 14px; border: 1.5px solid #ddd; border-radius: 4px; font-size: 14px; width: 220px; }
    .search-bar button, .btn-add { padding: 9px 18px; border: none; border-radius: 4px;
      cursor: pointer; font-size: 14px; }
    .search-bar button { background: #2d5a27; color: white; }
    .btn-add { background: #2d5a27; color: white; text-decoration: none; }
    table { width: 100%; background: white; border-radius: 4px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.06); border-collapse: collapse; }
    th { background: #2d5a27; color: white; padding: 14px 16px; text-align: left; font-size: 13px; }
    td { padding: 12px 16px; border-bottom: 1px solid #f0ebe0; font-size: 14px; }
    tr:last-child td { border-bottom: none; }
    .btn { padding: 6px 14px; border: none; border-radius: 4px; cursor: pointer;
      font-size: 13px; text-decoration: none; display: inline-block; margin-right: 4px; }
    .btn-edit { background: #e8f4e8; color: #2d5a27; }
    .btn-delete { background: #fdf0f0; color: #c33; }
    .btn-cart { background: #fff3e0; color: #e65100; }
    .low-stock { color: #c33; font-weight: bold; }
  </style>
</head>
<body>
<nav>
  <h2>🛒 GroceryHub</h2>
  <div>
    <a href="${pageContext.request.contextPath}/products/list">Products</a>
    <a href="${pageContext.request.contextPath}/cart">My Cart</a>
    <a href="${pageContext.request.contextPath}/orders/history">My Orders</a>
    <a href="${pageContext.request.contextPath}/users/list">Admin</a>
    <a href="${pageContext.request.contextPath}/users/logout">Logout</a>
  </div>
</nav>
<div class="container">
  <div class="top-bar">
    <h1>Product Catalogue</h1>
    <div style="display:flex;gap:12px;align-items:center">
      <form class="search-bar" method="get" action="${pageContext.request.contextPath}/products/list">
        <input type="text" name="search" placeholder="Search products..." value="${param.search}">
        <button type="submit">Search</button>
      </form>
      <a class="btn-add btn" href="${pageContext.request.contextPath}/products/add">+ Add Product</a>
    </div>
  </div>
  <table>
    <tr><th>ID</th><th>Name</th><th>Category</th><th>Price (LKR)</th><th>Stock</th><th>Expiry</th><th>Actions</th></tr>
    <% List<Product> products = (List<Product>) request.getAttribute("products");
      if (products != null) for (Product p : products) { %>
    <tr>
      <td><%=p.getProductId()%></td>
      <td><%=p.getName()%></td>
      <td><%=p.getCategory()%></td>
      <td>LKR <%=String.format("%.2f", p.getPrice())%></td>
      <td class="<%=p.getStockQuantity()<10?"low-stock":""%>"><%=p.getStockQuantity()%></td>
      <td><%=p.getExpiryDate()%></td>
      <td>
        <form style="display:inline" method="post" action="${pageContext.request.contextPath}/cart/add">
          <input type="hidden" name="productId" value="<%=p.getProductId()%>">
          <input type="hidden" name="quantity" value="1">
          <button class="btn btn-cart">Add to Cart</button>
        </form>
        <a class="btn btn-edit" href="${pageContext.request.contextPath}/products/edit?id=<%=p.getProductId()%>">Edit</a>
        <form style="display:inline" method="post" action="${pageContext.request.contextPath}/products/delete">
          <input type="hidden" name="productId" value="<%=p.getProductId()%>">
          <button class="btn btn-delete" onclick="return confirm('Delete product?')">Delete</button>
        </form>
      </td>
    </tr>
    <% } %>
  </table>
</div>
</body>
</html>
