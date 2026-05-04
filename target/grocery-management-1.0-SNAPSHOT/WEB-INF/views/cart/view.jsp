<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.yourteam.grocerymanagement.model.Cart" %>
<%@ page import="com.yourteam.grocerymanagement.model.CartItem" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Cart - GroceryHub</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Georgia', serif; background: #f4f1ea; }
        nav { background: #2d5a27; color: white; padding: 16px 32px;
            display: flex; justify-content: space-between; align-items: center; }
        nav h2 { font-size: 20px; }
        nav a { color: #a8d5a2; text-decoration: none; margin-left: 20px; font-size: 14px; }
        .container { padding: 32px; max-width: 900px; margin: 0 auto; }
        h1 { font-size: 24px; color: #2d5a27; margin-bottom: 24px; }
        table { width: 100%; background: white; border-radius: 4px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.06); border-collapse: collapse; margin-bottom: 24px; }
        th { background: #2d5a27; color: white; padding: 14px 16px; text-align: left; font-size: 13px; }
        td { padding: 12px 16px; border-bottom: 1px solid #f0ebe0; font-size: 14px; }
        .total-bar { background: white; padding: 20px 24px; border-radius: 4px;
            display: flex; justify-content: space-between; align-items: center;
            box-shadow: 0 2px 10px rgba(0,0,0,0.06); }
        .total-bar strong { font-size: 20px; color: #2d5a27; }
        .btn { padding: 8px 18px; border: none; border-radius: 4px; cursor: pointer;
            font-size: 14px; text-decoration: none; display: inline-block; }
        .btn-checkout { background: #2d5a27; color: white; padding: 12px 28px; font-size: 15px; }
        .btn-remove { background: #fdf0f0; color: #c33; }
        .btn-clear { background: #fff3e0; color: #e65100; }
        .qty-input { width: 60px; padding: 4px 8px; border: 1.5px solid #ddd; border-radius: 4px; }
        .empty { text-align: center; padding: 60px; color: #888; font-size: 18px; }
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
    <h1>Shopping Cart</h1>
    <% Cart cart = (Cart) request.getAttribute("cart");
        if (cart == null || cart.getItems().isEmpty()) { %>
    <div class="empty">🛒 Your cart is empty. <a href="${pageContext.request.contextPath}/products/list">Browse products</a></div>
    <% } else { %>
    <table>
        <tr><th>Product</th><th>Unit Price</th><th>Quantity</th><th>Subtotal</th><th>Action</th></tr>
        <% for (CartItem item : cart.getItems()) { %>
        <tr>
            <td><%=item.getProductName()%></td>
            <td>LKR <%=String.format("%.2f", item.getUnitPrice())%></td>
            <td>
                <form method="post" action="${pageContext.request.contextPath}/cart/update" style="display:inline">
                    <input type="hidden" name="productId" value="<%=item.getProductId()%>">
                    <input class="qty-input" type="number" name="quantity" value="<%=item.getQuantity()%>" min="1">
                    <button class="btn" style="background:#e8f4e8;color:#2d5a27">Update</button>
                </form>
            </td>
            <td>LKR <%=String.format("%.2f", item.getSubtotal())%></td>
            <td>
                <form method="post" action="${pageContext.request.contextPath}/cart/remove" style="display:inline">
                    <input type="hidden" name="productId" value="<%=item.getProductId()%>">
                    <button class="btn btn-remove">Remove</button>
                </form>
            </td>
        </tr>
        <% } %>
    </table>
    <div class="total-bar">
        <div>
            <strong>Total: LKR <%=String.format("%.2f", cart.getTotal())%></strong>
            <form style="display:inline;margin-left:16px" method="post" action="${pageContext.request.contextPath}/cart/clear">
                <button class="btn btn-clear">Clear Cart</button>
            </form>
        </div>
        <form method="post" action="${pageContext.request.contextPath}/orders/place">
            <button class="btn btn-checkout">Checkout →</button>
        </form>
    </div>
    <% } %>
</div>
</body>
</html>
