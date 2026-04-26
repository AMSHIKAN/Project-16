<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Grocery Management</title>
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
        h2 {
            text-align: center;
            color: #333;
        }
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
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover { background-color: #45a049; }
        .error { color: red; text-align: center; }
        .message { color: green; text-align: center; }
        .link { text-align: center; margin-top: 10px; }
        a { color: #4CAF50; }
    </style>
</head>
<body>
<div class="container">
    <h2>🛒 Grocery Login</h2>

    <% if(request.getAttribute("error") != null) { %>
        <p class="error">${error}</p>
    <% } %>
    <% if(request.getAttribute("message") != null) { %>
        <p class="message">${message}</p>
    <% } %>

    <form action="/users/login" method="post">
        <input type="text" name="userId" placeholder="User ID" required/>
        <input type="password" name="password" placeholder="Password" required/>
        <button type="submit">Login</button>
    </form>

    <div class="link">
        <p>Don't have an account? <a href="/users/register">Register here</a></p>
    </div>
</div>
</body>
</html>