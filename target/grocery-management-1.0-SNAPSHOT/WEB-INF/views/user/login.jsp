<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - GroceryHub</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Georgia', serif; background: #f4f1ea; min-height: 100vh;
            display: flex; align-items: center; justify-content: center; }
        .card { background: white; padding: 48px 40px; border-radius: 4px;
            box-shadow: 0 2px 20px rgba(0,0,0,0.08); width: 380px; }
        h1 { font-size: 28px; color: #2d5a27; margin-bottom: 8px; }
        p.sub { color: #888; font-size: 14px; margin-bottom: 32px; }
        label { display: block; font-size: 13px; color: #555; margin-bottom: 6px; font-weight: 600; }
        input { width: 100%; padding: 10px 14px; border: 1.5px solid #ddd; border-radius: 4px;
            font-size: 15px; margin-bottom: 20px; transition: border 0.2s; }
        input:focus { outline: none; border-color: #2d5a27; }
        button { width: 100%; padding: 12px; background: #2d5a27; color: white;
            border: none; border-radius: 4px; font-size: 16px; cursor: pointer; }
        button:hover { background: #1e3d1a; }
        .error { background: #fdf0f0; border: 1px solid #e88; color: #c33;
            padding: 10px 14px; border-radius: 4px; margin-bottom: 20px; font-size: 14px; }
        .link { text-align: center; margin-top: 20px; font-size: 14px; color: #888; }
        .link a { color: #2d5a27; text-decoration: none; font-weight: 600; }
    </style>
</head>
<body>
<div class="card">
    <h1>🛒 GroceryHub</h1>
    <p class="sub">Sign in to your account</p>

    <% if (request.getAttribute("error") != null) { %>
    <div class="error">${error}</div>
    <% } %>

    <form method="post" action="${pageContext.request.contextPath}/users/login">
        <label>Username</label>
        <input type="text" name="username" placeholder="Enter username" required />
        <label>Password</label>
        <input type="password" name="password" placeholder="Enter password" required />
        <button type="submit">Sign In</button>
    </form>
    <div class="link">Don't have an account? <a href="${pageContext.request.contextPath}/users/register">Register</a></div>
</div>
</body>
</html>