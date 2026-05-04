<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.yourteam.grocerymanagement.model.User" %>
<!DOCTYPE html>
<html>
<head>
  <title>Edit User</title>
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body { font-family: 'Georgia', serif; background: #f4f1ea; min-height: 100vh;
      display: flex; align-items: center; justify-content: center; }
    .card { background: white; padding: 40px; border-radius: 4px;
      box-shadow: 0 2px 20px rgba(0,0,0,0.08); width: 420px; }
    h1 { font-size: 24px; color: #2d5a27; margin-bottom: 28px; }
    label { display: block; font-size: 13px; color: #555; margin-bottom: 6px; font-weight: 600; }
    input, select { width: 100%; padding: 10px 14px; border: 1.5px solid #ddd;
      border-radius: 4px; font-size: 15px; margin-bottom: 20px; }
    button { width: 100%; padding: 12px; background: #2d5a27; color: white;
      border: none; border-radius: 4px; font-size: 16px; cursor: pointer; }
    .back { display: block; text-align: center; margin-top: 16px; color: #888;
      text-decoration: none; font-size: 14px; }
  </style>
</head>
<body>
<% User user = (User) request.getAttribute("user"); %>
<div class="card">
  <h1>Edit User</h1>
  <form method="post" action="${pageContext.request.contextPath}/users/update">
    <input type="hidden" name="userId" value="<%=user.getUserId()%>">
    <label>Username</label>
    <input type="text" name="username" value="<%=user.getUsername()%>" required />
    <label>Email</label>
    <input type="email" name="email" value="<%=user.getEmail()%>" required />
    <label>Password</label>
    <input type="password" name="password" value="<%=user.getPassword()%>" required />
    <label>Role</label>
    <select name="role">
      <option value="customer" <%="customer".equals(user.getRole())?"selected":""%>>Customer</option>
      <option value="admin" <%="admin".equals(user.getRole())?"selected":""%>>Admin</option>
    </select>
    <button type="submit">Save Changes</button>
  </form>
  <a class="back" href="${pageContext.request.contextPath}/users/list">← Back to Users</a>
</div>
</body>
</html>