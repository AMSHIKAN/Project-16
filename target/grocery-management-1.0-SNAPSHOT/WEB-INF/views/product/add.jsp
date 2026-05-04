<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Product</title>
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
<div class="card">
    <h1>Add New Product</h1>
    <form method="post" action="${pageContext.request.contextPath}/products/add">
        <label>Product Name</label>
        <input type="text" name="name" placeholder="e.g. Fresh Tomatoes" required />
        <label>Category</label>
        <select name="category">
            <option>Vegetables</option>
            <option>Fruits</option>
            <option>Dairy</option>
            <option>Bakery</option>
            <option>Beverages</option>
            <option>Meat & Fish</option>
            <option>Other</option>
        </select>
        <label>Price (LKR)</label>
        <input type="number" name="price" step="0.01" placeholder="0.00" required />
        <label>Stock Quantity</label>
        <input type="number" name="stockQuantity" placeholder="0" required />
        <label>Expiry Date</label>
        <input type="date" name="expiryDate" required />
        <button type="submit">Add Product</button>
    </form>
    <a class="back" href="${pageContext.request.contextPath}/products/list">← Back to Products</a>
</div>
</body>
</html>
