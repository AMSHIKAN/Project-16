<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard - Grocery Management</title>
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
        .cards {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }
        .card {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            width: 200px;
            text-align: center;
            text-decoration: none;
            color: #333;
        }
        .card:hover {
            background-color: #4CAF50;
            color: white;
            transform: scale(1.05);
        }
        .card h3 { margin: 10px 0; }
        .card p { font-size: 30px; margin: 0; }
        .logout {
            text-align: center;
            margin-top: 20px;
        }
        .logout a {
            background-color: #f44336;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
        }
    </style>
</head>
<body>

<div class="header">
    <h1>🛒 Grocery Management System</h1>
    <p>Welcome, <strong>${user.userId}</strong>!
    Role: <strong>${user.role}</strong></p>
</div>

<div class="cards">
    <a href="/users/list" class="card">
        <p>👥</p>
        <h3>Manage Users</h3>
    </a>
    <a href="/products" class="card">
        <p>🛍️</p>
        <h3>Products</h3>
    </a>
    <a href="/orders" class="card">
        <p>📦</p>
        <h3>Orders</h3>
    </a>
    <a href="/cart" class="card">
        <p>🛒</p>
        <h3>Cart</h3>
    </a>
    <a href="/delivery" class="card">
        <p>🚚</p>
        <h3>Delivery</h3>
    </a>
    <a href="/clearance" class="card">
        <p>🏷️</p>
        <h3>Clearance</h3>
    </a>
</div>

<div class="logout">
    <a href="/users/login">Logout</a>
</div>

</body>
</html>