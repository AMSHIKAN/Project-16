<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.yourteam.grocerymanagement.model.StockClearance" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Clearance Record</title>
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
<% StockClearance sc = (StockClearance) request.getAttribute("record"); %>
<div class="card">
    <h1>Edit Clearance Record</h1>
    <form method="post" action="${pageContext.request.contextPath}/stockclearance/update">
        <input type="hidden" name="clearanceId" value="<%=sc.getClearanceId()%>">
        <label>Product ID</label>
        <input type="text" name="productId" value="<%=sc.getProductId()%>" required />
        <label>Expiry Date</label>
        <input type="date" name="expiryDate" value="<%=sc.getExpiryDate()%>" required />
        <label>Discount Percentage</label>
        <input type="number" name="discountPercentage" step="0.1" value="<%=sc.getDiscountPercentage()%>" required />
        <label>Clearance Price (LKR)</label>
        <input type="number" name="clearancePrice" step="0.01" value="<%=sc.getClearancePrice()%>" required />
        <label>Stock Condition</label>
        <select name="stockCondition">
            <% String[] conds = {"Near Expiry","Expired","Damaged"};
                for (String c : conds) { %>
            <option <%=c.equals(sc.getStockCondition())?"selected":""%>><%=c%></option>
            <% } %>
        </select>
        <label>Discount Applied?</label>
        <select name="isDiscountApplied">
            <option value="true" <%=sc.isDiscountApplied()?"selected":""%>>Yes</option>
            <option value="false" <%=!sc.isDiscountApplied()?"selected":""%>>No</option>
        </select>
        <button type="submit">Save Changes</button>
    </form>
    <a class="back" href="${pageContext.request.contextPath}/stockclearance/list">← Back</a>
</div>
</body>
</html>
