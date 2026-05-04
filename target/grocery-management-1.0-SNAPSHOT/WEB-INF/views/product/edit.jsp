<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.yourteam.grocerymanagement.model.Product" %>
<!DOCTYPE html>
<html>
<head>
  <title>Edit Product</title>
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body { font-family: 'Georgia', serif; background: #f4f1ea; min-height: 100vh;
      display: flex; align-items: center; justify-content: center; }
    .card { background: white; padding: 40px; border-radius: 4px;
      box-shadow: 0 2px 20px rgba(0,0,0,0.08); width: 460px; }
    h1 { font-size: 24px; color: #2d5a27; margin-bottom: 28px; }
    label { display: block; font-size: 13px; color: #555; margin-bottom: 6px; font-weight: 600; }
    input, select { width: 100%; padding: 10px 14px; border: 1.5px solid #ddd;
      border-radius: 4px; font-size: 15px; margin-bottom: 20px; }
    button { width: 100%; padding: 12px; background: #2d5a27; color: white;
      border: none; border-radius: 4px; font-size: 16px; cursor: pointer; }
    .back { display: block; text-align: center; margin-top: 16px;
      color: #888; text-decoration: none; font-size: 14px; }
  </style>
</head>
<body>
<% Product p = (Product) request.getAttribute("product"); %>
<div class="card">
  <h1>Edit Product</h1>
  <form method="post" action="${pageContext.request.contextPath}/products/update">
    <input type="hidden" name="productId" value="<%=p.getProductId()%>">
    <label>Name</label>
    <input type="text" name="name" value="<%=p.getName()%>" required />
    <label>Category</label>
    <select name="category">
      <% String[] cats = {"Vegetables","Fruits","Dairy","Bakery","Beverages","Meat & Fish","Other"};
        for (String c : cats) { %>
      <option <%=c.equals(p.getCategory())?"selected":""%>><%=c%></option>
      <% } %>
    </select>
    <label>Price (LKR)</label>
    <input type="number" name="price" step="0.01" value="<%=p.getPrice()%>" required />
    <label>Stock Quantity</label>
    <input type="number" name="stockQuantity" value="<%=p.getStockQuantity()%>" required />
    <label>Expiry Date</label>
    <input type="date" name="expiryDate" value="<%=p.getExpiryDate()%>" required />
    <button type="submit">Update Product</button>
  </form>
  <a class="back" href="${pageContext.request.contextPath}/products/list">← Back to Products</a>
</div>
</body>
</html>