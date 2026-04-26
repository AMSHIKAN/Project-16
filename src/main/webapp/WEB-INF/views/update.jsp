<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.yourteam.grocerymanagement.model.User" %>
<%@ page import="com.yourteam.grocerymanagement.model.Customer" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update User - Grocery Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            width: 350px;
        }
        h2 { text-align: center; color: #333; }
        input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #2196F3;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover { background-color: #1976D2; }
        .error { color: red; text-align: center; }
        .link { text-align: center; margin-top: 10px; }
        a { color: #2196F3; }
    </style>
</head>
<body>
<div class="container">
    <h2>✏️ Update User</h2>

    <% if(request.getAttribute("error") != null) { %>
        <p class="error">${error}</p>
    <% } %>

    <%
        User user = (User) request.getAttribute("user");
        Customer customer = null;
        if(user instanceof Customer) {
            customer = (Customer) user;
        }
    %>

    <form action="/users/update" method="post">
        <input type="text" name="userId"
               value="<%= user != null ? user.getUserId() : "" %>"
               readonly/>
        <input type="password" name="password"
               placeholder="New Password"
               value="<%= user != null ? user.getPassword() : "" %>"
               required/>
        <input type="email" name="email"
               placeholder="Email"
               value="<%= user != null ? user.getEmail() : "" %>"
               required/>
        <input type="text" name="customerName"
               placeholder="Full Name"
               value="<%= customer != null ? customer.getCustomerName() : "" %>"
               required/>
        <input type="text" name="phoneNumber"
               placeholder="Phone Number"
               value="<%= customer != null ? customer.getPhoneNumber() : "" %>"
               required/>
        <input type="text" name="address"
               placeholder="Address"
               value="<%= customer != null ? customer.getAddress() : "" %>"
               required/>
        <button type="submit">Update User</button>
    </form>

    <div class="link">
        <a href="/users/list">← Back to Users</a>
    </div>
</div>
</body>
</html>