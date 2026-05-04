<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Assign Delivery</title>
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body { font-family: 'Georgia', serif; background: #f4f1ea; min-height: 100vh;
      display: flex; align-items: center; justify-content: center; }
    .card { background: white; padding: 40px; border-radius: 4px;
      box-shadow: 0 2px 20px rgba(0,0,0,0.08); width: 460px; }
    h1 { font-size: 24px; color: #2d5a27; margin-bottom: 28px; }
    label { display: block; font-size: 13px; color: #555; margin-bottom: 6px; font-weight: 600; }
    input { width: 100%; padding: 10px 14px; border: 1.5px solid #ddd;
      border-radius: 4px; font-size: 15px; margin-bottom: 20px; }
    button { width: 100%; padding: 12px; background: #2d5a27; color: white;
      border: none; border-radius: 4px; font-size: 16px; cursor: pointer; }
    .back { display: block; text-align: center; margin-top: 16px;
      color: #888; text-decoration: none; font-size: 14px; }
  </style>
</head>
<body>
<div class="card">
  <h1>Assign Delivery</h1>
  <form method="post" action="${pageContext.request.contextPath}/delivery/assign">
    <label>Order ID</label>
    <input type="text" name="orderId" value="${orderId}" required />
    <label>Delivery Address</label>
    <input type="text" name="address" placeholder="Full delivery address" required />
    <button type="submit">Assign Delivery</button>
  </form>
  <a class="back" href="${pageContext.request.contextPath}/delivery/list">← Back</a>
</div>
</body>
</html>
