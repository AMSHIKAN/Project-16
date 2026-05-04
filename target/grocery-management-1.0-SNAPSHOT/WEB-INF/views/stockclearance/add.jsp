<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Clearance Record</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Georgia', serif; background: #f4f1ea; min-height: 100vh;
            display: flex; align-items: center; justify-content: center; }
        .card { background: white; padding: 40px; border-radius: 4px;
            box-shadow: 0 2px 20px rgba(0,0,0,0.08); width: 480px; }
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
    <h1>Add Clearance Record</h1>
    <form method="post" action="${pageContext.request.contextPath}/stockclearance/add">
        <label>Product ID</label>
        <input type="text" name="productId" placeholder="e.g. P-abc123" required />
        <label>Expiry Date</label>
        <input type="date" name="expiryDate" required />
        <label>Discount Percentage</label>
        <input type="number" name="discountPercentage" step="0.1" min="0" max="100" placeholder="e.g. 20" required />
        <label>Clearance Price (LKR)</label>
        <input type="number" name="clearancePrice" step="0.01" placeholder="0.00" required />
        <label>Stock Condition</label>
        <select name="stockCondition">
            <option>Near Expiry</option>
            <option>Expired</option>
            <option>Damaged</option>
        </select>
        <label>Discount Applied?</label>
        <select name="isDiscountApplied">
            <option value="true">Yes</option>
            <option value="false">No</option>
        </select>
        <button type="submit">Add Record</button>
    </form>
    <a class="back" href="${pageContext.request.contextPath}/stockclearance/list">← Back</a>
</div>
</body>
</html>